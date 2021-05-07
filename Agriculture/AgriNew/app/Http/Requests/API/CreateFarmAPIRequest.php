<?php

namespace App\Http\Requests\API;

use Illuminate\Foundation\Http\FormRequest;

class CreateFarmAPIRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Override automatically apply validation rules to the URL parameters
     *
     * @param null $keys
     * @return array
     */
    public function all($keys = null)
    {
//        $data = parent::all($keys);
//        $data['id'] = $this->route('mypage');
//        return $data;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'require|string|max:128',
            'area' => 'nullable|numeric',
            'status' => 'require|digits:1'
        ];
    }



}
