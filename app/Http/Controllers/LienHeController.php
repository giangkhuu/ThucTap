<?php

namespace App\Http\Controllers;

use App\Models\DanhMuc;
use App\Models\GioHang;
use App\Models\LienHe;
use App\Models\NguoiDung;
use App\Models\NhomThuoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LienHeController extends Controller
{
    public function getDanhSach()
    {
        $lienhe = LienHe::all();
        return view('admin.lienhe.danhsach', compact('lienhe'));
    }
    
    public function getThem()
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
            return view('user.lienhe.them', compact('danhmucs', 'nhomthuocs', 'nguoidung', 'giohang', 'tongtien', 'slgiohang'));
        } else
            return redirect()->route('user.dangnhap');
    }

    public function postThem(Request $request)
    {

        $request->validate([

            'email' => ['required', 'string', 'max:255'],
            'sdt' => ['required', 'string', 'max:20'],
            'chude' => ['required', 'string', 'max:255'],
        ]);
        $orm = new LienHe();
        $orm->nguoidung_id = Auth::user()->id;
        $orm->ten = Auth::user()->name;
        $orm->email = $request->email;
        $orm->sdt = $request->sdt;
        $orm->chude = $request->chude;
        $orm->noidung = $request->noidung;
        $orm->save();
        return redirect()->route('user.lienhe');
    }


    public function getXem($id)
    {
        $lienhe = LienHe::find($id);
        return view('admin.lienhe.xem', compact('lienhe'));
    }

    public function getXoa($id)
    {
        $orm = LienHe::find($id);
        $orm->delete();
        return redirect()->route('admin.lienhe');
    }
}
