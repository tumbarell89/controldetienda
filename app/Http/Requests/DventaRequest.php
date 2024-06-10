<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DventaRequest extends FormRequest
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
			// 'codigoconcecutivo' => 'required',
			'total' => 'required|numeric',
            'products' => 'required|array',
            'products.*.id' => 'required|exists:dproductos,id',
            'products.*.cantidad' => 'required|integer|min:1',
            'products.*.precio' => 'required|numeric|min:0',
        ];
    }
}
