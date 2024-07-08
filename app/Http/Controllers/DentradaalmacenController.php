<?php

namespace App\Http\Controllers;

use App\Models\Dalmaceninterno;
use App\Models\Dclienteproveedor;
use App\Models\Dentradaalmacen;
use App\Models\Dproducto;
use App\Models\Dproductoentrada;
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

            $dentradaalmacens = Dentradaalmacen::with('nalmacen')->with('dclienteproveedor')->paginate(10);

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
                        'cantidad' => $product['cantidad'],
                        'precio' => $product['precio'],
                        'precioventa' => $product['precioventa']
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
    public function show($id)
    {
        $dentradaalmacen = Dentradaalmacen::with('dproductoentradas')->findOrFail($id);

        // Obtener los almacenes, proveedores y productos necesarios
        $nalmacens = Nalmacen::all();
        $dclienteproveedors = Dclienteproveedor::all();
        $dproductos = Dproducto::all();

        // Estructurar los productos con los datos pivot necesarios
        $productosConPivot = $dentradaalmacen->dproductoentradas->map(function($producto) {
            return [
                'id' => $producto->id,
                'denominacion' => $producto->denominacion,
                'cantidad' => $producto->pivot->cantidad,
                'precio' => $producto->pivot->precio,
                'precioventa' => $producto->pivot->precioventa,
            ];
        });

        // Pasar los datos a la vista de edición
        return inertia('EntradaAlmacen/Show', [
            'dentradaalmacen' => $dentradaalmacen,
            'nalmacens' => $nalmacens,
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
        $dentradaalmacen = Dentradaalmacen::with('dproductoentradas')->findOrFail($id);

        // Obtener los almacenes, proveedores y productos necesarios
        $nalmacens = Nalmacen::all();
        $dclienteproveedors = Dclienteproveedor::all();
        $dproductos = Dproducto::all();

        // Estructurar los productos con los datos pivot necesarios
        $productosConPivot = $dentradaalmacen->dproductoentradas->map(function($producto) {
            return [
                'id' => $producto->id,
                'denominacion' => $producto->denominacion,
                'cantidad' => $producto->pivot->cantidad,
                'precio' => $producto->pivot->precio,
                'precioventa' => $producto->pivot->precioventa,
            ];
        });

        // Pasar los datos a la vista de edición
        return inertia('EntradaAlmacen/Edit', [
            'dentradaalmacen' => $dentradaalmacen,
            'nalmacens' => $nalmacens,
            'dclienteproveedors' => $dclienteproveedors,
            'dproductos' => $dproductos,
            'productosConPivot' => $productosConPivot, // Pasar los productos con los datos pivot
        ]);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(DentradaalmacenRequest $request, $id)
    {
        // Buscar la entrada de almacén existente
        $dentradaalmacen = Dentradaalmacen::findOrFail($id);

        // Actualizar la entrada de almacén con los datos validados
        $dentradaalmacen->update($request->validated());

        // Verificar si hay productos en la solicitud
        if ($request->has('products')) {
            // Sincronizar los productos con la entrada de almacén
            $productos = collect($request->input('products'))->mapWithKeys(function ($product) {
                return [$product['id'] => ['cantidad' => $product['cantidad'], 'precio' => $product['precio'], 'precioventa' => $product['precioventa']]];
            });
            $dentradaalmacen->dproductoentradas()->sync($productos);
        }

        return redirect()->route('dentradaalmacens.index')->with('success', 'Entrada de almacén actualizada con éxito');
    }

    public function destroy($id): RedirectResponse
    {
        // Encontrar la entrada de almacén
        $entradaAlmacen = Dentradaalmacen::find($id);
        //var_dump('adada');die;
        if ($entradaAlmacen) {
                //var_dump('dproductosentrada');die;
                $dproductosentrada = Dproductoentrada::join('dproductos', 'dproductos.id', '=', 'dproductoentradas.dproducto_id')
                                    ->where('dentradaalmacen_id', $id)
                                    ->get();

                foreach ($dproductosentrada as $product) {
                    $dalmaceninterno = Dalmaceninterno::where('dproductos_id', $product['dproductos_id'])
                                                    ->where('precio', $product['precio'])
                                                    ->first();
                    if ($dalmaceninterno && $dalmaceninterno->cantidad >= $product['cantidad']) {
                        // Eliminar las relaciones en la tabla pivot
                        $entradaAlmacen->dproductoentradas()->detach();
                        // Eliminar la entrada de almacén
                        $entradaAlmacen->delete();

                    } else {
                        // Manejar el caso en que la cantidad no es suficiente
                        return Redirect::route('dentradaalmacens.index')
                            ->withErrors(['products' => 'Cantidad insuficiente para el producto ' . $product['denominacion']]);
                    }
                }


        }

        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Entrada de almacén eliminada correctamente');
    }

    public function complete($id): RedirectResponse
    {

        // Encontrar la entrada de almacén
        $entradaAlmacen = Dentradaalmacen::find($id);


        if ($entradaAlmacen) {
            //print('aaa');
            //print($entradaAlmacen->update(['estado' => 1]));die;
            // Actualizar el campo estado a 1
            $entradaAlmacen->update(['estado' => 1]);
        }

        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Entrada de almacén cerrada correctamente');
    }

}
