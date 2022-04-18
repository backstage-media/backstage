<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $fillable = [
        'notification_type',
        'message',
        'target_id'
    ];

    public function from_user()
    {
    	return $this->belongsTo(User::class,'from_user','id');
    }

    public function to_user()
    {
    	return $this->belongsTo(User::class,'to_user', 'id');
    }

    public function notification_type(){
        return $this->belongsTo(NotificationTypes::class,'notification_type','id');
    }
}
