<?php

namespace App\Http\Controllers;

use App\Models\Dsalidaalmacen;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DsalidaalmacenRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DsalidaalmacenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $dsalidaalmacens = Dsalidaalmacen::paginate();

        return view('dsalidaalmacen.index', compact('dsalidaalmacens'))
            ->with('i', ($request->input('page', 1) - 1) * $dsalidaalmacens->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dsalidaalmacen = new Dsalidaalmacen();

        return view('dsalidaalmacen.create', compact('dsalidaalmacen'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DsalidaalmacenRequest $request): RedirectResponse
    {
        Dsalidaalmacen::create($request->validated());

        return Redirect::route('dsalidaalmacens.index')
            ->with('success', 'Dsalidaalmacen created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dsalidaalmacen = Dsalidaalmacen::find($id);

        return view('dsalidaalmacen.show', compact('dsalidaalmacen'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dsalidaalmacen = Dsalidaalmacen::find($id);

        return view('dsalidaalmacen.edit', compact('dsalidaalmacen'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DsalidaalmacenRequest $request, Dsalidaalmacen $dsalidaalmacen): RedirectResponse
    {
        $dsalidaalmacen->update($request->validated());

        return Redirect::route('dsalidaalmacens.index')
            ->with('success', 'Dsalidaalmacen updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dsalidaalmacen::find($id)->delete();

        return Redirect::route('dsalidaalmacens.index')
            ->with('success', 'Dsalidaalmacen deleted successfully');
    }
}
