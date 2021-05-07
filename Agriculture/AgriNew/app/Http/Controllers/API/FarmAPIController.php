<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests\API\CreateFarmAPIRequest;
use App\Models\Farm;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Carbon;
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
     * Display a listing of the FavoriteService.
     * GET|HEAD /favorite
     *
     * @param Request $request
     *
     * @throws Exception
     *
     * @return Response
     */
    public function index(Request $request)
    {

        try {
            $farm = null;
            return $this->sendResponse($farm, 'Get data success');
        } catch (Exception $ex){
            Log::error('FarmAPIController@index:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified Stamp Info.
     * GET|HEAD /stamp_infos/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        try {
            $farm = null;
            return $this->sendResponse($farm, 'Get data success');
        }catch (\Exception $ex) {
            Log::error($ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
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
        $user = $request->user();
        $data = $request->all();
        $data['created_user'] = 'hopdt';
        $data['created_at'] = Carbon::now();;
        $data['user_id'] = isset($user->id) ? $user->id : 0;
        try {
            $this->model->insert($data);
            return $this->sendSuccess('Success');
        } catch (Exception $ex) {
            Log::error('FarmAPIController@store:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

}
