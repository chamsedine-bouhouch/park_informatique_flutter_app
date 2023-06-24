<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;
    protected $fillable = [
        'tire',
        'lieu',
        'service',
        'urgence',
        'description',
        'statut',
        'employe_id',
        'chef_id',
        'admin_id',
    ];
}
