<?php

namespace App\Http\Controllers;

use App\Models\NhaCungCap;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class NhaCungCapController extends Controller
{
    public function getDanhSach()
    {
        $nhacungcap = NhaCungCap::all();
        return view('admin.nhacungcap.danhsach', compact('nhacungcap'));
    }

    public function getThem()
    {
        return view('admin.nhacungcap.them');
    }

    public function postThem(Request $request)
    {
        // Kiểm tra
        /* $request->validate([
            'tendanhmuc' => ['required', 'string', 'max:191', 'unique:danhmuc'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]); */

        $orm = new NhaCungCap();
        $orm->tennhacungcap = $request->tennhacungcap;
        $orm->masothue = $request->masothue;
        $orm->email = $request->email;
        $orm->sdt = $request->sdt;
        $orm->diachi = $request->diachi;
        $orm->save();
        return redirect()->route('admin.nhacungcap');
    }

    public function getSua($id)
    {
        $nhacungcap = NhaCungCap::find($id);
        return view('admin.nhacungcap.sua', compact('nhacungcap'));
    }

    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        /* $request->validate([
            'tendanhmuc' => ['required', 'string', 'max:191', 'unique:danhmuc,tendanhmuc,' . $id],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]); */
        
        $orm = NhaCungCap::find($id);
        $orm->tennhacungcap = $request->tennhacungcap;
        $orm->masothue = $request->masothue;
        $orm->email = $request->email;
        $orm->sdt = $request->sdt;
        $orm->diachi = $request->diachi;
        $orm->save();
        return redirect()->route('admin.nhacungcap');
    }

    public function getXoa($id)
    {
        $orm = NhaCungCap::find($id);
        $orm->delete();
        return redirect()->route('admin.nhacungcap');
    }
}
