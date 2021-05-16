<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Http\Requests\API\CreateUserAPIRequest;
use App\Http\Requests\API\UploadImageAPIRequest;
use App\Models\Users;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use PHPUnit\Util\Exception;

class UserAPIController extends AppBaseController
{
    var $table = 'users';
    var $model = null;

    public function __construct(Users $user)
    {
        $this->model = $user;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
//        $data = $request->all();
        $user = $request->user();
        $userId = isset($user) ? $user->id : 1;
        try {
            $userData = $this->model->where('id', $userId)->first();
            return $this->sendResponse($userData, 'Index function');
        } catch (Exception $ex){
            Log::error('UserAPIController@index:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    public function getAvatar($id, Request $request) {
        try {
            $avatar = $this->model->select('avatar')->where('id', $id)->first();
            Log::info('$avatar');
            Log::info($avatar);
            return $this->sendResponse($avatar,'getAvatar  success');
        } catch (Exception $ex){
            Log::error('UserAPIController@getAvatar:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    public function deleteAvatar($id) {
        try {
            $this->model->where('id', $id)->update(['avatar' => '']);
            return $this->sendSuccess('getAvatar  success');
        } catch (Exception $ex){
            Log::error('UserAPIController@deleteAvatar:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  CreateUserAPIRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id, CreateUserAPIRequest $request)
    {
        $data = $request->all();
        $user = $request->user();
        $userName = isset($user) ? $user->email : 'hopdt';
        $data['updated_at'] = Carbon::now();
//        $data['updated_user'] = $userName;
        try {
            $this->model->where([
                'id' => $id,
                'email' => $data['email']
            ])->update($data);
            return $this->sendSuccess('Update data success');
        } catch (Exception $ex){
            Log::error('UserAPIController@update:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function updateImageProfile(UploadImageAPIRequest $request)
    {
        $user = $request->user();
        $userId = isset($user) ? $user->id : 1;
        $data = $request->all();
        $MAX_WITH_HEIGHT_IMAGE = 100;
        $image = $data['image'];
        try {
            $image = \Intervention\Image\Facades\Image::make($image->getRealPath());
            $widthImage = $image->width();
            $heightImage = $image->height();

            /* Resize image */
            if ($widthImage > $MAX_WITH_HEIGHT_IMAGE || $heightImage > $MAX_WITH_HEIGHT_IMAGE) {
                $ratioX = $widthImage / $MAX_WITH_HEIGHT_IMAGE;
                $ratioY = $heightImage / $MAX_WITH_HEIGHT_IMAGE;
                if ($ratioX > $ratioY) {
                    $image->widen($MAX_WITH_HEIGHT_IMAGE)->save();
                } else {
                    $image->heighten($MAX_WITH_HEIGHT_IMAGE)->save();
                }
            }

            // Get content image base64
            $imageBase64 = (string) $image->encode('data-url');
            $imageBase64 = explode(',', $imageBase64);
            $imageBase64 = $imageBase64[1];
            $this->model->where('id', $userId)->update(['avatar' => $imageBase64]);
            return $this->sendSuccess( 'Success upload image');
        } catch (Exception $ex){
            Log::error('UserAPIController@updateImageProfile:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function maskFunction () {
        try {
            return $this->sendSuccess( 'Mask function success, update image real is other function');
        } catch (Exception $ex){
            Log::error('UserAPIController@maskFunction:' . $ex->getMessage().$ex->getTraceAsString());
            return $this->sendError(Response::$statusTexts[Response::HTTP_INTERNAL_SERVER_ERROR], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
