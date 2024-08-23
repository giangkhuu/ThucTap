<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class DanhMuc extends Model
{
    protected $table = 'danhmuc';

    protected $fillable = [
        'tendanhmuc',
        'tendanhmuc_slug',
        'hinhanh',
    ];

    public function Thuoc(): HasMany
    {
        return $this->hasMany(Thuoc::class, 'danhmuc_id', 'id');
    }
}
