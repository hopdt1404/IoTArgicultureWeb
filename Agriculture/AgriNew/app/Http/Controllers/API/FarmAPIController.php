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
    var $model = null;

    public function __construct(Farm $farm)
    {
        $this->model = $farm;
    }

    /**
     * Display a listing of the Farm.
     * GET|HEAD /farm
     *
     * @param Request $request
     *
     * @throws Exception
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $user = $request->user();
        $userId = isset($user) ? $user->id : 0;
        try {
            $farms = $this->model->where([
                'UserID' => $userId
            ])->get();
            return $this->sendResponse($farms, 'Get data success');
        } catch (Exception $ex){
            Log::error('FarmAPIController@index:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified Farm
     * GET|HEAD /farm/{id}
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id, Request $request)
    {
        $user = $request->user();
        $userId = isset($user) ? $user->id : 0;
        try {
            $farm = $this->model->where([
                'user_id' => $userId,
                'id' => $id
            ])->first();

            return $this->sendResponse($farm, 'Get detail data success');
        }catch (\Exception $ex) {
            Log::error($ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Store a newly created Farm in storage.
     * POST /farm
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
        $data['UserID'] = isset($user->id) ? $user->id : 0;
        try {
            $this->model->insert($data);
            return $this->sendSuccess('Success create data');
        } catch (Exception $ex) {
            Log::error('FarmAPIController@store:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Update a Farm existed in storage.
     * POST /farm
     *
     * @param $id
     * @param CreateFarmAPIRequest $request
     *
     * @throws Exception
     *
     * @return Response
     */
    public function update($id, CreateFarmAPIRequest $request)
    {
        $user = $request->user();
        $data = $request->all();
        $data['updated_user'] = 'hopdt';
        $data['updated_at'] = Carbon::now();;
        $userId = isset($user->id) ? $user->id : 0;
        try {
            $this->model->where([
                'user_id' => $userId,
                'id' => $id
            ])->update($data);
            Log::info('$data');
            Log::info($data);
            return $this->sendSuccess('Success update data');
        } catch (Exception $ex) {
            Log::error('FarmAPIController@update:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

}
