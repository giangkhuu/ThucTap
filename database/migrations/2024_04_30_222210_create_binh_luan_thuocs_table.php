<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('binhluanthuoc', function (Blueprint $table) {
            $table->id();
            $table->foreignId('thuoc_id')->constrained('thuoc');
            $table->foreignId('nguoidung_id')->constrained('nguoidung');
            $table->text('noidungbinhluan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('binhluanthuoc');
    }
};
