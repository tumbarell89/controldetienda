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
        Schema::create('dproductos', function (Blueprint $table) {
            $table->id();
            $table->string('denominacion');
            $table->double('preciocosto');
            $table->double('precioventa');
            $table->string('codigocup');
            $table->string('codigoproducto');
            $table->foreignId('nunidadmedida_id')->constrained('nunidadmedida');
            $table->foreignId('dtipogiros_id')->constrained('ntipogiros');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dproductos');
    }
};
