<?php

namespace App\Http\Controllers;

use App\Models\Dalmaceninterno;
use App\Models\Dproducto;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DalmaceninternoRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;

class DalmaceninternoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $dproductos = Dalmaceninterno::join('dproductos', 'dproductos.id', '=', 'dalmaceninternos.dproductos_id')
        ->join('ntipogiros','ntipogiros.id','=','dproductos.dtipogiros_id')
        ->join('nunidadmedidas','nunidadmedidas.id','=','dproductos.nunidadmedida_id')
        ->select('dproductos.denominacion', 'dalmaceninternos.dproductos_id as id', 'dalmaceninternos.precio as preciocosto',
                        'dalmaceninternos.precioventa','dalmaceninternos.cantidad',
                        'dalmaceninternos.created_at', 'dalmaceninternos.updated_at',
                        'dproductos.codigocup', 'nunidadmedidas.denominacion as unidadmedida', 'dproductos.codigoproducto',
                        'ntipogiros.denominacion as tipogiro')
        ->paginate(10);

        return inertia('AlmacenInterno/Index', compact('dproductos'))
            ->with('i', ($request->input('page', 1) - 1) * $dproductos->perPage());
    }


    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $dproducto = Dproducto::with('ntipogiro')->find($id);

        return inertia('AlmacenInterno/Show', compact('dproducto'));
    }


}
