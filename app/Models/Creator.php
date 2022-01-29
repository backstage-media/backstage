<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Creator extends Model
{
    use HasFactory;

    use HasFactory;

    protected $casts = [
        'likes' => 'integer',
        'available' => 'boolean'
    ];

    protected $fillable = [
        'real_name',
        'description'
    ];

    public function manager()
    {
        return $this->hasOne(Manager::class);
    }
}
