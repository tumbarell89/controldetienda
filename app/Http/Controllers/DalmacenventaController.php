<?php

namespace App\Http\Controllers;

use App\Models\Dalmacenventa;
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
    public function index(Request $request): View
    {
        $dalmacenventas = Dalmacenventa::paginate();

        return view('dalmacenventa.index', compact('dalmacenventas'))
            ->with('i', ($request->input('page', 1) - 1) * $dalmacenventas->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dalmacenventa = new Dalmacenventa();

        return view('dalmacenventa.create', compact('dalmacenventa'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DalmacenventaRequest $request): RedirectResponse
    {
        Dalmacenventa::create($request->validated());

        return Redirect::route('dalmacenventas.index')
            ->with('success', 'Dalmacenventa created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dalmacenventa = Dalmacenventa::find($id);

        return view('dalmacenventa.show', compact('dalmacenventa'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dalmacenventa = Dalmacenventa::find($id);

        return view('dalmacenventa.edit', compact('dalmacenventa'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DalmacenventaRequest $request, Dalmacenventa $dalmacenventa): RedirectResponse
    {
        $dalmacenventa->update($request->validated());

        return Redirect::route('dalmacenventas.index')
            ->with('success', 'Dalmacenventa updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dalmacenventa::find($id)->delete();

        return Redirect::route('dalmacenventas.index')
            ->with('success', 'Dalmacenventa deleted successfully');
    }
}
