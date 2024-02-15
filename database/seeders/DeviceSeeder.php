<?php

// database/seeders/DeviceSeeder.php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Device;

class DeviceSeeder extends Seeder
{
    public function run()
    {
        Device::factory()->count(10)->create();
    }
}
