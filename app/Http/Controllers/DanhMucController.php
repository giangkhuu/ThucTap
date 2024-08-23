<?php

namespace App\Http\Controllers;

use App\Models\DanhMuc;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class DanhMucController extends Controller
{
    public function getDanhSach()
    {
        $danhmuc = DanhMuc::all();
        return view('admin.danhmuc.danhsach', compact('danhmuc'));
    }

    public function getThem()
    {
        return view('admin.danhmuc.them');
    }


    public function postThem(Request $request)
    {
        // Kiểm tra
        $request->validate([
            'tendanhmuc' => ['required', 'string', 'max:191', 'unique:danhmuc'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tendanhmuc, '-') . '.' . $extension;
            $path = Storage::putFileAs('danh-muc', $request->file('hinhanh'), $filename);
        }
        $orm = new DanhMuc();
        $orm->tendanhmuc = $request->tendanhmuc;
        $orm->tendanhmuc_slug = Str::slug($request->tendanhmuc, '-');
        $orm->motadanhmuc = $request->motadanhmuc;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.danhmuc');
    }

    public function getSua($id)
    {
        $danhmuc = DanhMuc::find($id);
        return view('admin.danhmuc.sua', compact('danhmuc'));
    }

    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        $request->validate([
            'tendanhmuc' => ['required', 'string', 'max:191', 'unique:danhmuc,tendanhmuc,' . $id],
            'hinhanh' => ['nullable', 'image', 'max:1024'] 
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa file cũ
            $orm = DanhMuc::find($id);
            if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
            // Upload file mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tendanhmuc, '-') . '.' . $extension;

            $path = Storage::putFileAs('danh-muc', $request->file('hinhanh'), $filename);
        }
        $orm = DanhMuc::find($id);
        $orm->tendanhmuc = $request->tendanhmuc;
        $orm->tendanhmuc_slug = Str::slug($request->tendanhmuc, '-');
        $orm->motadanhmuc = $request->motadanhmuc;
        if (!empty($path))
            $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.danhmuc');
    }

    public function getXoa($id)
    {
        $orm = DanhMuc::find($id);
        $orm->delete();
        // Xoá hình ảnh khi xóa dữ liệu
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.danhmuc');
    }
}
