<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DentradaalmacenRequest extends FormRequest
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
    // public function rules(): array
    // {
    //     return [
	// 		'factura' => 'required|string',
	// 		'total' => 'required',
	// 		'nalmacens_id' => 'required',
	// 		'dproveedor_origen_id' => 'required',
    //     ];
    // }

    public function rules()
{
    return [
        'factura' => 'required|string|max:255',
        'total' => 'required|numeric',
        'nalmacens_id' => 'required|exists:nalmacens,id',
        'dproveedor_origen_id' => 'required|exists:dclienteproveedors,id',
        'products' => 'required|array',
        'products.*.id' => 'required|exists:dproductos,id',
        'products.*.quantity' => 'required|integer|min:1',
        'products.*.precio' => 'required|numeric|min:0',
    ];
}

}
