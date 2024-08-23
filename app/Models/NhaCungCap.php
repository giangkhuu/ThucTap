<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class NhaCungCap extends Model
{
    protected $table = 'nhacungcap';

    protected $fillable = [
        
    ];

    public function NhapHang(): HasMany
    {
        return $this->hasMany(NhapHang::class, 'nhacungcap_id', 'id');
    }
}
