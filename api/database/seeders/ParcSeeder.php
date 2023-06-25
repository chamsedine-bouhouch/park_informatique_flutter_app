<?php

namespace Database\Seeders;

use App\Models\Parc;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ParcSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Parc::create([
            'nom' => 'Imprimante',
            'type' => 'Materiel',
            'serie' => 123456,
            'fabricant' => 'hp',
            'modele' => 'hd600',
            'version' => "2019"
        ]);
    }
}
