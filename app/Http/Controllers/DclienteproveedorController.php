<?php

namespace App\Http\Controllers;


use App\Models\Dclienteproveedor;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DclienteproveedorRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade as PDF;
use App\Exports\EmbarazadasExport;

class DclienteproveedorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
             $dclienteproveedors = Dclienteproveedor::paginate();

            return inertia('ClienteProveedor/Index', [
                'dclienteproveedors' => $dclienteproveedors,
                'i' => ($request->input('page', 1) - 1) * $dclienteproveedors->perPage()
            ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $dclienteproveedor = new Dclienteproveedor();
        return inertia('ClienteProveedor/Create', [
            'dclienteproveedor' => $dclienteproveedor
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    $validator = \Validator::make($request->all(), [
        'denominacion' => 'required|string|max:255',
        'tipocliente' => 'required|in:1,2', // 1: Proveedor, 2: Cliente
        'esembarazada' => 'sometimes|boolean',
        'activo' => 'required|boolean',
    ]);

    // Agregar validación condicional
    $validator->sometimes('carnetidentidad', 'required|string|max:255', function ($input) {
        return $input->tipocliente == '2'; // Requiere 'carnetidentidad' solo si 'tipocliente' es Cliente (2)
    });

    if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
    }

    // Crear el cliente/proveedor
    Dclienteproveedor::create([
        'denominacion' => $request->denominacion,
        'tipocliente' => $request->tipocliente,
        'carnetidentidad' => $request->tipocliente == '2' ? $request->carnetidentidad : null,
        'esembarazada' => $request->esembarazada ?? false,
        'activo' => $request->activo,
    ]);

    return redirect()->route('dclienteproveedors.index')->with('success', 'Dclienteproveedor created successfully');
}


    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $dclienteproveedor = Dclienteproveedor::findOrFail($id);

        return inertia('ClienteProveedor/Show', [
            'dclienteproveedor' => $dclienteproveedor
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $dclienteproveedor = Dclienteproveedor::findOrFail($id);
        return inertia('ClienteProveedor/Edit', [
            'dclienteproveedor' => $dclienteproveedor
        ]);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DclienteproveedorRequest $request, Dclienteproveedor $dclienteproveedor): RedirectResponse
    {
        $dclienteproveedor->update($request->validated());

        return Redirect::route('dclienteproveedors.index')
            ->with('success', 'Dclienteproveedor updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dclienteproveedor::find($id)->delete();

        return Redirect::route('dclienteproveedors.index')
            ->with('success', 'Dclienteproveedor deleted successfully');
    }

    public function embarazadas(Request $request)
    {
        $embarazadas = Dclienteproveedor::where('esembarazada', true)
            ->orderBy('activo', 'desc')
            ->paginate(10);

        return inertia('ClienteProveedor/EmbarazadasIndex', [
            'embarazadas' => $embarazadas,
        ]);
    }

    public function exportExcel()
    {
        //var_dump('asddad');die;
        return Excel::download(new EmbarazadasExport, 'embarazadas.xlsx', 'Xlsx');
    }

    public function exportEmbarazadasPDF()
    {
        $embarazadas = Dclienteproveedor::where('esembarazada', true)
            ->orderBy('activo', 'desc')
            ->get();

        $pdf = PDF::loadView('embarazadas-pdf', compact('embarazadas'));
        return $pdf->download('embarazadas.pdf');
    }

}
