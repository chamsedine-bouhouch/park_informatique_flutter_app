<?php

namespace Database\Seeders;

use App\Models\Fournisseur;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FournisseurSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       Fournisseur::create([
        'nom'=>"fournisseur1",
        'email'=>"fournisseur1@f.com",
        'type'=>"Materiel",
        'telephone'=>23801405,
        'service'=>"info",
       ]);
    }
}
