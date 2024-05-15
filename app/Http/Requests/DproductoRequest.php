<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DproductoRequest extends FormRequest
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
			'denominacion' => 'required|string',
			'preciocosto' => 'required',
			'codigocup' => 'required|string',
			'codigoproducto' => 'required|string',
			'unidadmedida' => 'required|string',
			'dtipogiros_id' => 'required',
        ];
    }
}
