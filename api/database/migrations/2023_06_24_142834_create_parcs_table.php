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
        Schema::create('parcs', function (Blueprint $table) {
            $table->id();
            $table->string('nom');
            $table->string('type');
            $table->bigInteger('serie')->nullable();
            $table->string('fabricant')->nullable();
            $table->string('modele')->nullable();
            $table->string('version')->nullable();
            $table->foreignId('technicien_id')->nullable()->constrained(table: "users");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parcs');
    }
};
