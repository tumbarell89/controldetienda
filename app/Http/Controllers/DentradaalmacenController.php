<?php

namespace App\Http\Controllers;

use App\Models\Dentradaalmacen;
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
    public function index(Request $request): View
    {
        $dentradaalmacens = Dentradaalmacen::paginate();

        return view('dentradaalmacen.index', compact('dentradaalmacens'))
            ->with('i', ($request->input('page', 1) - 1) * $dentradaalmacens->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dentradaalmacen = new Dentradaalmacen();

        return view('dentradaalmacen.create', compact('dentradaalmacen'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DentradaalmacenRequest $request): RedirectResponse
    {
        Dentradaalmacen::create($request->validated());

        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Dentradaalmacen created successfully.');
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
        Dentradaalmacen::find($id)->delete();

        return Redirect::route('dentradaalmacens.index')
            ->with('success', 'Dentradaalmacen deleted successfully');
    }
}
