<?php

namespace App\Http\Controllers;

use App\Models\Dproducto;
use App\Models\Ntipogiro;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DproductoRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DproductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $dproductos = Dproducto::with('ntipogiro')->paginate();

        return inertia('Productos/Index', [
            'dproductos' => $dproductos,
            'i' => ($request->input('page', 1) - 1) * $dproductos->perPage()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $ntipogiros = Ntipogiro::all(); // Asumiendo que el modelo es Ngiro
        return inertia('Productos/Create', [
            'ntipogiros' => $ntipogiros
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validar la solicitud
        $validatedData = $request->validate([
            'denominacion' => 'required|string|max:255',
            'preciocosto'=>'required|numeric|min:1',
            'codigocup'=>'required|string|max:100',
            'codigoproducto'=>'required|string|max:100',
            'unidadmedida'=>'required|string|max:10',
            'tipogiro_id' => 'required|exists:ntipogiros,id', // Asegura que el giro_id existe en la tabla ngiros
        ]);

        // Crear un nuevo Ntipogiro
        $dproductos = new Dproducto();
        $dproductos->denominacion = $validatedData['denominacion'];
        $dproductos->preciocosto = $validatedData['preciocosto'];
        $dproductos->codigocup = $validatedData['codigocup'];
        $dproductos->codigoproducto = $validatedData['codigoproducto'];
        $dproductos->unidadmedida = $validatedData['unidadmedida'];
        $dproductos->dtipogiros_id = $validatedData['tipogiro_id']; // Asigna el giro_id del formulario
        $dproductos->save();

        // Redireccionar a la página de índice con un mensaje de éxito
        return redirect()->route('dproductos.index')->with('success', 'Producto creado exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dproducto = Dproducto::find($id);

        return view('dproducto.show', compact('dproducto'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dproducto = Dproducto::find($id);

        return view('dproducto.edit', compact('dproducto'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DproductoRequest $request, Dproducto $dproducto): RedirectResponse
    {
        $dproducto->update($request->validated());

        return Redirect::route('dproductos.index')
            ->with('success', 'Dproducto updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dproducto::find($id)->delete();

        return Redirect::route('dproductos.index')
            ->with('success', 'Dproducto deleted successfully');
    }
}
