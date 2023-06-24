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
            'email' => 'user@employe.com',
            'role' => RoleType::EMPLOYE
        ]);
       Ticket::create([
        'titre'=>"one",
        'employe_id'=>$employe->id
       ]);
    }
}
