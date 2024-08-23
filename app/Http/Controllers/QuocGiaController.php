<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\QuocGia;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class QuocGiaController extends Controller
{
    public function getDanhSach()
    {
        $quocgia = QuocGia::all();
        return view('admin.quocgia.danhsach', compact('quocgia'));
    }

    public function getThem()
    {
        return view('admin.quocgia.them');
    }

    public function postThem(Request $request)
    {
        // Kiểm tra
        $request->validate([
            'tenquocgia' => ['required', 'string', 'max:191', 'unique:quocgia'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenquocgia, '-') . '.' . $extension;
            $path = Storage::putFileAs('quoc-gia', $request->file('hinhanh'), $filename);
        }
        $orm = new QuocGia();
        $orm->tenquocgia = $request->tenquocgia;
        $orm->tenquocgia_slug = Str::slug($request->tenquocgia, '-');
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.quocgia');
    }

    public function getSua($id)
    {
        $quocgia = QuocGia::find($id);
        return view('admin.quocgia.sua', compact('quocgia'));
    }

    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        $request->validate([
            'tenquocgia' => ['required', 'string', 'max:191', 'unique:quocgia,tenquocgia,' . $id],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]);
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa file cũ
            $orm = QuocGia::find($id);
            if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
            // Upload file mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenquocgia, '-') . '.' . $extension;

            $path = Storage::putFileAs('quoc-gia', $request->file('hinhanh'), $filename);
        }
        $orm = QuocGia::find($id);
        $orm->tenquocgia = $request->tenquocgia;
        $orm->tenquocgia_slug = Str::slug($request->tenquocgia, '-');
        if (!empty($path))
            $orm->hinhanh = $path;
        $orm->save();
        return redirect()->route('admin.quocgia');
    }

    public function getXoa($id)
    {
        $orm = QuocGia::find($id);
        $orm->delete();
        // Xoá hình ảnh khi xóa dữ liệu
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.quocgia');
    }
}
