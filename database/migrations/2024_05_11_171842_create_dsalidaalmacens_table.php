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
        Schema::create('dsalidaalmacens', function (Blueprint $table) {
            $table->id();
            $table->string('factura');
            $table->double('total');
            $table->boolean('esventa');
            $table->foreignId('nalmacenes_origen_id')->constrained('nalmacens');
            $table->foreignId('nalmacenes_destino_id')->constrained('nalmacens');
            $table->foreignId('dproveedor_destino_id')->constrained('dclienteproveedors');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dsalidaalmacens');
    }
};
