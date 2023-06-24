<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Parc extends Model
{
    use HasFactory;
    protected $fillable= ['nom','type','serie','fabricant','modele','version'];
/**
 * Get the technicien that owns the Parc
 *
 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
 */
public function technicien(): BelongsTo
{
    return $this->belongsTo(User::class);
}
}
