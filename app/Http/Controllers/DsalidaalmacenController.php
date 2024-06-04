<?php

namespace App\Http\Controllers;

use App\Http\Requests\DsalidaalmacenRequest;
use App\Models\Dclienteproveedor;
use App\Models\Dproducto;
use App\Models\Dsalidaalmacen;
use App\Models\Nalmacen;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DsalidaalmacenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $dsalidaalmacens = Dsalidaalmacen::with(['nalmacenorigen', 'nalmacendestino'])->with('dclienteproveedor')->paginate();

        return inertia('SalidaVentas/Index', [
            'dsalidaalmacens' => $dsalidaalmacens,
            'i' => ($request->input('page', 1) - 1) * $dsalidaalmacens->perPage()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $nalmacenorigen = Nalmacen::all(); // Filtrar por tipo igual a 1
        $nalmacendestino = Nalmacen::whereNot('tipo', 1)->get(); // Filtrar por tipo igual a 1
        $dclienteproveedors = Dclienteproveedor::where('tipocliente', 1)->get(); // Filtrar por tipoccliente igual a 1
        $dproductos = Dproducto::all(); // Obtener todos los productos

        return inertia('SalidaVentas/Create', [
            'nalmacenorigen' => $nalmacenorigen,
            'nalmacendestino' => $nalmacendestino,
            'dclienteproveedors' => $dclienteproveedors,
            'dproductos' => $dproductos
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DsalidaalmacenRequest $request): RedirectResponse
    {
        // Crear la entrada de almacén
        $salidaAlmacen = Dsalidaalmacen::create($request->validated());

        // Verificar si hay productos en la solicitud
        if ($request->has('products')) {
            // Recorrer cada producto y adjuntarlo a la entrada de almacén
            foreach ($request->input('products') as $product) {
                $salidaAlmacen->dproductosalidas()->attach(
                    $product['id'],
                    [
                        'cantidad' => $product['cantidad'],
                        'precio' => $product['precio']
                    ]
                );
            }
        }


        // Redireccionar con un mensaje de éxito
        return Redirect::route('dsalidaalmacen.index')
            ->with('success', 'Salida de almacén creada exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Obtener la entrada de almacén
        $dsalidaalmacen = Dsalidaalmacen::with('dproductosalidas')->findOrFail($id);

        // Obtener los almacenes, proveedores y productos necesarios
        $nalmacenorigen = Nalmacen::all(); // Filtrar por tipo igual a 1
        $nalmacendestino = Nalmacen::whereNot('tipo', 1)->get(); // Filtrar por tipo igual a 1
        $dclienteproveedors = Dclienteproveedor::where('tipocliente', 1)->get(); // Filtrar por tipoccliente igual a 1
        $dproductos = Dproducto::all();

        // Estructurar los productos con los datos pivot necesarios
        $productosConPivot = $dsalidaalmacen->dproductosalidas->map(function($producto) {
            return [
                'id' => $producto->id,
                'denominacion' => $producto->denominacion,
                'cantidad' => $producto->pivot->cantidad,
                'precio' => $producto->pivot->precio,
            ];
        });
        //var_dump($productosConPivot);die;
        // Pasar los datos a la vista de edición
        return inertia('SalidaVentas/Show', [
            'dsalidaalmacen' => $dsalidaalmacen,
            'nalmacenorigen' => $nalmacenorigen,
            'nalmacendestino' => $nalmacendestino,
            'dclienteproveedors' => $dclienteproveedors,
            'dproductos' => $dproductos,
            'productosConPivot' => $productosConPivot, // Pasar los productos con los datos pivot
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        // Obtener la entrada de almacén
        $dsalidaalmacen = Dsalidaalmacen::with('dproductosalidas')->findOrFail($id);

        // Obtener los almacenes, proveedores y productos necesarios
        $nalmacenorigen = Nalmacen::all(); // Filtrar por tipo igual a 1
        $nalmacendestino = Nalmacen::whereNot('tipo', 1)->get(); // Filtrar por tipo igual a 1
        $dclienteproveedors = Dclienteproveedor::where('tipocliente', 1)->get(); // Filtrar por tipoccliente igual a 1
        $dproductos = Dproducto::all();

        // Estructurar los productos con los datos pivot necesarios
        $productosConPivot = $dsalidaalmacen->dproductosalidas->map(function($producto) {
            return [
                'id' => $producto->id,
                'denominacion' => $producto->denominacion,
                'cantidad' => $producto->pivot->cantidad,
                'precio' => $producto->pivot->precio,
            ];
        });
        //var_dump($productosConPivot);die;
        // Pasar los datos a la vista de edición
        return inertia('SalidaVentas/Edit', [
            'dsalidaalmacen' => $dsalidaalmacen,
            'nalmacenorigen' => $nalmacenorigen,
            'nalmacendestino' => $nalmacendestino,
            'dclienteproveedors' => $dclienteproveedors,
            'dproductos' => $dproductos,
            'productosConPivot' => $productosConPivot, // Pasar los productos con los datos pivot
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DsalidaalmacenRequest $request, $id)
    {
        // Buscar la entrada de almacén existente
        $dsalidaalmacen = Dsalidaalmacen::findOrFail($id);

        // Actualizar la entrada de almacén con los datos validados
        $dsalidaalmacen->update($request->validated());

        // Verificar si hay productos en la solicitud
        if ($request->has('products')) {
            // Sincronizar los productos con la entrada de almacén
            $productos = collect($request->input('products'))->mapWithKeys(function ($product) {
                return [$product['id'] => ['cantidad' => $product['cantidad'], 'precio' => $product['precio']]];
            });
            $dsalidaalmacen->dproductosalidas()->sync($productos);
        }

        return redirect()->route('dsalidaalmacens.index')->with('success', 'Salida de almacén actualizada con éxito');
    }

    public function destroy($id): RedirectResponse
    {
        // Encontrar la entrada de almacén
        $dsalidaalmacen = Dsalidaalmacen::find($id);

        if ($dsalidaalmacen) {
            // Eliminar las relaciones en la tabla pivot
            $dsalidaalmacen->dproductoentradas()->detach();

            // Eliminar la entrada de almacén
            $dsalidaalmacen->delete();
        }

        return Redirect::route('dsalidaalmacens.index')
            ->with('success', 'Salida  de almacén eliminada correctamente');
    }
}
