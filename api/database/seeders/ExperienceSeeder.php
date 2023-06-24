<?php

namespace Database\Seeders;

use App\Enums\RoleType;
use App\Models\BaseExperience;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ExperienceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $technicien =    \App\Models\User::factory()->create([
            'name' => 'Tech Dev',
            'email' => 'dev@tech.com',
            'role' => RoleType::TECH_DEVELEPPEMENT
        ]);
        BaseExperience::create([
            'titre' => "Expreience 1",
            'description' => "Description",
            'technicien_id' => $technicien->id
        ]);
    }
}
