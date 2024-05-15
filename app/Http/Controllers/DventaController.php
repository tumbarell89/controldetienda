<?php

namespace App\Http\Controllers;

use App\Models\Dventa;
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
    public function index(Request $request): View
    {
        $dventas = Dventa::paginate();

        return view('dventa.index', compact('dventas'))
            ->with('i', ($request->input('page', 1) - 1) * $dventas->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dventa = new Dventa();

        return view('dventa.create', compact('dventa'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DventaRequest $request): RedirectResponse
    {
        Dventa::create($request->validated());

        return Redirect::route('dventas.index')
            ->with('success', 'Dventa created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dventa = Dventa::find($id);

        return view('dventa.show', compact('dventa'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dventa = Dventa::find($id);

        return view('dventa.edit', compact('dventa'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DventaRequest $request, Dventa $dventa): RedirectResponse
    {
        $dventa->update($request->validated());

        return Redirect::route('dventas.index')
            ->with('success', 'Dventa updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dventa::find($id)->delete();

        return Redirect::route('dventas.index')
            ->with('success', 'Dventa deleted successfully');
    }
}
