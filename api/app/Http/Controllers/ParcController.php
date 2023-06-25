<?php

namespace App\Http\Controllers;

use App\Models\Parc;
use App\Http\Requests\StoreParcRequest;
use App\Http\Requests\UpdateParcRequest;

class ParcController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $parcs = Parc::all();
        return response()->json($parcs);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreParcRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Parc $parc)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateParcRequest $request, Parc $parc)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Parc $parc)
    {
        //
    }
}
