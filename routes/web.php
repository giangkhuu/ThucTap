<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DanhMucController;
use App\Http\Controllers\HangSanXuatController;
use App\Http\Controllers\NhaCungCapController;
use App\Http\Controllers\NhapHangController;
use App\Http\Controllers\NhomThuocController;
use App\Http\Controllers\QuocGiaController;
use App\Http\Controllers\ThuocController;
use App\Http\Controllers\NguoiDungController;
use App\Http\Controllers\KhachHangController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\BinhLuanThuocController;
use App\Http\Controllers\DonHangChiTietController;
use App\Http\Controllers\DonHangController;
use App\Http\Controllers\GioHangController;
use App\Http\Controllers\LienHeController;
use App\Http\Controllers\TinhTrangController;
use App\Models\BinhLuanThuoc;
use App\Models\DonHang_ChiTiet;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Auth::routes();
// Google OAuth
Route::get('/login/google', [HomeController::class, 'getGoogleLogin'])->name('google.login');

Route::get('/login/google/callback', [HomeController::class, 'getGoogleCallback'])->name('google.callback');
// Các trang dành cho khách chưa đăng nhập
Route::name('frontend.')->group(function () {
    // Trang chủ
    Route::get('/', [HomeController::class, 'getHome'])->name('home');
    Route::get('/home', [HomeController::class, 'getHome'])->name('home');
    // Trang sản phẩm
    Route::get('/san-pham', [HomeController::class, 'getSanPham'])->name('sanpham');
    Route::get('/san-pham/danh-muc-{tendanhmuc_slug}', [HomeController::class, 'getDanhMuc'])->name('sanpham.phandanhmuc');
    Route::get('/san-pham/nhom-thuoc-{tennhomthuoc_slug}', [HomeController::class, 'getNhomThuoc'])->name('sanpham.phannhomthuoc');
    Route::get('/san-pham/{tendanhmuc_slug}/{tenbietduoc_slug}', [HomeController::class, 'getSanPham_ChiTiet'])->name('sanpham.chitiet');
    Route::post('/tim-kiem', [HomeController::class, 'postTimKiem'])->name('timkiem');
    // Tin tức
    Route::get('/bai-viet', [HomeController::class, 'getBaiViet'])->name('baiviet');
    Route::get('/bai-viet/{tenchude_slug}', [HomeController::class, 'getBaiViet'])->name('baiviet.chude');
    Route::get('/bai-viet/{tenchude_slug}/{tieude_slug}', [HomeController::class, 'getBaiViet_ChiTiet'])->name('baiviet.chitiet');

    // Tuyển dụng
    Route::get('/tuyen-dung', [HomeController::class, 'getTuyenDung'])->name('tuyendung');
});

// Trang khách hàng
Route::get('/khach-hang/dang-ky', [HomeController::class, 'getDangKy'])->name('user.dangky');
Route::get('/khach-hang/dang-nhap', [HomeController::class, 'getDangNhap'])->name('user.dangnhap');
Route::get('/khach-hang/quen-mat-khau', [HomeController::class, 'getQuenMatKhau'])->name('user.quenmatkhau');
Route::get('/khach-hang/doi-mat-khau', [HomeController::class, 'getDoiMatKhau'])->name('user.doimatkhau');

Route::get('/404', [HomeController::class, 'get404'])->name('errors.404');
Route::get('/403', [HomeController::class, 'get403'])->name('errors.403');


