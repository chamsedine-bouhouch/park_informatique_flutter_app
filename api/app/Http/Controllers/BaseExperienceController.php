<?php

namespace App\Http\Controllers;

use App\Models\BaseExperience;
use App\Http\Requests\StoreBaseExperienceRequest;
use App\Http\Requests\UpdateBaseExperienceRequest;

class BaseExperienceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $experiences = BaseExperience::all();
        return response()->json($experiences);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreBaseExperienceRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(BaseExperience $baseExperience)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBaseExperienceRequest $request, BaseExperience $baseExperience)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BaseExperience $baseExperience)
    {
        //
    }
}
