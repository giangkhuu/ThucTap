<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class GioHang extends Model
{
    protected $table = 'giohang';

    public function Thuoc(): BelongsTo
    {
        return $this->belongsTo(Thuoc::class, 'thuoc_id', 'id');
    }

    public function NguoiDung(): BelongsTo
    {
        return $this->belongsTo(NguoiDung::class, 'nguoidung_id', 'id');
    }
}
