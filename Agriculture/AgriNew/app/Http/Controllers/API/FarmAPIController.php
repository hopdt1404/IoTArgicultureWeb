<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
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
     * @param Request $request
     *
     * @throws Exception
     *
     * @return Response
     */
    public function store(Request $request)
    {
        try {
            return $this->sendSuccess('Success');
        } catch (Exception $ex) {
            Log::error('FarmAPIController@store:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

}
