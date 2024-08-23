<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class NhapHang extends Model
{
    protected $table = 'nhaphang';

    protected $fillable = [
        
    ];

    public function ThongTinNhapHang(): HasMany
    {
        return $this->hasMany(ThongTinNhapHang::class, 'nhaphang_id', 'id');
    }

    public function NhaCungCap(): BelongsTo
    {
        return $this->belongsTo(NhaCungCap::class, 'nhacungcap_id', 'id');
    }
}
