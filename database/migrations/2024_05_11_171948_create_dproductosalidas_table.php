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
        Schema::create('dproductosalidas', function (Blueprint $table) {
            $table->id();
            $table->double('cantidad');
            $table->foreignId('dproducto_id')->constrained('dproductos');
            $table->foreignId('dsalidaalmacen_id')->constrained('dsalidaalmacens');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dproductosalidas');
    }
};
