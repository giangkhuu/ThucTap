<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class QuocGia extends Model
{
    protected $table = 'quocgia';

    protected $fillable = [
        'tenquocgia',
        'tenquocgia_slug',
        'hinhanh',
    ];

    public function Thuoc(): HasMany
    {
        return $this->hasMany(Thuoc::class, 'quocgia_id', 'id');
    }
}
