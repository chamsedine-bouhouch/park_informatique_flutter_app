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
        Schema::create('tickets', function (Blueprint $table) {
            $table->id();
            $table->string('titre');
            $table->string('lieu')->nullable();
            $table->string('service')->nullable();
            $table->enum('urgence', ['Haute', 'Moyenne', 'Base'])->default('Base');
            $table->text('description')->nullable();
            $table->enum('statut', ['En Attente', 'Approuvé','Refusé', 'Affecté','Non Traité', 'Traité'])->default('En Attente');
            $table->string('message_chef')->nullable();
            $table->foreignId('employe_id')->constrained(table:'users');
            $table->foreignId('chef_id')->nullable()->constrained(table:'users');
            $table->foreignId('admin_id')->nullable()->constrained(table:'users');
            $table->foreignId('technicien_id')->nullable()->constrained(table:'users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tickets');
    }
};
