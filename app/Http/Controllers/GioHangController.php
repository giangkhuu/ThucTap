<?php

namespace App\Http\Controllers;

use App\Models\DanhMuc;
use App\Models\GioHang;
use App\Models\NhomThuoc;
use App\Models\Thuoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GioHangController extends Controller
{
    public function getGioHang()
    {

        
        $danhnhap = GioHang::where('nguoidung_id', Auth::user()->id)
            ->first();
        if ($danhnhap) {
            $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
            $giohang = GioHang::where('nguoidung_id', Auth::user()->id)->with('thuoc')->get();
            $tongtien = $giohang->sum(function ($item) {
                return $item->dongiaban * $item->soluong;
            });
            $slgiohang = GioHang::where('nguoidung_id', Auth::user()->id)->sum('soluong');
            return view('user.giohang', compact('danhmucs', 'nhomthuocs','giohang', 'tongtien', 'slgiohang'));
        } else {
            $danhmucs = DanhMuc::all();
        $nhomthuocs = NhomThuoc::all();
            $giohang = 0;
            $tongtien = 0;
            $slgiohang = 0;
            return view('user.giohangrong', compact('danhmucs', 'nhomthuocs','giohang', 'tongtien', 'slgiohang'));
        }
    }

    public function getGioHang_Them($id)
    {
        if (Auth::check()) {
            $giohang = GioHang::where('thuoc_id', $id)
                ->where('nguoidung_id', Auth::user()->id)
                ->first();

            if ($giohang) {
                $giohang->soluong += 1;
                $giohang->save();
            } else {
                $thuoc = Thuoc::findOrFail($id);
                $orm = new GioHang();
                $orm->nguoidung_id = Auth::user()->id;
                $orm->thuoc_id = $thuoc->id;
                $orm->dongiaban = $thuoc->dongiaban;
                $orm->save();
            }
            return redirect()->route('frontend.home');
        } else
            return redirect()->route('user.dangnhap');;
    }

    public function getGioHang_Xoa($id)
    {
        $orm = GioHang::find($id);
        $orm->delete();
        return redirect()->route('user.giohang');
    }

    public function getGioHang_Giam($id)
    {
        $orm = GioHang::find($id);
        if ($orm->soluong > 1) {
            $orm->soluong -= 1;
            $orm->save();
        }
        return redirect()->route('user.giohang');
    }

    public function getGioHang_Tang($id)
    {
        $orm = GioHang::find($id);
        $orm->soluong += 1;
        $orm->save();
        return redirect()->route('user.giohang');
    }
}
