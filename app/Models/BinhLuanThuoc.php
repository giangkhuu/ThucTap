<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BinhLuanThuoc extends Model
{
    protected $table = 'binhluanthuoc';

    public function Thuoc(): BelongsTo
    {
        return $this->belongsTo(Thuoc::class, 'thuoc_id', 'id');
    }

    public function NguoiDung(): BelongsTo
    {
        return $this->belongsTo(NguoiDung::class, 'nguoidung_id', 'id');
    }
}
