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
        Schema::create('nhaphang', function (Blueprint $table) {
            $table->id();
            $table->foreignId('nhacungcap_id')->constrained('nhacungcap');
            $table->string('manhap')->unique();
            $table->string('nguoinhap');
            $table->date('ngaynhap');
            $table->double('tongtiennhap')->nullable();;
            $table->timestamps();
            $table->engine = 'InnoDB';
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nhaphang');
    }
};
