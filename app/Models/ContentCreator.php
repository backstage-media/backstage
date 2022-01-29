<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Manager;

class ContentCreator extends Model
{
    use HasFactory;

    protected $table = 'content_creators';
    protected $primaryKey = 'creator_id';
    protected $casts = [
        'likes' => 'integer',
        'available' => 'boolean'
    ];

    protected $fillable = [
        'real_name',
        'likes',
        'description'
    ];

    public function manager()
    {
        return $this->hasOne(Manager::class);
    }

}