// Trang tài khoản khách hàng
Route::prefix('khach-hang')->name('user.')->middleware(['auth', 'user'])->group(function () {
    // Trang chủ
    Route::get('/', [KhachHangController::class, 'getHome'])->name('home');
    Route::get('/home', [KhachHangController::class, 'getHome'])->name('home');
    // Đặt hàng
    Route::get('/dat-hang', [KhachHangController::class, 'getDatHang'])->name('dathang');
    Route::post('/dat-hang', [KhachHangController::class, 'postDatHang'])->name('dathang');
    Route::get('/dat-hang-thanh-cong', [KhachHangController::class, 'getDatHangThanhCong'])->name('dathangthanhcong');
    // Xem và cập nhật trạng thái đơn hàng
    Route::get('/don-hang', [KhachHangController::class, 'getDonHang'])->name('donhang');
    Route::get('/don-hang/{id}', [KhachHangController::class, 'getDonHang'])->name('donhang.chitiet');
    Route::post('/don-hang/{id}', [KhachHangController::class, 'postDonHang'])->name('donhang.chitiet');
    // Cập nhật thông tin tài khoản
    Route::get('/ho-so-ca-nhan', [KhachHangController::class, 'getHoSoCaNhan'])->name('hosocanhan');
    Route::post('/ho-so-ca-nhan', [KhachHangController::class, 'postHoSoCaNhan'])->name('hosocanhan');
    // Trang giỏ hàng vào đăng nhập
    Route::get('/gio-hang', [GioHangController::class, 'getGioHang'])->name('giohang');
    Route::get('/gio-hang/them/{id}', [GioHangController::class, 'getGioHang_Them'])->name('giohang.them');
    Route::get('/gio-hang/xoa/{id}', [GioHangController::class, 'getGioHang_Xoa'])->name('giohang.xoa');
    Route::get('/gio-hang/giam/{id}', [GioHangController::class, 'getGioHang_Giam'])->name('giohang.giam');
    Route::get('/gio-hang/tang/{id}', [GioHangController::class, 'getGioHang_Tang'])->name('giohang.tang');

    // Liên hệ
    Route::get('/lien-he', [HomeController::class, 'getLienHe'])->name('lienhe');
    Route::get('/lienhe/them', [LienHeController::class, 'getThem'])->name('lienhe.them');
    Route::post('/lienhe/them', [LienHeController::class, 'postThem'])->name('lienhe.them');
    //Bình luận thuốc
    Route::get('/binhluanthuoc/them', [BinhLuanThuocController::class, 'getThem'])->name('binhluanthuoc.them');
    Route::post('/binhluanthuoc/them', [BinhLuanThuocController::class, 'postThem'])->name('binhluanthuoc.them');
    // Đăng xuất
    Route::post('/dang-xuat', [KhachHangController::class, 'postDangXuat'])->name('dangxuat');
});

