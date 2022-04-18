<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\Media;
use App\Models\Comment;

class User extends Authenticatable
{

    public function media()
    {
    	return $this->hasMany(Media::class);
    }


    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Function created to relate user with the role it have.
     * 
     */

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    public function comment()
    {
        return $this->hasMany(Comment::class);
    }

    public function received_notifications(){
        return $this->hasMany(Notification::class,'to_user');
    }

    public function sent_notifications(){
        return $this->hasMany(Notification::class,'from_user');
    }

    
}
