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
        Schema::create('dalmacenventas', function (Blueprint $table) {
                $table->id();
                $table->double('cantidad');
                $table->foreignId('valamcens_id')->constrained('nalmacens');
                $table->foreignId('dproductos_id')->constrained('dproductos');
                $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dalmacenventas');
    }
};
