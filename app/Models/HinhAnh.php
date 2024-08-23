<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HinhAnh extends Model
{
    protected $table = 'hinhanh';

    public function Thuoc(): BelongsTo
    {
        return $this->belongsTo(Thuoc::class, 'thuoc_id', 'id');
    }
}
