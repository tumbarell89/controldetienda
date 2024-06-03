<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DsalidaalmacenRequest extends FormRequest
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
			'factura' => 'required|string',
			'total' => 'required',
			'esventa' => 'required|boolean',
			'nalmacenes_origen_id' => 'required|exists:nalmacens,id',
			'nalmacenes_destino_id' => 'exists:nalmacens,id',
			//'dproveedor_destino_id' => 'exists:dclienteproveedors,id',
            'products' => 'required|array',
            'products.*.id' => 'required|exists:dproductos,id',
            'products.*.cantidad' => 'required|integer|min:1',
            'products.*.precio' => 'required|numeric|min:0',
        ];
    }
}
