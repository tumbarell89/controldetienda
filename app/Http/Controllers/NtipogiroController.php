<?php

namespace App\Http\Controllers;

use App\Models\Ngiro;
use App\Models\Ntipogiro;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\NtipogiroRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class NtipogiroController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
{
    $ntipogiros = Ntipogiro::with('ngiro')->paginate();

    return inertia('TipoGiros/Index', [
        'ntipogiros' => $ntipogiros,
        'i' => ($request->input('page', 1) - 1) * $ntipogiros->perPage()
    ]);
}


    /**
     * Show the form for creating a new resource.
     */
    public function create()
{
    $ngiros = Ngiro::all(); // Asumiendo que el modelo es Ngiro
    return inertia('TipoGiros/Create', [
        'ngiros' => $ngiros
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
            'giro_id' => 'required|exists:ngiros,id', // Asegura que el giro_id existe en la tabla ngiros
        ]);

        // Crear un nuevo Ntipogiro
        $ntipogiro = new Ntipogiro();
        $ntipogiro->denominacion = $validatedData['denominacion'];
        $ntipogiro->ngiros_id = $validatedData['giro_id']; // Asigna el giro_id del formulario
        $ntipogiro->save();

        // Redireccionar a la página de índice con un mensaje de éxito
        return redirect()->route('ntipogiros.index')->with('success', 'Tipo de Giro creado exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $ntipogiro = Ntipogiro::with('ngiro')->findOrFail( $id );

        return inertia('TipoGiros/Show', [
            'ntipogiro' => $ntipogiro,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
{
    $ntipogiro = Ntipogiro::findOrFail($id);
    $ngiros = Ngiro::all(); // Obtener todos los giros disponibles

    return inertia('TipoGiros/Edit', [
        'ntipogiro' => $ntipogiro,
        'ngiros' => $ngiros, // Pasar los giros a la vista
    ]);
}


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Ntipogiro $ntipogiro): RedirectResponse
    {
        $request->validate([
            'denominacion' => 'required|string|max:255',
            'ngiros_id' => 'required|exists:ngiros,id',
        ]);

        $ntipogiro->update($request->only('denominacion', 'ngiros_id'));

        return Redirect::route('ntipogiros.index')
            ->with('success', 'Ntipogiro updated successfully');
    }


    public function destroy($id): RedirectResponse
    {
        Ntipogiro::find($id)->delete();

        return Redirect::route('ntipogiros.index')
            ->with('success', 'Ntipogiro deleted successfully');
    }
}
