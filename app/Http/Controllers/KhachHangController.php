<?php

namespace App\Http\Controllers;

use App\Models\GioHang;
use App\Models\NguoiDung;
use App\Models\DonHang;
use App\Models\DonHang_ChiTiet;
use App\Mail\DatHangThanhCongEmail;
use App\Models\DanhMuc;
use App\Models\NhomThuoc;
use App\Models\Thuoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Exception;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;

class KhachHangController extends Controller
{
    public function getHome()
    {
        if (Auth::check()) {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $nguoidung = NguoiDung::find(Auth::user()->id);
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('user.home', compact('danhmucs', 'nhomthuocs', 'nguoidung', 'giohang', 'tongtien', 'slgiohang'));
        } else
            return redirect()->route('user.dangnhap');
    }

    public function getDatHang()
    {
        if (Auth::check()) {
            $nguoidung = NguoiDung::find(Auth::user()->id);
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            return view('user.dathang', compact('danhmucs', 'nhomthuocs', 'nguoidung', 'giohang', 'tongtien', 'slgiohang'));
        } else
            return redirect()->route('user.dangnhap');
    }

    public function postDatHang(Request $request)
    {
        // Kiểm tra thông tin đơn hàng
        $this->validate($request, [
            'diachigiaohang' => ['required', 'string', 'max:255'],
            'dienthoaigiaohang' => ['required', 'string', 'max:255'],
        ]);

        // Lưu thông tin đơn hàng
        $dh = new DonHang();
        $dh->nguoidung_id = Auth::user()->id;
        $dh->tinhtrang_id = 1; // Đơn hàng mới
        $dh->diachigiaohang = $request->diachigiaohang;
        $dh->dienthoaigiaohang = $request->dienthoaigiaohang;
        $dh->save();

        // Lấy thông tin giỏ hàng của người dùng
        $giohang = GioHang::where('nguoidung_id', Auth::user()->id)
            ->with('thuoc')->get();

        // Biến cờ để đánh dấu khi có sản phẩm không đủ số lượng tồn kho
        $errorFlag = false; 

        // Lưu thông tin đơn hàng chi tiết
        foreach ($giohang as $value) {
            $ct = new DonHang_ChiTiet();
            $ct->donhang_id = $dh->id;
            $ct->thuoc_id = $value->thuoc->id;
            $ct->soluongban = $value->soluong;
            $ct->dongiaban = $value->dongiaban;
            $ct->save();

            // Kiểm tra số lượng tồn kho
            if ($value->thuoc->soluong < $value->soluong) {
                // Nếu số lượng tồn kho không đủ, đánh dấu biến cờ và không tiếp tục lưu đơn hàng
                $errorFlag = true;
            }
        }

        // Nếu có ít nhất một sản phẩm không đủ số lượng tồn kho, hiển thị thông báo lỗi
        if ($errorFlag) {
            return back()->with('error', 'Số lượng một số sản phẩm không đủ. Vui lòng kiểm tra và thử lại.');
        }

        // Lưu thông tin đơn hàng chi tiết và giảm số lượng tồn kho (nếu tất cả các sản phẩm đều đủ số lượng)
        foreach ($giohang as $value) {
            $orm = Thuoc::find($value->thuoc->id);
            $orm->soluong -= $value->soluong;
            $orm->save();
        }

        // gởi mail
        try {
            Mail::to(Auth::user()->email)->send(new DatHangThanhCongEmail($dh));
        } catch (Exception $e) {
            return $e->getMessage();
        }
        // Chuyển hướng đến trang thành công
        return redirect()->route('user.dathangthanhcong');
    }

    public function getDonHang($id = '')
    {
        $nguoidung = NguoiDung::find(Auth::user()->id);
        GioHang::where('nguoidung_id', Auth::user()->id)->delete();
        $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
        $tongtien = $giohang->sum(function ($item) {
            return $item->dongiaban * $item->soluong;
        });
        $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

        $donhang = DonHang::where('nguoidung_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->with('donhang_chitiet')
            ->paginate(6);
        $tongtien = $giohang
            ->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
        $donhang_chitiet = DonHang_ChiTiet::where('donhang_id', $id)
            ->with('thuoc')
            ->first();

        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.donhang', compact('danhmucs', 'nhomthuocs', 'donhang', 'nguoidung', 'giohang', 'tongtien', 'slgiohang', 'donhang_chitiet'));
    }

    public function postDonHang(Request $request, $id)
    {
        $nguoidung = NguoiDung::find(Auth::user()->id);
        GioHang::where('nguoidung_id', Auth::user()->id)->delete();
        $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
        $tongtien = $giohang->sum(function ($item) {
            return $item->dongiaban * $item->soluong;
        });
        $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

        $donhang = DonHang::where('nguoidung_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->with('donhang_chitiet')
            ->paginate(6);
        $tongtien = $giohang
            ->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
        $donhang_chitiet = DonHang_ChiTiet::where('donhang_id', $id)
            ->with('thuoc')
            ->first();

        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.donhang', compact('danhmucs', 'nhomthuocs', 'donhang', 'nguoidung', 'giohang', 'tongtien', 'slgiohang', 'donhang_chitiet'));
    }

    public function getDatHangThanhCong()
    {
        // Xóa giỏ hàng khi hoàn tất đặt hàng?
        GioHang::where('nguoidung_id', Auth::user()->id)->delete();
        $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
        $tongtien = $giohang->sum(function ($item) {
            return $item->dongiaban * $item->soluong;
        });
        $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.dathangthanhcong', compact('danhmucs', 'nhomthuocs', 'giohang', 'tongtien', 'slgiohang'));
    }

    public function getHoSoCaNhan()
    {
        if (Auth::check()) {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $nguoidung = NguoiDung::find(Auth::user()->id);
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('user.home', compact('danhmucs', 'nhomthuocs', 'nguoidung', 'giohang', 'tongtien', 'slgiohang'));
        } else
            return redirect()->route('user.dangnhap');
    }

    public function postHoSoCaNhan(Request $request)
    {
        $id = Auth::user()->id;
        $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:nguoidung,email,' . $id],
            'password' => ['confirmed'],
            'hinhanh' => ['nullable', 'image', 'max:1024'],
            'diachi' => ['required', 'string', 'max:255'],
            'sdt' => ['required', 'string', 'max:255'],
        ]);
        $orm = NguoiDung::find($id);
        $orm->name = $request->name;
        $orm->username = Str::before($request->email, '@');
        $orm->email = $request->email;
        if (!empty($request->password)) $orm->password = Hash::make($request->password);

        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa file cũ
            $orm = NguoiDung::find($id);
            if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
            // Upload file mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Auth::user()->id . '.' . $extension;

            $path = Storage::putFileAs('nguoi-dung', $request->file('hinhanh'), $filename);
        }
        if (!empty($path))
        $orm->hinhanh = $path;

        $orm->sdt = $request->sdt;
        $orm->diachi = $request->diachi;

        $orm->save();
        return redirect()->route('user.home')->with('success', 'Đã cập nhật thông tin thành công.');
    }

    public function postDangXuat(Request $request)
    {
        // Bổ sung code tại đây
        return redirect()->route('frontend.home');
    }
}
