<?php

namespace Database\Seeders;

use App\Enums\RoleType;
use App\Models\Ticket;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TicketSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $employe =    \App\Models\User::factory()->create([
            'name' => 'Employe',
            'email' => 'employe@employe.com',
            'role' => RoleType::EMPLOYE
        ]);
       $chef= \App\Models\User::factory()->create([
            'name' => 'Chef ',
            'email' => 'chef@example.com',
            'role' => RoleType::CHEF_HERARCHIE
        ]);
       $technicien= \App\Models\User::factory()->create([
            'name' => 'Tech Dev',
            'email' => 'tech@example.com',
            'role' => RoleType::TECH_DEVELEPPEMENT
        ]);
       Ticket::create([
        'titre'=>"Premier Titre ",
        'description'=>"Description 1",
        'employe_id'=>$employe->id,
        'technicien_id'=>$technicien->id,
        'chef_id'=>$chef->id
       ]);
    }
}
