<?php

namespace App\Http\Controllers;

use App\Models\Ngiro;
use Exception;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\NgiroRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Inertia\Inertia;

class NgiroController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $ngiros = Ngiro::paginate(5);

        return inertia('Giro/Index', [
            'ngiros' => $ngiros,
            'flash' => [
                'success' => session('success'),
                'error' => session('error'),
            ],
            'i' => ($request->input('page', 1) - 1) * $ngiros->perPage()
        ]);
    }
    // return inertia('Giro/Index');

    /**
     * Show the form for creating a new resource.
     */
    public function create()
{
    $ngiro = new Ngiro();
    return inertia('Giro/Create', compact('ngiro'));
}


    /**
     * Store a newly created resource in storage.
     */
    public function store(NgiroRequest $request): RedirectResponse
    {
        Ngiro::create($request->validated());

        return Redirect::route('ngiros.index')
            ->with('success', 'Elemento creado satisfactoriamente');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $ngiro = Ngiro::findOrFail($id);

        return Inertia::render('Giro/Show', [
            'ngiro' => $ngiro,
        ]);
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $ngiro = Ngiro::findOrFail($id);

        return inertia('Giro/Edit', ['ngiro' => $ngiro]);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(NgiroRequest $request, Ngiro $ngiro): RedirectResponse
    {
        $ngiro->update($request->validated());

        return Redirect::route('ngiros.index')
            ->with('success', 'Elemento actualizado satisfactoriamente');
    }

    public function destroy($id): RedirectResponse
    {
        try{
            Ngiro::findOrFail($id)->delete();

            session()->flash('success', 'El registro se ha eliminado correctamente.');

            return Redirect::route('ngiros.index');
        }catch(Exception $e){
            session()->flash('error', ($e->getCode()==23503)? 'Elemento en uso': 'Existe algun problema para eliminar este elemento contacte al equipo de soporte');
            return Redirect::route('ngiros.index');
        }

    }
}