// Trang tài khoản quản lý
Route::prefix('admin')->name('admin.')->middleware(['auth', 'manager'])->group(function () {
    // Trang chủ
    Route::get('/', [AdminController::class, 'getHome'])->name('home');
    Route::get('/home', [AdminController::class, 'getHome'])->name('home');
    // Quản lý Danh mục
    Route::get('/danhmuc', [DanhMucController::class, 'getDanhSach'])->name('danhmuc');
    Route::get('/danhmuc/them', [DanhMucController::class, 'getThem'])->name('danhmuc.them');
    Route::post('/danhmuc/them', [DanhMucController::class, 'postThem'])->name('danhmuc.them');
    Route::get('/danhmuc/sua/{id}', [DanhMucController::class, 'getSua'])->name('danhmuc.sua');
    Route::post('/danhmuc/sua/{id}', [DanhMucController::class, 'postSua'])->name('danhmuc.sua');
    Route::get('/danhmuc/xoa/{id}', [DanhMucController::class, 'getXoa'])->name('danhmuc.xoa');
    // Quản lý Nhóm thuốc
    Route::get('/nhomthuoc', [NhomThuocController::class, 'getDanhSach'])->name('nhomthuoc');
    Route::get('/nhomthuoc/them', [NhomThuocController::class, 'getThem'])->name('nhomthuoc.them');
    Route::post('/nhomthuoc/them', [NhomThuocController::class, 'postThem'])->name('nhomthuoc.them');
    Route::get('/nhomthuoc/sua/{id}', [NhomThuocController::class, 'getSua'])->name('nhomthuoc.sua');
    Route::post('/nhomthuoc/sua/{id}', [NhomThuocController::class, 'postSua'])->name('nhomthuoc.sua');
    Route::get('/nhomthuoc/xoa/{id}', [NhomThuocController::class, 'getXoa'])->name('nhomthuoc.xoa');
    // Quản lý Hãng sản xuất
    Route::get('/hangsanxuat', [HangSanXuatController::class, 'getDanhSach'])->name('hangsanxuat');
    Route::get('/hangsanxuat/them', [HangSanXuatController::class, 'getThem'])->name('hangsanxuat.them');
    Route::post('/hangsanxuat/them', [HangSanXuatController::class, 'postThem'])->name('hangsanxuat.them');
    Route::get('/hangsanxuat/sua/{id}', [HangSanXuatController::class, 'getSua'])->name('hangsanxuat.sua');
    Route::post('/hangsanxuat/sua/{id}', [HangSanXuatController::class, 'postSua'])->name('hangsanxuat.sua');
    Route::get('/hangsanxuat/xoa/{id}', [HangSanXuatController::class, 'getXoa'])->name('hangsanxuat.xoa');
    // Quản lý Quốc gia
    Route::get('/quocgia', [QuocGiaController::class, 'getDanhSach'])->name('quocgia');
    Route::get('/quocgia/them', [QuocGiaController::class, 'getThem'])->name('quocgia.them');
    Route::post('/quocgia/them', [QuocGiaController::class, 'postThem'])->name('quocgia.them');
    Route::get('/quocgia/sua/{id}', [QuocGiaController::class, 'getSua'])->name('quocgia.sua');
    Route::post('/quocgia/sua/{id}', [QuocGiaController::class, 'postSua'])->name('quocgia.sua');
    Route::get('/quocgia/xoa/{id}', [QuocGiaController::class, 'getXoa'])->name('quocgia.xoa');
    // Quản lý Tình trạng
    Route::get('/tinhtrang', [TinhTrangController::class, 'getDanhSach'])->name('tinhtrang');
    Route::get('/tinhtrang/them', [TinhTrangController::class, 'getThem'])->name('tinhtrang.them');
    Route::post('/tinhtrang/them', [TinhTrangController::class, 'postThem'])->name('tinhtrang.them');
    Route::get('/tinhtrang/sua/{id}', [TinhTrangController::class, 'getSua'])->name('tinhtrang.sua');
    Route::post('/tinhtrang/sua/{id}', [TinhTrangController::class, 'postSua'])->name('tinhtrang.sua');
    Route::get('/tinhtrang/xoa/{id}', [TinhTrangController::class, 'getXoa'])->name('tinhtrang.xoa');
    // Quản lý Thuốc 
    Route::get('/thuoc', [ThuocController::class, 'getDanhSach'])->name('thuoc');
    Route::get('/thuoc/them', [ThuocController::class, 'getThem'])->name('thuoc.them');
    Route::post('/thuoc/them', [ThuocController::class, 'postThem'])->name('thuoc.them');
    Route::get('/thuoc/sua/{id}', [ThuocController::class, 'getSua'])->name('thuoc.sua');
    Route::post('/thuoc/sua/{id}', [ThuocController::class, 'postSua'])->name('thuoc.sua');
    Route::get('/thuoc/xoa/{id}', [ThuocController::class, 'getXoa'])->name('thuoc.xoa');
    // Quản lý Đơn hàng
    Route::get('/donhang', [DonHangController::class, 'getDanhSach'])->name('donhang');
    Route::get('/donhang/them', [DonHangController::class, 'getThem'])->name('donhang.them');
    Route::post('/donhang/them', [DonHangController::class, 'postThem'])->name('donhang.them');
    Route::get('/donhang/sua/{id}', [DonHangController::class, 'getSua'])->name('donhang.sua');
    Route::post('/donhang/sua/{id}', [DonHangController::class, 'postSua'])->name('donhang.sua');
    Route::get('/donhang/xoa/{id}', [DonHangController::class, 'getXoa'])->name('donhang.xoa');
    // Quản lý Nhà cung cấp
    Route::get('/nhacungcap', [NhaCungCapController::class, 'getDanhSach'])->name('nhacungcap');
    Route::get('/nhacungcap/them', [NhaCungCapController::class, 'getThem'])->name('nhacungcap.them');
    Route::post('/nhacungcap/them', [NhaCungCapController::class, 'postThem'])->name('nhacungcap.them');
    Route::get('/nhacungcap/sua/{id}', [NhaCungCapController::class, 'getSua'])->name('nhacungcap.sua');
    Route::post('/nhacungcap/sua/{id}', [NhaCungCapController::class, 'postSua'])->name('nhacungcap.sua');
    Route::get('/nhacungcap/xoa/{id}', [NhaCungCapController::class, 'getXoa'])->name('nhacungcap.xoa');
    // Quản lý Nhập Hàng
    Route::get('/nhaphang', [NhapHangController::class, 'getDanhSach'])->name('nhaphang');
    Route::get('/nhaphang/them', [NhapHangController::class, 'getThem'])->name('nhaphang.them');
    Route::post('/nhaphang/them', [NhapHangController::class, 'postThem'])->name('nhaphang.them');
    Route::get('/nhaphang/sua/{id}', [NhapHangController::class, 'getSua'])->name('nhaphang.sua');
    Route::post('/nhaphang/sua/{id}', [NhapHangController::class, 'postSua'])->name('nhaphang.sua');
    Route::get('/nhaphang/xoa/{id}', [NhapHangController::class, 'getXoa'])->name('nhaphang.xoa');
    Route::post('/nhaphang/thuoc', [NhapHangController::class, 'postNhapHang_Them'])->name('nhaphang.themthuoc');
    Route::get('/nhaphang/xoathuoc/{row_id}', [NhapHangController::class, 'getNhapHang_Xoa'])->name('nhaphang.xoathuoc');
    // Quản lý Tài khoản người dùng
    Route::get('/nguoidung', [NguoiDungController::class, 'getDanhSach'])->name('nguoidung');
    Route::get('/nguoidung/them', [NguoiDungController::class, 'getThem'])->name('nguoidung.them');
    Route::post('/nguoidung/them', [NguoiDungController::class, 'postThem'])->name('nguoidung.them');
    Route::get('/nguoidung/sua/{id}', [NguoiDungController::class, 'getSua'])->name('nguoidung.sua');
    Route::post('/nguoidung/sua/{id}', [NguoiDungController::class, 'postSua'])->name('nguoidung.sua');
    Route::get('/nguoidung/xoa/{id}', [NguoiDungController::class, 'getXoa'])->name('nguoidung.xoa');
    // Quản lý Liên hệ
    Route::get('/lienhe', [LienHeController::class, 'getDanhSach'])->name('lienhe');
    Route::get('/lienhe/xem/{id}', [LienHeController::class, 'getXem'])->name('lienhe.xem');
    Route::get('/lienhe/xoa/{id}', [LienHeController::class, 'getXoa'])->name('lienhe.xoa');


    // Quản lý Bình luận thuốc
    Route::get('/binhluanthuoc', [BinhLuanThuocController::class, 'getDanhSach'])->name('binhluanthuoc');
    Route::get('/binhluanthuoc/xem/{id}', [BinhLuanThuocController::class, 'getXem'])->name('binhluanthuoc.xem');
    Route::get('/binhluanthuoc/sua/{id}', [BinhLuanThuocController::class, 'getSua'])->name('binhluanthuoc.sua');
    Route::post('/binhluanthuoc/sua/{id}', [BinhLuanThuocController::class, 'postSua'])->name('binhluanthuoc.sua');
    Route::get('/binhluanthuoc/xoa/{id}', [BinhLuanThuocController::class, 'getXoa'])->name('binhluanthuoc.xoa');

    Route::get('/binhluanthuoc/them', [BinhLuanThuocController::class, 'getThem'])->name('binhluanthuoc.them');
    Route::post('/binhluanthuoc/them', [BinhLuanThuocController::class, 'postThem'])->name('binhluanthuoc.them');
});
