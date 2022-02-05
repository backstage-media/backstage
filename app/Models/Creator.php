<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Creator extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $casts = [
        'likes' => 'integer',
        'available' => 'boolean'
    ];

    protected $fillable = [
        'real_name',
        'description'
    ];

    public function role()
    {
        return $this->hasOne(Role::class, 'creator_id');
    }
}
