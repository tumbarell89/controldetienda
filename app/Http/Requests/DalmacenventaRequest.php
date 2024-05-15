<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DalmacenventaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
			'cantidad' => 'required',
			'valamcens_id' => 'required',
			'dproductos_id' => 'required',
        ];
    }
}
