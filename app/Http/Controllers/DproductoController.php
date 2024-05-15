<?php

namespace App\Http\Controllers;

use App\Models\Dproducto;
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
    public function index(Request $request): View
    {
        $dproductos = Dproducto::paginate();

        return view('dproducto.index', compact('dproductos'))
            ->with('i', ($request->input('page', 1) - 1) * $dproductos->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dproducto = new Dproducto();

        return view('dproducto.create', compact('dproducto'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DproductoRequest $request): RedirectResponse
    {
        Dproducto::create($request->validated());

        return Redirect::route('dproductos.index')
            ->with('success', 'Dproducto created successfully.');
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
