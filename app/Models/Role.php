<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $fillable = ['user_type_id'];
    protected $primaryKey = 'id';


    public function creator()
    {
        return $this->HasOne(Creator::class, 'id');
    }

    public function manager()
    {
        return $this->HasOne(Manager::class, 'id');
    }

    public function user()
    {
        return $this->HasOne(User::class,'role_id');
    }

}

