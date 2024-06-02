<?php

namespace App\Http\Controllers;

use App\Models\Dclienteproveedor;
use App\Models\Dentradaalmacen;
use App\Models\Dproducto;
use App\Models\Nalmacen;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DentradaalmacenRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DentradaalmacenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

            $dentradaalmacens = Dentradaalmacen::with('nalmacen')->with('dclienteproveedor')->paginate();

            return inertia('EntradaAlmacen/Index', [
                'dentradaalmacens' => $dentradaalmacens,
                'i' => ($request->input('page', 1) - 1) * $dentradaalmacens->perPage()
            ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $nalmacens = Nalmacen::where('tipo', 1)->get(); // Filtrar por tipo igual a 1
        $dclienteproveedors = Dclienteproveedor::where('tipocliente', 1)->get(); // Filtrar por tipoccliente igual a 1
        $dproductos = Dproducto::all(); // Obtener todos los productos

        return inertia('EntradaAlmacen/Create', [
            'nalmacens' => $nalmacens,
            'dclienteproveedors' => $dclienteproveedors,
            'dproductos' => $dproductos
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DentradaalmacenRequest $request): RedirectResponse
    {
        // Crear la entrada de almacén
        $entradaAlmacen = Dentradaalmacen::create($request->validated());

        // Verificar si hay productos en la solicitud
        if ($request->has('products')) {
            // Recorrer cada producto y adjuntarlo a la entrada de almacén
            foreach ($request->input('products') as $product) {
                $entradaAlmacen->dproductoentradas()->attach(
                    $product['id'],
                    [
                        'cantidad' => $product['quantity'],
                        'precio' => $product['precio']
                    ]
                );
            }
        }


        // Redireccionar con un mensaje de éxito
        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Entrada de almacén creada exitosamente.');
    }


    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dentradaalmacen = Dentradaalmacen::find($id);

        return view('dentradaalmacen.show', compact('dentradaalmacen'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dentradaalmacen = Dentradaalmacen::find($id);

        return view('dentradaalmacen.edit', compact('dentradaalmacen'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DentradaalmacenRequest $request, Dentradaalmacen $dentradaalmacen): RedirectResponse
    {
        $dentradaalmacen->update($request->validated());

        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Dentradaalmacen updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        // Encontrar la entrada de almacén
        $entradaAlmacen = Dentradaalmacen::find($id);

        if ($entradaAlmacen) {
            // Eliminar las relaciones en la tabla pivot
            $entradaAlmacen->dproductoentradas()->detach();

            // Eliminar la entrada de almacén
            $entradaAlmacen->delete();
        }

        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Entrada de almacén eliminada correctamente');
    }

}
