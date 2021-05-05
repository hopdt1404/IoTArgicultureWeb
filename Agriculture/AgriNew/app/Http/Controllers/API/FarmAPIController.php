<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\AppBaseController;
use App\Models\Farm;

class FarmAPIController extends AppBaseController
{
    var $table = 'farms';
    var $model = null;

    public function __construct(Farm $farm)
    {
        $this->model = $farm;
    }

}
