<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Enums\RoleType;
use Illuminate\Http\Request;
use App\Http\Requests\StoreUserRequest;

class UserController extends Controller
{
    public function getEmployees()
    {
        return User::where('role', RoleType::EMPLOYE)->get();
    }
    public function getTechniciens()
    {
        return User::whereIn('role', [
            RoleType::TECH_DEVELEPPEMENT,
            RoleType::TECH_MAINTENANCE,
            RoleType::TECH_RESEAU,
            RoleType::TECH_STOCK
        ])->get();
    }
    public function store(StoreUserRequest $request)
    {
        User::factory()->create([
            "name" => $request->name,
            "email" => $request->email,
            "genre" => $request->genre,
            "role" => $request->role,
            "phone" => $request->phone,
        ]);
    }
}
