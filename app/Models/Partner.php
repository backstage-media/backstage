<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Partner extends Model
{
    use HasFactory;

    protected $casts = [
        'followers' => 'integer',
        'available' => 'boolean'
    ];

    protected $fillable = [
        'name',
        'contract',
        'followers',
        'description',
        'contact',
        'available'
    ];
}
