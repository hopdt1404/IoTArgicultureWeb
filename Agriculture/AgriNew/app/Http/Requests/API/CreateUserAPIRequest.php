<?php

namespace App\Http\Requests\API;

use Illuminate\Foundation\Http\FormRequest;

class CreateUserAPIRequest extends FormRequest
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
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string|max:128',
            'email' => 'required|string|max:128|email:rfc,dns',
            // unique:users,email : check data submit not exist in table (email column in users table)
            'address' => 'nullable|string|max:255',
            'phone_number' => 'nullable|string|max:15'
        ];
    }
}
