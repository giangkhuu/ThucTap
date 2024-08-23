<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\NhomThuoc;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class NhomThuocController extends Controller
{
    public function getDanhSach()
    {
        $nhomthuoc = NhomThuoc::all();
        return view('admin.nhomthuoc.danhsach', compact('nhomthuoc'));
    }

    public function getThem()
    {
        return view('admin.nhomthuoc.them');
    }

    public function postThem(Request $request)
    {
        // Kiểm tra
        $request->validate([
            'tennhomthuoc' => ['required', 'string', 'max:191', 'unique:nhomthuoc'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tennhomthuoc, '-') . '.' . $extension;
            $path = Storage::putFileAs('nhom-thuoc', $request->file('hinhanh'), $filename);
        }
        $orm = new NhomThuoc();
        $orm->tennhomthuoc = $request->tennhomthuoc;
        $orm->tennhomthuoc_slug = Str::slug($request->tennhomthuoc, '-');
        $orm->motanhomthuoc = $request->motanhomthuoc;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.nhomthuoc');
    }

    public function getSua($id)
    {
        $nhomthuoc = Nhomthuoc::find($id);
        return view('admin.nhomthuoc.sua', compact('nhomthuoc'));
    }

    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        $request->validate([
            'tennhomthuoc' => ['required', 'string', 'max:191', 'unique:nhomthuoc,tennhomthuoc,' . $id],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa file cũ
            $orm = NhomThuoc::find($id);
            if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
            // Upload file mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tennhomthuoc, '-') . '.' . $extension;

            $path = Storage::putFileAs('nhom-thuoc', $request->file('hinhanh'), $filename);
        }
        $orm = NhomThuoc::find($id);
        $orm->tennhomthuoc = $request->tennhomthuoc;
        $orm->tennhomthuoc_slug = Str::slug($request->tennhomthuoc, '-');
        $orm->motanhomthuoc = $request->motanhomthuoc;
        if (!empty($path))
            $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.nhomthuoc');
    }

    public function getXoa($id)
    {
        $orm = NhomThuoc::find($id);
        $orm->delete();
        // Xoá hình ảnh khi xóa dữ liệu
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.nhomthuoc');
    }
}
