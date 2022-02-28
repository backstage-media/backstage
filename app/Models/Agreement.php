<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agreement extends Model
{
    use HasFactory;

    protected $table = 'agreements';
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    protected $fillable = [
        'months',
        'price_per_month',
        'discount',
        'available'
    ];

    public function manager()
    {
        return $this->hasOne(Manager::class,'id','manager_id');
    }

    public function contract()
    {
        return $this->hasOne(Contract::class);
    }
}
