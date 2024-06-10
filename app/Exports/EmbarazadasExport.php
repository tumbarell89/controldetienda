<?php
namespace App\Exports;

use App\Models\Dclienteproveedor;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class EmbarazadasExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return Dclienteproveedor::where('esembarazada', true)
            ->orderBy('activo', 'desc')
            ->get(['denominacion', 'carnetidentidad', 'created_at']);
    }

    public function headings(): array
    {
        return [
            'Denominación',
            'Carnet de Identidad',
            'Fecha de Creado',
        ];
    }
}
