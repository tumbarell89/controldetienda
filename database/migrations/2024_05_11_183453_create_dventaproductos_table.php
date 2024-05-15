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
        Schema::create('dventaproductos', function (Blueprint $table) {
            $table->id();
            $table->double('cantidad');
            $table->timestamps();
            $table->foreignId('dventas_id')->constrained('dventas');
            $table->foreignId('dproductos_id')->constrained('dproductos');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dventaproductos');
    }
};
