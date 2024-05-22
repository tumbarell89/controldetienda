<?php

namespace App\Http\Controllers;

use App\Models\Ngiro;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\NgiroRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

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
    public function create(): View
    {
        $ngiro = new Ngiro();

        return view('ngiro.create', compact('ngiro'));
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
    public function show($id): View
    {
        $ngiro = Ngiro::find($id);

        return view('ngiro.show', compact('ngiro'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $ngiro = Ngiro::find($id);

        if (!$ngiro) {
            // Maneja el caso donde el ngiro no existe, por ejemplo redirigiendo o mostrando un mensaje de error
            return redirect()->route('ngiros.index')->with('error', 'Ngiro not found.');
        }

        return inertia('Giro/Edit', ['ngiro' => $ngiro]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(NgiroRequest $request, Ngiro $ngiro): RedirectResponse
    {
        $ngiro->update($request->validated());

        return Redirect::route('ngiros.index')
            ->with('success', 'Ngiro updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Ngiro::find($id)->delete();

        return Redirect::route('ngiros.index')
            ->with('success', 'Ngiro deleted successfully');
    }
}
