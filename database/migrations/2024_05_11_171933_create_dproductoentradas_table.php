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
        Schema::create('dproductoentradas', function (Blueprint $table) {
            $table->id();
            $table->double('cantidad');
            $table->double('precio');
            $table->foreignId('dproducto_id')->constrained('dproductos');
            $table->foreignId('dentradaalmacen_id')->constrained('dentradaalmacens');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dproductoentradas');
    }
};
