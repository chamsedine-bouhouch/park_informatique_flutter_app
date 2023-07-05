<?php

namespace App\Http\Controllers;

use App\Enums\RoleType;
use App\Models\Ticket;
use App\Http\Requests\StoreTicketRequest;
use App\Http\Requests\UpdateTicketRequest;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $role = auth()->user()->role;
        // dd(auth()->user()->role==RoleType::ADMIN);
        $tickets = collect();

        switch ($role) {
            case RoleType::EMPLOYE:
                $tickets = Ticket::where('employe_id', auth()->id())->get();
                break;
            case RoleType::ADMIN:
                $tickets = Ticket::all();
                break;
            case RoleType::ADMIN:
                $tickets = Ticket::all();
                break;
            case RoleType::CHEF_HERARCHIE:
                $tickets = Ticket::where('chef_id', auth()->id())->get();
                break;
            default:
                $tickets = Ticket::where('technicien_id', auth()->id())->get();
                break;
        }
        return response()->json($tickets);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTicketRequest $request)
    {
        $ticket = Ticket::create([
            'titre' => $request->titre,
            'lieu' => $request->lieu,
            'service' => $request->service,
            'description' => $request->description,
            'employe_id' => $request->employe_id,
            'technicien_id' => $request->technicien_id,
            'chef_id' => $request->chef_id,
        ]);
        return response()->json($ticket, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Ticket $ticket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTicketRequest $request, Ticket $ticket)
    {
        $ticket->update([
            'titre' => $request->titre,
            'lieu' => $request->lieu,
            'service' => $request->service,
            'description' => $request->description,
            'statut' => $request->statut,
            'employe_id' => $request->employe_id,
            'technicien_id' => $request->technicien_id,
            'chef_id' => $request->chef_id,
            // $request->all()
        ]);
        return response()->json($ticket, 201);
    }
    public function affecter(UpdateTicketRequest $request, Ticket $ticket)
    {
        $ticket->technicien_id = $request->technicien_id;
        $ticket->statut = "Affecté";
        $ticket->save();
    }
    public function refuser(UpdateTicketRequest $request, Ticket $ticket)
    {
        $ticket->statut = "Refusé";
        $ticket->save();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Ticket $ticket)
    {
        //
    }
}
