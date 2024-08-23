<?php

namespace App\Http\Controllers;

use App\Models\DanhMuc;
use App\Models\GioHang;
use App\Models\HangSanXuat;
use App\Models\NhomThuoc;
use App\Models\QuocGia;
use App\Models\Thuoc;
use App\Models\NguoiDung;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\ErrorHandler\ThrowableUtils;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;
use Exception;

class HomeController extends Controller
{
    public function getHome()
    {
        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('frontend.home', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'giohang', 'tongtien', 'slgiohang'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            return view('frontend.home', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia'));
        }
    }

    public function getSanPham()
    {

        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            $thuoc = Thuoc::orderBy('created_at', 'desc')->paginate(20);
            return view('frontend.sanpham', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'giohang', 'tongtien', 'slgiohang', 'thuoc'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $thuoc = Thuoc::orderBy('created_at', 'desc')->paginate(20);
            return view('frontend.sanpham', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'thuoc'));
        }
    }

    public function getDanhMuc($tendanhmuc_slug = '')
    {

        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

            if (empty($tendanhmuc_slug)) {
                $title = 'Danh mục';
                $thuoc = Thuoc::orderBy('created_at', 'desc')
                    ->paginate(20);
            } else {
                $danhmuc = DanhMuc::where('tendanhmuc_slug', $tendanhmuc_slug)
                    ->firstOrFail();
                $title = $danhmuc->tendanhmuc;
                $thuoc = Thuoc::where('danhmuc_id', $danhmuc->id)
                    ->orderBy('created_at', 'desc')
                    ->paginate(20);
            }
            return view('frontend.sanpham', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'title', 'giohang', 'tongtien', 'slgiohang', 'thuoc'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $nhomthuoc = NhomThuoc::all();
            if (empty($tendanhmuc_slug)) {
                $title = 'Danh mục';
                $thuoc = Thuoc::orderBy('created_at', 'desc')
                    ->paginate(20);
            } else {
                $danhmuc = DanhMuc::where('tendanhmuc_slug', $tendanhmuc_slug)
                    ->firstOrFail();
                $title = $danhmuc->tendanhmuc;
                $thuoc = Thuoc::where('danhmuc_id', $danhmuc->id)
                    ->orderBy('created_at', 'desc')
                    ->paginate(20);
            }

            return view('frontend.sanpham', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'title', 'thuoc'));
        }
    }

    public function getNhomThuoc($tennhomthuoc_slug = '')
    {

        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

            if (empty($tennhomthuoc_slug)) {
                $title = 'Nhóm thuốc';
                $thuoc = Thuoc::orderBy('created_at', 'desc')
                    ->paginate(20);
            } else {
                $nhomthuoc = NhomThuoc::where('tennhomthuoc_slug', $tennhomthuoc_slug)
                    ->firstOrFail();
                $title = $nhomthuoc->tennhomthuoc;
                $thuoc = Thuoc::where('nhomthuoc_id', $nhomthuoc->id)
                    ->orderBy('created_at', 'desc')
                    ->paginate(20);
            }
            return view('frontend.sanpham', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'title', 'giohang', 'tongtien', 'slgiohang', 'thuoc'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();

            if (empty($tennhomthuoc_slug)) {
                $title = 'Nhóm thuốc';
                $thuoc = Thuoc::orderBy('created_at', 'desc')
                    ->paginate(20);
            } else {
                $nhomthuoc = NhomThuoc::where('tennhomthuoc_slug', $tennhomthuoc_slug)
                    ->firstOrFail();
                $title = $nhomthuoc->tennhomthuoc;
                $thuoc = Thuoc::where('nhomthuoc_id', $nhomthuoc->id)
                    ->orderBy('created_at', 'desc')
                    ->paginate(20);
            }

            return view('frontend.sanpham', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'title', 'thuoc'));
        }
    }

    public function postTimKiem(Request $request)
    {

        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

            $tukhoa = $request->tukhoa;
            // Bổ sung code tại đây
            if (empty($tendanhmuc_slug)) {
                $title = 'Danh mục';
                $thuoc = Thuoc::orderBy('created_at', 'desc')
                    ->paginate(20);
            } else {
                $danhmuc = DanhMuc::where('tendanhmuc_slug', $tendanhmuc_slug)
                    ->firstOrFail();
                $title = $danhmuc->tendanhmuc;
                $thuoc = Thuoc::where('danhmuc_id', $danhmuc->id)
                    ->orderBy('created_at', 'desc')
                    ->paginate(20);
            }
            $timkiem = Thuoc::where('tenthuoc', 'like', '%' . $tukhoa . '%')
                ->orWhere('congdung', 'like', '%' . $tukhoa . '%')
                ->get();
            if (!$tukhoa) abort(404);

            return view('frontend.timkiem', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'giohang', 'tongtien', 'slgiohang', 'title', 'thuoc', 'timkiem'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();

            $tukhoa = $request->tukhoa;
            // Bổ sung code tại đây
            if (empty($tendanhmuc_slug)) {
                $title = 'Danh mục';
                $thuoc = Thuoc::orderBy('created_at', 'desc')
                    ->paginate(20);
            } else {
                $danhmuc = DanhMuc::where('tendanhmuc_slug', $tendanhmuc_slug)
                    ->firstOrFail();
                $title = $danhmuc->tendanhmuc;
                $thuoc = Thuoc::where('danhmuc_id', $danhmuc->id)
                    ->orderBy('created_at', 'desc')
                    ->paginate(20);
            }
            $timkiem = Thuoc::where('tenthuoc', 'like', '%' . $tukhoa . '%')
                ->orWhere('congdung', 'like', '%' . $tukhoa . '%')
                ->get();
            if (!$tukhoa) abort(404);

            return view('frontend.timkiem', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'title', 'thuoc', 'timkiem'));
        }
    }

    public function getSanPham_ChiTiet($tendanhmuc_slug = '', $tenbietduoc_slug = '')
    {

        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');

            $danhmuc = DanhMuc::where('tendanhmuc_slug', $tendanhmuc_slug)
                ->firstOrFail();
            $tenthuoc_id = explode('.', $tenbietduoc_slug);
            $tenthuoc = explode('-', $tenthuoc_id[0]);
            $thuoc_id = $tenthuoc[count($tenthuoc) - 1];
            $thuoc = Thuoc::where('id', $thuoc_id)
                ->firstOrFail();
            if (!$thuoc) abort(404);

            $thuoccungdanhmuc = Thuoc::where('danhmuc_id', $thuoc->danhmuc_id)
            ->where('id', '!=', $thuoc_id)

            ->orderBy('dongiaban', 'desc')
            ->take(6)
            ->get();

            return view('frontend.sanpham_chitiet', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'giohang', 'tongtien', 'slgiohang', 'thuoc' ,'thuoccungdanhmuc'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();

            $danhmuc = DanhMuc::where('tendanhmuc_slug', $tendanhmuc_slug)
                ->firstOrFail();
            $tenthuoc_id = explode('.', $tenbietduoc_slug);
            $tenthuoc = explode('-', $tenthuoc_id[0]);
            $thuoc_id = $tenthuoc[count($tenthuoc) - 1];
            $thuoc = Thuoc::where('id', $thuoc_id)
                ->firstOrFail();
            if (!$thuoc) abort(404);
            $thuoccungdanhmuc = Thuoc::where('danhmuc_id', $thuoc->danhmuc_id)
            ->where('id', '!=', $thuoc_id)
            ->orderBy('created_at', 'desc')
            ->take(6)
            ->get();

            return view('frontend.sanpham_chitiet', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'thuoc','thuoccungdanhmuc'));
        }
    }


    public function getBaiViet($tenchude_slug = '')
    {
        // Bổ sung code tại đây
        return view('frontend.baiviet');
    }

    public function getBaiViet_ChiTiet($tenchude_slug = '', $tieude_slug = '')
    {
        // Bổ sung code tại đây
        return view('frontend.baiviet_chitiet');
    }
    public function getGioHang()
    {
        // Bổ sung code tại đây
        return view('frontend.giohang');
    }
    public function getGioHang_Them($tensanpham_slug = '')
    {
        // Bổ sung code tại đây
        return redirect()->route('frontend.home');
    }
    public function getGioHang_Xoa($row_id)
    {
        // Bổ sung code tại đây
        return redirect()->route('frontend.giohang');
    }
    public function getGioHang_Giam($row_id)
    {
        // Bổ sung code tại đây
        return redirect()->route('frontend.giohang');
    }
    public function getGioHang_Tang($row_id)
    {
        // Bổ sung code tại đây
        return redirect()->route('frontend.giohang');
    }
    public function postGioHang_CapNhat(Request $request)
    {
        // Bổ sung code tại đây
        return redirect()->route('frontend.giohang');
    }
    public function getTuyenDung()
    {
        return view('frontend.tuyendung');
    }
    public function getLienHe()
    {

        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('user.lienhe', compact('danhmucs', 'nhomthuocs', 'giohang', 'tongtien', 'slgiohang'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            return view('user.lienhe', compact('danhmucs', 'nhomthuocs'));
        }

    }
    // Trang đăng ký dành cho khách hàng
    public function getDangKy()
    {
        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.dangky', compact('danhmucs', 'nhomthuocs'));
    }
    // Trang đăng nhập dành cho khách hàng
    public function getDangNhap()
    {
        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.dangnhap', compact('danhmucs', 'nhomthuocs'));
    }
    public function getQuenMatKhau()
    {
        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.quenmatkhau', compact('danhmucs', 'nhomthuocs'));
    }
    public function getDoiMatKhau()
    {
        $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
        return view('user.doimatkhau', compact('danhmucs', 'nhomthuocs'));
    }

    public function getGoogleLogin()
    {
        return Socialite::driver('google')->redirect();
    }
    public function getGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')
                /* ->setHttpClient(new \GuzzleHttp\Client(['verify' => false]))
                ->stateless() */
                ->user();
        } catch (Exception $e) {
            return redirect()->route('user.dangnhap')->with('warning', 'Lỗi xác thực. Xin vui lòng thử lại!');
        }
        $existingUser = NguoiDung::where('email', $user->email)->first();
        if ($existingUser) {
            // Nếu người dùng đã tồn tại thì đăng nhập
            Auth::login($existingUser, true);
            return redirect()->route('user.home');
        } else {
            // Nếu chưa tồn tại người dùng thì thêm mới
            $newUser = NguoiDung::create([
                'name' => $user->name,
                'email' => $user->email,
                'username' => Str::before($user->email, '@'),
                'password' => Hash::make('Nhutren123'), // Gán mật khẩu tự do
            ]); // Sau đó đăng nhập
            Auth::login($newUser, true);
            return redirect()->route('user.home');
        }
    }



    public function get404()
    {
        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('errors.404', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'giohang', 'tongtien', 'slgiohang'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            return view('errors.404', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia'));
        }
    }


    public function get403()
    {
        if (Auth::check()) {
            // Bổ sung code tại đây
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('errors.403', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia', 'giohang', 'tongtien', 'slgiohang'));
        } else {
            $danhmucs = DanhMuc::all();
            $nhomthuocs = NhomThuoc::all();
            $danhmuc = DanhMuc::all();
            $nhomthuoc = NhomThuoc::all();
            $hangsanxuat = HangSanXuat::all();
            $quocgia = QuocGia::all();
            return view('errors.403', compact('danhmucs', 'nhomthuocs', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia'));
        }
    }
}
