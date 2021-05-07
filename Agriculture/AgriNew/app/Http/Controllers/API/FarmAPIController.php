<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests\API\CreateFarmAPIRequest;
//use App\Http\Requests\CreateFarmAPIRequest;
use App\Models\Farm;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use PHPUnit\Util\Exception;

class FarmAPIController extends AppBaseController
{
    var $table = 'farms';
    var $model = null;

    public function __construct(Farm $farm)
    {
        $this->model = $farm;
    }

    /**
     * Store a newly created FavoriteService in storage.
     * POST /favorite
     *
     * @param CreateFarmAPIRequest $request
     *
     * @throws Exception
     *
     * @return Response
     */
    public function store(CreateFarmAPIRequest $request)
    {
//        Log::alert('store');
        $data = $request->all();
        try {
            Log::info($data);
            return $this->sendSuccess('Success');
        } catch (Exception $ex) {
            Log::error('FarmAPIController@store:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

}
