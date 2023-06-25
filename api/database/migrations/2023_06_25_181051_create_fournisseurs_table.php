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

        //   'Fournisseur',
        //   'Fournisseur consommable',
        //   'Fournisseur ordinateurs',
        //   'Fournisseur imprimantes',
        //   'Fournisseur chasis',
        //   'Fournisseur téléphone',

        Schema::create('fournisseurs', function (Blueprint $table) {
            $table->id();
            $table->string('nom');
            $table->string('email');
            $table->enum('type', ['Materiel', 'Service'])->nullable();
            $table->integer('telephone')->nullable();
            $table->string('service')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fournisseurs');
    }
};
