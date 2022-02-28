<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contract extends Model
{
    use HasFactory;

    protected $table = 'contracts';
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    protected $fillable = [
        'status',
        'start_date',
        'end_date',
        'automatic_renewal'
    ];

    
    public function creator()
    {
        return $this->belongsTo(Creator::class);
    }

    public function manager()
    {
        return $this->belongsTo(Manager::class);
    }

    public function agreement()
    {
        return $this->belongsTo(Agreement::class);
    }

}
