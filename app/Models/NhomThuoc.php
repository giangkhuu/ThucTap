<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class NhomThuoc extends Model
{
    protected $table = 'nhomthuoc';

    protected $fillable = [
        'tennhomthuoc',
        'tennhomthuoc_slug',
        'hinhanh',
    ];

    public function Thuoc(): HasMany
    {
        return $this->hasMany(Thuoc::class, 'nhomthuoc_id', 'id');
    }
}
