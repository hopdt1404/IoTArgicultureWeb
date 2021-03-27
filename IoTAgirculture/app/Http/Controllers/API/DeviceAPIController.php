<?php

namespace App\Http\Controllers\API;



use App\Http\Controllers\AppBaseController;
use App\Http\Requests\API\UpdateDeviceAPIRequest;
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
        $data = $request->all();
        $device = [];
        if (isset($data->name)) {
            $device = $this->model->where(['name', 'like', "%$data->name%"])->get();
        }
        $result['param'] = $data;
        $result['data'] = $device;
        $result['controller'] = 'DeviceAPIController';
        $result['method'] = 'index';
        return $this->sendResponse($result, 'Success');
    }

    public function store(Request $request) {
        $data = $request->all();
        $device = [];
        if (isset($data['name'])) {
            $device = $this->model->where('name', 'like', '%' . $data['name'] . '%')->get();
        }
        $result['param'] = $data;
        $result['data'] = $device;
        $result['controller'] = 'DeviceAPIController';
        $result['method'] = 'index';
        return $this->sendResponse($result, 'Success');
    }

    public function update(UpdateDeviceAPIRequest $request) {
        $data = $request->all();
        $data['updated_user'] = 'nono';
        $this->model->where('id', $request->device)->update($data);
        $result['param'] = $data;
        $result['id'] = $request->device;
        $result['controller'] = 'DeviceAPIController';
        $result['method'] = 'index';
        return $this->sendResponse($result, 'Success');
    }


}

