<?php

namespace App\Http\Controllers;

use App\Enums\RoleType;
use App\Models\User;
use Illuminate\Http\Request;

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
}
