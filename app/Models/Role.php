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
        return $this->HasOne(Creator::class, 'id', 'creator_id');
    }

    public function manager()
    {
        return $this->hasOne(Manager::class,'id','manager_id');
    }

    public function user()
    {
        return $this->HasOne(User::class,'role_id'); 
    }

    public function user_type(){
        return $this->belongsTo(UserTypes::class,'user_type_id','id');
    }

    public function scopeProfile($query)
    {
        return $query
              ->when($this->type_name === 'Creator',function($q){
                  return $q->with('creator');
             })
             ->when($this->type === 'Manager',function($q){
                  return $q->with('manager');
             });
    }

}

