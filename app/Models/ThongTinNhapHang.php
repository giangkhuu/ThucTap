<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ThongTinNhapHang extends Model
{
    protected $table = 'thongtinnhaphang';

    public function Thuoc(): BelongsTo
    {
        return $this->belongsTo(Thuoc::class, 'thuoc_id', 'id');
    }

    public function NhapHang(): BelongsTo
    {
        return $this->belongsTo(NhapHang::class, 'nhaphang_id', 'id');
    }
}
