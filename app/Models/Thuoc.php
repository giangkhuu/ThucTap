<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Thuoc extends Model
{
    protected $table = 'thuoc';

    public function DanhMuc(): BelongsTo
    {
        return $this->belongsTo(DanhMuc::class, 'danhmuc_id', 'id');
    }

    public function NhomThuoc(): BelongsTo
    {
        return $this->belongsTo(NhomThuoc::class, 'nhomthuoc_id', 'id');
    }

    public function HangSanXuat(): BelongsTo
    {
        return $this->belongsTo(HangSanXuat::class, 'hangsanxuat_id', 'id');
    }

    public function QuocGia(): BelongsTo
    {
        return $this->belongsTo(QuocGia::class, 'quocgia_id', 'id');
    }

    public function HinhAnh(): HasMany
    {
        return $this->hasMany(HinhAnh::class, 'thuoc_id', 'id');
    }

    public function ThongTinNhapHang(): HasMany
    {
        return $this->hasMany(ThongTinNhapHang::class, 'thuoc_id', 'id');
    }

    public function GioHang(): HasMany
    {
        return $this->hasMany(GioHang::class, 'thuoc_id', 'id');
    }
    public function DonHang_ChiTiet(): HasMany
    {
        return $this->hasMany(DonHang_ChiTiet::class, 'thuoc_id', 'id');
    }

    public function BinhLuanThuoc(): HasMany
    {
        return $this->hasMany(BinhLuanThuoc::class, 'thuoc_id', 'id');
    }
}
