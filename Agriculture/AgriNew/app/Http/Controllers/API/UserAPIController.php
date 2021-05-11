<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Models\Users;
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
    public function index()
    {
        //
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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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


    public function updateImageProfile(Request $request)
    {
        $user = $request->user();
        $userId = isset($user) ? $user->id : 1;
        $data = $request->all();
        $MAX_WITH_HEIGHT_IMAGE = 100;
        $image = $data['file'];
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
}
