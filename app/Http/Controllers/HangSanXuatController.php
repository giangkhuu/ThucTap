<?php

namespace App\Http\Controllers;

use App\Models\DanhMuc;
use App\Models\HangSanXuat;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class HangSanXuatController extends Controller
{
    public function getDanhSach()
    {
        $hangsanxuat = HangSanXuat::all();
        return view('admin.hangsanxuat.danhsach', compact('hangsanxuat'));
    }

    public function getThem()
    {
        return view('admin.hangsanxuat.them');
    }


    public function postThem(Request $request)
    {
        // Kiểm tra
        $request->validate([
            'tenhang' => ['required', 'string', 'max:191', 'unique:hangsanxuat'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenhang, '-') . '.' . $extension;
            $path = Storage::putFileAs('hang-san-xuat', $request->file('hinhanh'), $filename);
        }
        $orm = new HangSanXuat();
        $orm->tenhang = $request->tenhang;
        $orm->tenhang_slug = Str::slug($request->tenhang, '-');
        $orm->motahang = $request->motahang;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.hangsanxuat');
    }

    public function getSua($id)
    {
        $hangsanxuat = HangSanXuat::find($id);
        return view('admin.hangsanxuat.sua', compact('hangsanxuat'));
    }

    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        $request->validate([
            'tenhang' => ['required', 'string', 'max:191', 'unique:hangsanxuat,tenhang,' . $id],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa file cũ
            $orm = HangSanXuat::find($id);
            if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
            // Upload file mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenhang, '-') . '.' . $extension;

            $path = Storage::putFileAs('hang-san-xuat', $request->file('hinhanh'), $filename);
        }
        $orm = HangSanXuat::find($id);
        $orm->tenhang = $request->tenhang;
        $orm->tenhang_slug = Str::slug($request->tenhang, '-');
        $orm->motahang = $request->motahang;
        if (!empty($path))
            $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.hangsanxuat');
    }

    public function getXoa($id)
    {
        $orm = HangSanXuat::find($id);
        $orm->delete();
        // Xoá hình ảnh khi xóa dữ liệu
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.hangsanxuat');
    }
}
