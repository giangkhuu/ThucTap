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
        Schema::create('thuoc', function (Blueprint $table) {
            $table->id();
            $table->foreignId('danhmuc_id')->constrained('danhmuc');
            $table->foreignId('nhomthuoc_id')->constrained('nhomthuoc');
            $table->foreignId('hangsanxuat_id')->constrained('hangsanxuat');
            $table->foreignId('quocgia_id')->constrained('quocgia');
            $table->string('sodangky');
            $table->string('tenthuoc');
            $table->string('tenbietduoc');
            $table->string('tenbietduoc_slug');
            $table->double('dongiaban');
            $table->string('hoatchat');
            $table->unsignedTinyInteger('thuockedon')->nullable();
            $table->string('donvitinh');
            $table->string('donggoi')->nullable();
            $table->string('thang');
            $table->text('congdung');
            $table->string('hinhanh')->nullable();
            $table->text('motathuoc')->nullable();
            $table->integer('soluong')->default(0)->nullable();
            $table->unsignedTinyInteger('trangthai')->default(1);
            $table->timestamps();
            $table->engine = 'InnoDB';
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('thuoc');
    }
};
