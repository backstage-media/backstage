<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ContentCreator;

class Manager extends Model
{
    use HasFactory;

    protected $table = 'managers';
    protected $primaryKey = 'manager_id';
    protected $casts = [
        'likes' => 'integer',
        'country_longitude' => 'float'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    protected $fillable = [
        'real_name',
        'likes',
        'description',
        'available'
    ];

    public function contentcreator()
    {
        return $this->hasMany(ContentCreator::class);
    }
}