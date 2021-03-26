<?php

namespace App\Http\Controllers\API;



use App\Http\Controllers\AppBaseController;
use App\Models\Device;
use Illuminate\Http\Request;

/**
 * Class AdvertisementManagement
 * @package App\Models
 *
 */

class DeviceAPIController extends AppBaseController
{
    var $table = 'devices';
    var $model = null;

    public function __construct(Device $device)
    {
        $this->model = $device;
    }

    public function index(Request $request) {
        return response()->json(["Controller" => "DeviceAPIController", "method" => 'index']);
    }


}

