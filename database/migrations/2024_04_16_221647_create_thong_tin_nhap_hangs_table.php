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
        Schema::create('thongtinnhaphang', function (Blueprint $table) {
            $table->id();
            $table->foreignId('thuoc_id')->constrained('thuoc');
            $table->foreignId('nhaphang_id')->constrained('nhaphang');
            $table->string('solo'); 
            $table->date('ngaysanxuat');
            $table->date('hansudung');
            $table->double('dongianhap');
            $table->integer('soluong');
            $table->timestamps();
            $table->engine = 'InnoDB';
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('thongtinnhaphang');
    }
};
