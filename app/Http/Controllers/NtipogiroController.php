<?php

namespace App\Http\Controllers;

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
    public function index(Request $request): View
    {
        $ntipogiros = Ntipogiro::paginate();

        return view('ntipogiro.index', compact('ntipogiros'))
            ->with('i', ($request->input('page', 1) - 1) * $ntipogiros->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $ntipogiro = new Ntipogiro();

        return view('ntipogiro.create', compact('ntipogiro'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(NtipogiroRequest $request): RedirectResponse
    {
        Ntipogiro::create($request->validated());

        return Redirect::route('ntipogiros.index')
            ->with('success', 'Ntipogiro created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $ntipogiro = Ntipogiro::find($id);

        return view('ntipogiro.show', compact('ntipogiro'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $ntipogiro = Ntipogiro::find($id);

        return view('ntipogiro.edit', compact('ntipogiro'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(NtipogiroRequest $request, Ntipogiro $ntipogiro): RedirectResponse
    {
        $ntipogiro->update($request->validated());

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
