<?php

namespace App\Http\Controllers;

use App\Models\Dalmacenventa;
use App\Models\Dproducto;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DalmacenventaRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DalmacenventaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //$dalmacenventas = Dalmacenventa::paginate();
        $dproductos = Dalmacenventa::join('dproductos', 'dproductos.id', '=', 'dalmacenventas.dproductos_id')
                ->join('ntipogiros','ntipogiros.id','=','dproductos.dtipogiros_id')
                ->join('nunidadmedidas','nunidadmedidas.id','=','dproductos.nunidadmedida_id')
                ->select('dproductos.denominacion', 'dalmacenventas.dproductos_id as id', 'dalmacenventas.precio as precioventa',
                        'dalmacenventas.preciocosto','dalmacenventas.cantidad',
                                'dalmacenventas.created_at', 'dalmacenventas.updated_at',
                                'dproductos.codigocup', 'nunidadmedidas.denominacion as unidadmedida', 'dproductos.codigoproducto',
                                'ntipogiros.denominacion as tipogiro')
                ->paginate(10);
        //var_dump($dproductos);die;
        return inertia('AlmacenVentas/Index', compact('dproductos'))
            ->with('i', ($request->input('page', 1) - 1) * $dproductos->perPage());
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $dproducto = Dproducto::with('ntipogiro')->find($id);

        return inertia('AlmacenVentas/Show', compact('dproducto'));
    }

}
