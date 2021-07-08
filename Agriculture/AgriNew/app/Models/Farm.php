<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Farm
 * @package App\Models

 */
class Farm extends Model
{
    protected $table = 'Farms';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [];

}
