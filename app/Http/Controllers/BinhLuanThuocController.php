<?php

namespace App\Http\Controllers;

use App\Models\BinhLuanThuoc;
use App\Models\NguoiDung;
use App\Models\Thuoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BinhLuanThuocController extends Controller
{
    public function getDanhSach()
    {
        $thuoc = Thuoc::paginate(20);
        $binhluanthuoc = BinhLuanThuoc::orderBy('created_at', 'desc')->get();
        return view('admin.binhluanthuoc.danhsachthuoc', compact('thuoc', 'binhluanthuoc'));
    }

    public function getXem($id)
    {
        $binhluanthuoc = BinhLuanThuoc::orderBy('created_at', 'desc')
            ->where('thuoc_id', $id)
            ->get();
        return view('admin.binhluanthuoc.xem', compact('binhluanthuoc'));
    }

    public function getThem()
    {
        return view('admin.binhluanthuoc.them');
    }

    public function postThem(Request $request)
    {
        if (Auth::check()) {
            // Kiểm tra
            $request->validate([
                'thuoc_id' => ['required'],
                'nguoidung_id' => ['required'],
            ]);
            $orm = new BinhLuanThuoc();
            $orm->thuoc_id = $request->thuoc_id;
            $orm->nguoidung_id = $request->nguoidung_id;
            /* $orm->nguoidung_id = Auth::user()->id; */
            $orm->noidungbinhluan = $request->noidungbinhluan;
            $orm->save();
            // Sau khi thêm thành công thì tự động chuyển về trang danh sách
            return redirect()->back();
        } else
            return redirect()->route('user.dangnhap');
    }

    public function getSua($id)
    {
        $binhluanthuoc = BinhLuanThuoc::find($id);
        return view('admin.binhluanthuoc.sua', compact('binhluanthuoc'));
    }

    public function postSua(Request $request, $id)
    {
        $orm = BinhLuanThuoc::find($id);
        $orm->noidungbinhluan = $request->noidungbinhluan;
        $orm->save();
        $ma = $orm->thuoc_id;
        return redirect()->route('admin.binhluanthuoc.xem', ['id' => $ma]);
    }


    public function getXoa($id)
    {
        $orm = BinhLuanThuoc::find($id);
        $orm->delete();
        return redirect()->route('admin.danhmuc');
    }
}
