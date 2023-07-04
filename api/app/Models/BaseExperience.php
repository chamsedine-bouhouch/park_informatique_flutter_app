<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BaseExperience extends Model
{
    use HasFactory;
    protected $fillable = ['titre', 'description','technicien_id'];
}
