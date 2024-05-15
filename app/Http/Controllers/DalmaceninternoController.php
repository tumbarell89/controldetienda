<?php

namespace App\Http\Controllers;

use App\Models\Dalmaceninterno;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DalmaceninternoRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DalmaceninternoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $dalmaceninternos = Dalmaceninterno::paginate();

        return view('dalmaceninterno.index', compact('dalmaceninternos'))
            ->with('i', ($request->input('page', 1) - 1) * $dalmaceninternos->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dalmaceninterno = new Dalmaceninterno();

        return view('dalmaceninterno.create', compact('dalmaceninterno'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DalmaceninternoRequest $request): RedirectResponse
    {
        Dalmaceninterno::create($request->validated());

        return Redirect::route('dalmaceninternos.index')
            ->with('success', 'Dalmaceninterno created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dalmaceninterno = Dalmaceninterno::find($id);

        return view('dalmaceninterno.show', compact('dalmaceninterno'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dalmaceninterno = Dalmaceninterno::find($id);

        return view('dalmaceninterno.edit', compact('dalmaceninterno'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DalmaceninternoRequest $request, Dalmaceninterno $dalmaceninterno): RedirectResponse
    {
        $dalmaceninterno->update($request->validated());

        return Redirect::route('dalmaceninternos.index')
            ->with('success', 'Dalmaceninterno updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dalmaceninterno::find($id)->delete();

        return Redirect::route('dalmaceninternos.index')
            ->with('success', 'Dalmaceninterno deleted successfully');
    }
}
