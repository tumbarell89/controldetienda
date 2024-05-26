<?php

namespace App\Http\Controllers;

use App\Models\Ngiro;
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
        $ngiros = Ngiro::paginate();

        return inertia('Giro/Index', [
            'ngiros' => $ngiros,
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
            ->with('success', 'Ngiro created successfully.');
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
            ->with('success', 'Giro updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Ngiro::findOrFail($id)->delete();

        return Redirect::route('ngiros.index')
            ->with('success', 'Giro deleted successfully');
    }
}
