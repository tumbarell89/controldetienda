<?php

namespace App\Http\Controllers;

use App\Models\Dalmacenventa;
use App\Models\Dproducto;
use App\Models\Dventa;
use App\Models\Dventaproducto;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DventaRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DventaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $dventas = Dventa::paginate(10);

            return inertia('Ventas/Index', [
                'dventas' => $dventas,
                'i' => ($request->input('page', 1) - 1) * $dventas->perPage()
            ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $dproductos = Dalmacenventa::join('dproductos', 'dproductos.id', '=', 'dalmacenventas.dproductos_id')
                ->join('ntipogiros','ntipogiros.id','=','dproductos.dtipogiros_id')
                ->join('nunidadmedidas','nunidadmedidas.id','=','dproductos.nunidadmedida_id')
                ->select('dproductos.denominacion', 'dalmacenventas.dproductos_id as id', 'dalmacenventas.precio as precioventa', 'dalmacenventas.preciocosto as preciocosto', 'dalmacenventas.cantidad',
                                'dalmacenventas.created_at', 'dalmacenventas.updated_at',
                                'dproductos.codigocup', 'nunidadmedidas.denominacion as unidadmedida', 'dproductos.codigoproducto',
                                'ntipogiros.denominacion as tipogiro')
                ->paginate();
        //var_dump($dproductos);die;
        // return inertia('Ventas/Create', compact('dproductos'))
        //     ->with('i', ($request->input('page', 1) - 1) * $dproductos->perPage());

        return inertia('Ventas/Create', [
            'dproductos' => $dproductos
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DventaRequest $request): RedirectResponse
    {
        //var_dump($request->all());die;
        $validated = $request->validated();
    // Verifica que el total esté presente y no sea null
    if (!isset($validated['total'])) {
        return response()->json(['error' => 'Total is required'], 400);
    }
    $validated['codigoconcecutivo']= 'codigo generado';
   //var_dump($validated);die;
    // var_dump($validated['total']);die;
    // Crear la venta
    $venta = Dventa::create([
        'codigo' => $validated['codigoconcecutivo'],
        'total' => $validated['total'],
    ]);

        // Verificar si hay productos en la solicitud
        if ($request->has('products')) {
            // Recorrer cada producto y validar la cantidad
            foreach ($request->input('products') as $product) {
                $dalmacenventas = Dalmacenventa::where('dproductos_id', $product['id'])
                                                ->first();

                if ($dalmacenventas && $dalmacenventas->cantidad >= $product['cantidad']) {
                    $venta->dventaproductos()->attach(
                        $product['id'],
                        [
                            'cantidad' => $product['cantidad'],
                            'precio' => $product['precio']
                        ]
                    );
                    $dalmacenventas->cantidad = $dalmacenventas->cantidad - $product['cantidad'];
                    $dalmacenventas->save();
                } else {
                    // Manejar el caso en que la cantidad no es suficiente
                    return Redirect::route('dventas.create')
                        ->withErrors(['products' => 'Cantidad insuficiente para el producto ' . $product['denominacion']]);
                }
            }
        }
        $venta->codigo = $venta->id.'/'.date('Y');
        $venta->save();
        return Redirect::route('dventas.index')
            ->with('success', 'Dventa created successfully.');

    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $dventa = Dventa::with('dventaproductos')->findOrFail($id);

        $dproductos = Dalmacenventa::join('dproductos', 'dproductos.id', '=', 'dalmacenventas.dproductos_id')
        ->join('ntipogiros','ntipogiros.id','=','dproductos.dtipogiros_id')
        ->join('nunidadmedidas','nunidadmedidas.id','=','dproductos.nunidadmedida_id')
        ->select('dproductos.denominacion', 'dalmacenventas.dproductos_id as id', 'dalmacenventas.precio as preciocosto', 'dalmacenventas.cantidad',
                        'dalmacenventas.created_at', 'dalmacenventas.updated_at',
                        'dproductos.codigocup', 'nunidadmedidas.denominacion as unidadmedida', 'dproductos.codigoproducto',
                        'ntipogiros.denominacion as tipogiro')
        ->paginate();

        return inertia('Ventas/Show', [
            'dventa' => $dventa,
            'dproductos' => $dproductos
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $dventa = Dventa::with('dventaproductos')->findOrFail($id);

        $dproductos = Dalmacenventa::join('dproductos', 'dproductos.id', '=', 'dalmacenventas.dproductos_id')
                ->join('ntipogiros','ntipogiros.id','=','dproductos.dtipogiros_id')
                ->join('nunidadmedidas','nunidadmedidas.id','=','dproductos.nunidadmedida_id')
                ->select('dproductos.denominacion', 'dalmacenventas.dproductos_id as id', 'dalmacenventas.precio as preciocosto', 'dalmacenventas.cantidad',
                                'dalmacenventas.created_at', 'dalmacenventas.updated_at',
                                'dproductos.codigocup', 'nunidadmedidas.denominacion as unidadmedida', 'dproductos.codigoproducto',
                                'ntipogiros.denominacion as tipogiro')
                ->paginate();

        return inertia('Ventas/Edit', [
            'dventa' => $dventa,
            'dproductos' => $dproductos
        ]);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(DventaRequest $request, $id): RedirectResponse
    {
        $validated = $request->validated();

        // Verifica que el total esté presente y no sea null
        if (!isset($validated['total'])) {
            return response()->json(['error' => 'Total is required'], 400);
        }

        $dventa = Dventa::findOrFail($id);

        // Actualizar la venta
        $dventa->update([
            'total' => $validated['total'],
        ]);

        // Detach existing products
        $dventa->dventaproductos()->detach();

        // Verificar si hay productos en la solicitud
        if ($request->has('products')) {
            // Recorrer cada producto y validar la cantidad
            foreach ($request->input('products') as $product) {
                $dalmacenventas = Dalmacenventa::where('dproductos_id', $product['id'])
                                                ->first();

                if ($dalmacenventas && $dalmacenventas->cantidad >= $product['cantidad']) {
                    $dventa->dventaproductos()->attach(
                        $product['id'],
                        [
                            'cantidad' => $product['cantidad'],
                            'precio' => $product['precio']
                        ]
                    );
                } else {
                    // Manejar el caso en que la cantidad no es suficiente
                    return Redirect::route('dventas.edit', $id)
                        ->withErrors(['products' => 'Cantidad insuficiente para el producto ' . $product['denominacion']]);
                }
            }
        }

        return Redirect::route('dventas.index')
            ->with('success', 'Dventa updated successfully.');
    }


    public function destroy($id): RedirectResponse
    {
        $dventa = Dventa::find($id);

        //$dsalidaalmacen = Dsalidaalmacen::find($id);

        if ($dventa) {
            // Eliminar las relaciones en la tabla pivot
            $dventa->dventaproductos()->detach();

            // Eliminar la entrada de almacén
            $dventa->delete();
        }

        return Redirect::route('dventas.index')
            ->with('success', 'Dventa deleted successfully');
    }

    public function complete($id): RedirectResponse
    {

        // Encontrar la entrada de almacén
        $dventa = Dventa::find($id);


        if ($dventa) {
            //print('aaa');
            //print($entradaAlmacen->update(['estado' => 1]));die;
            // Actualizar el campo estado a 1
            $dventa->update(['estado' => 1]);
        }

        return Redirect::route('dventas.index')
            ->with('success', 'Entrada de almacén cerrada correctamente');
    }


}
