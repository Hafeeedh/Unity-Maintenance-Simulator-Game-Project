<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    use HasFactory;

    protected $fillable = ['make', 'model', 'year', 'license_plate'];

    public function devices()
    {
        return $this->belongsToMany(Device::class,'connections');
    }
}
