<?php

namespace App\Http\Controllers;

use App\Models\DanhMuc;
use App\Models\HangSanXuat;
use App\Models\HinhAnh;
use App\Models\NhomThuoc;
use App\Models\QuocGia;
use App\Models\Thuoc;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Request;

class ThuocController extends Controller
{
    public function getDanhSach()
    {
        $thuoc = Thuoc::paginate(20);
        return view('admin.thuoc.danhsach', compact('thuoc'));
    }

    public function getThem()
    {
        $danhmuc = DanhMuc::all();
        $nhomthuoc = NhomThuoc::all();
        $hangsanxuat = HangSanXuat::all();
        $quocgia = QuocGia::all();
        return view('admin.thuoc.them', compact('danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia'));
    }

    public function postThem(Request $request)
    {
        // Kiểm tra
        /* $request->validate([
            'loaisanpham_id' => ['required'],
            'hangsanxuat_id' => ['required'],
            'tensanpham' => ['required', 'string', 'max:191', 'unique:sanpham'],
            'soluong' => ['required', 'numeric'],
            'dongia' => ['required', 'numeric'],
            'hinhanh' => ['nullable', 'image', 'max:2048'],
            'hinhanhmota.*' => ['nullable', 'image', 'max:2048'],
        ]); */
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Tạo thư mục nếu chưa có
            $nhomthuoc = NhomThuoc::find($request->nhomthuoc_id);
            File::isDirectory($nhomthuoc->tennhomthuoc_slug) or Storage::makeDirectory($nhomthuoc->tennhomthuoc_slug, 0775);

            // Xác định tên tập tin
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenbietduoc, '-') . '.' . $extension;
            // Upload vào thư mục và trả về đường dẫn
            $path = Storage::putFileAs($nhomthuoc->tennhomthuoc_slug, $request->file('hinhanh'), $filename);
        }
        $orm = new Thuoc();
        $orm->danhmuc_id = $request->danhmuc_id;
        $orm->nhomthuoc_id = $request->nhomthuoc_id;
        $orm->hangsanxuat_id = $request->hangsanxuat_id;
        $orm->quocgia_id = $request->quocgia_id;
        $orm->sodangky = $request->sodangky;
        $orm->tenthuoc = $request->tenthuoc;
        $orm->tenbietduoc = $request->tenbietduoc;
        $orm->tenbietduoc_slug = Str::slug($request->tenbietduoc, '-');
        $orm->dongiaban = $request->dongiaban;
        $orm->hoatchat = $request->hoatchat;
        $orm->thuockedon = $request->thuockedon;
        $orm->donvitinh = $request->donvitinh;
        $orm->donggoi = $request->donggoi;
        $orm->thang = $request->thang;
        $orm->congdung = $request->congdung;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->motathuoc = $request->motathuoc;
        $orm->save();
        $pathmota = '';
        $index = 1;
        if ($request->hasFile('hinhanhmota')) {
            foreach ($request->file('hinhanhmota') as $hinhanhmota) {
                // Tạo thư mục nếu chưa có
                $nhomthuoc = NhomThuoc::find($request->nhomthuoc_id);
                File::isDirectory($nhomthuoc->tennhomthuoc_slug) or Storage::makeDirectory($nhomthuoc->tennhomthuoc_slug, 0775);

                // Xác định tên tập tin
                $extension = $hinhanhmota->extension();
                $filename = Str::slug($request->tenbietduoc, '-') . '-' . $index . '.' . $extension;

                // Upload vào thư mục và trả về đường dẫn
                $pathmota = Storage::putFileAs($nhomthuoc->tennhomthuoc_slug, $hinhanhmota, $filename);

                // Tạo mới đối tượng HinhAnh và lưu vào cơ sở dữ liệu
                $mota = new HinhAnh();
                $mota->thuoc_id = $orm->id;
                $mota->hinhanhmota = $pathmota;
                $mota->save();

                $index++;
            }
        }


        // Sau khi thêm thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.thuoc');
    }

    public function getSua($id)
    {
        $thuoc = Thuoc::find($id);
        $dshinhanh = HinhAnh::where('thuoc_id', $thuoc->id)->get();
        $danhmuc = DanhMuc::all();
        $nhomthuoc = NhomThuoc::all();
        $hangsanxuat = HangSanXuat::all();
        $quocgia = QuocGia::all();
        return view('admin.thuoc.sua', compact('thuoc', 'dshinhanh', 'danhmuc', 'nhomthuoc', 'hangsanxuat', 'quocgia'));
    }

    public function postSua(Request $request, $id)
    {
        // Kiểm tra
        /* $request->validate([
            'loaisanpham_id' => ['required'],
            'hangsanxuat_id' => ['required'],
            'tensanpham' => ['required', 'string', 'max:191', 'unique:sanpham,tensanpham,' . $id],
            'soluong' => ['required', 'numeric'],
            'dongia' => ['required', 'numeric'],
            'hinhanh' => ['nullable', 'image', 'max:2048'],
            'hinhanhmota.*' => ['nullable', 'image', 'max:2048'],
        ]); */
        // Upload hình ảnh
        $path = '';
        if ($request->hasFile('hinhanh')) {
            // Xóa tập tin cũ
            $thuoc = Thuoc::find($id);
            if (!empty($thuoc->hinhanh)) Storage::delete($thuoc->hinhanh);
            // Xác định tên tập tin mới
            $extension = $request->file('hinhanh')->extension();
            $filename = Str::slug($request->tenbietduoc, '-') . '.' . $extension;
            // Upload vào thư mục và trả về đường dẫn
            $nhomthuoc = NhomThuoc::find($request->nhomthuoc_id);

            $path = Storage::putFileAs($nhomthuoc->tennhomthuoc_slug, $request->file('hinhanh'), $filename);
        }
        $orm = Thuoc::find($id);
        $orm->danhmuc_id = $request->danhmuc_id;
        $orm->nhomthuoc_id = $request->nhomthuoc_id;
        $orm->hangsanxuat_id = $request->hangsanxuat_id;
        $orm->quocgia_id = $request->quocgia_id;
        $orm->sodangky = $request->sodangky;
        $orm->tenthuoc = $request->tenthuoc;
        $orm->tenbietduoc = $request->tenbietduoc;
        $orm->tenbietduoc_slug = Str::slug($request->tenbietduoc, '-');
        $orm->dongiaban = $request->dongiaban;
        $orm->hoatchat = $request->hoatchat;
        $orm->thuockedon = $request->thuockedon;
        $orm->donvitinh = $request->donvitinh;
        $orm->donggoi = $request->donggoi;
        $orm->thang = $request->thang;
        $orm->congdung = $request->congdung;
        if (!empty($path)) $orm->hinhanh = $path;
        $orm->motathuoc = $request->motathuoc;
        $orm->save();
        $motaList = HinhAnh::where('thuoc_id', $orm->id)->get();
        foreach ($motaList as $mota) {
            if (!empty($mota->hinhanhmota)) {
                Storage::delete($mota->hinhanhmota);
            }
            $mota->delete(); // Xóa đối tượng hình ảnh mô tả từ cơ sở dữ liệu
        }
        $pathmota = '';
        $index = 1;
        if ($request->hasFile('hinhanhmota') && is_array($request->file('hinhanhmota'))) {
            foreach ($request->file('hinhanhmota') as $hinhanhmota) {

                $extension = $hinhanhmota->extension();
                $filename = Str::slug($request->tenbietduoc, '-') . '-' . $index . '.' . $extension;

                // Upload vào thư mục và trả về đường dẫn
                $nhomthuoc = NhomThuoc::find($request->nhomthuoc_id);
                $pathmota = Storage::putFileAs($nhomthuoc->tennhomthuoc_slug, $hinhanhmota, $filename);

                // Tạo mới đối tượng HinhAnh và lưu vào cơ sở dữ liệu
                $mota = new HinhAnh();
                $mota->thuoc_id = $orm->id;
                $mota->hinhanhmota = $pathmota;
                $mota->save();

                $index++;
            }
        }
        // Sau khi sửa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.thuoc');
    }

    public function getXoa($id)
    {
        $orm = Thuoc::find($id);
        $motaList = HinhAnh::where('thuoc_id', $orm->id)->get();
        $orm->delete();
        // Xóa tập tin khi xóa sản phẩm
        if (!empty($orm->hinhanh)) Storage::delete($orm->hinhanh);
        foreach ($motaList as $mota) {
            if (!empty($mota->hinhanhmota)) {
                Storage::delete($mota->hinhanhmota);
            }
            $mota->delete(); // Xóa đối tượng hình ảnh mô tả từ cơ sở dữ liệu
        }
        // Sau khi xóa thành công thì tự động chuyển về trang danh sách
        return redirect()->route('admin.thuoc');
    }
}
