<?php

namespace App\Http\Controllers;

use App\Models\Dclienteproveedor;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Http\Requests\DclienteproveedorRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class DclienteproveedorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $dclienteproveedors = Dclienteproveedor::paginate();

        return view('dclienteproveedor.index', compact('dclienteproveedors'))
            ->with('i', ($request->input('page', 1) - 1) * $dclienteproveedors->perPage());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $dclienteproveedor = new Dclienteproveedor();

        return view('dclienteproveedor.create', compact('dclienteproveedor'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DclienteproveedorRequest $request): RedirectResponse
    {
        Dclienteproveedor::create($request->validated());

        return Redirect::route('dclienteproveedors.index')
            ->with('success', 'Dclienteproveedor created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show($id): View
    {
        $dclienteproveedor = Dclienteproveedor::find($id);

        return view('dclienteproveedor.show', compact('dclienteproveedor'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id): View
    {
        $dclienteproveedor = Dclienteproveedor::find($id);

        return view('dclienteproveedor.edit', compact('dclienteproveedor'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DclienteproveedorRequest $request, Dclienteproveedor $dclienteproveedor): RedirectResponse
    {
        $dclienteproveedor->update($request->validated());

        return Redirect::route('dclienteproveedors.index')
            ->with('success', 'Dclienteproveedor updated successfully');
    }

    public function destroy($id): RedirectResponse
    {
        Dclienteproveedor::find($id)->delete();

        return Redirect::route('dclienteproveedors.index')
            ->with('success', 'Dclienteproveedor deleted successfully');
    }
}
