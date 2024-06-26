<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeviceUsage extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'device_id', 'usage_count'];

    public function user(){
        return $this->BelongsTo(User::class);
    }
    public function device(){
        return $this->BelongsTo(Device::class);
    }
}
