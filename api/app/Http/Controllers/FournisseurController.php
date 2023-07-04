<?php

namespace App\Http\Controllers;

use App\Models\Fournisseur;
use App\Http\Requests\StoreFournisseurRequest;
use App\Http\Requests\UpdateFournisseurRequest;

class FournisseurController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $fournisseurs = Fournisseur::all();
        return response()->json($fournisseurs);
    }

    /**
     * Store a newly created resource in storage.
     * ['nom','email','type','telephone','service'
     */
    public function store(StoreFournisseurRequest $request)
    {
        $fournisseur = Fournisseur::create([
            'nom' => $request->nom,
            'email' => $request->email,
            'type' => $request->type,
            'telephone' => $request->telephone,
            'service' => $request->service,
        ]);
        return response()->json($fournisseur, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Fournisseur $fournisseur)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateFournisseurRequest $request, Fournisseur $fournisseur)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Fournisseur $fournisseur)
    {
        //
    }
}
