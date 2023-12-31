<?php

use App\Http\Controllers\BaseExperienceController;
use App\Http\Controllers\FournisseurController;
use App\Http\Controllers\ParcController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\UserController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/sanctum/token', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
        'device_name' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['The provided credentials are incorrect.'],
        ]);
    }

    return $user->createToken($request->device_name)->plainTextToken;
});



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/user/revoke', function (Request $request) {
    $user = $request->user();
    $user->tokens()->delete();
    return response()->json('user revoked token');
});


Route::middleware('auth:sanctum')->group(function () {
    Route::get('employes', [UserController::class, 'getEmployees'])->name('getEmployees');
    Route::get('techniciens', [UserController::class, 'getTechniciens'])->name('getTechniciens');
    Route::post('ajout-utilisateur', [UserController::class, 'store'])->name('ajout-utilisateur');

    Route::apiResource('tickets', TicketController::class);
    Route::apiResource('experiences', BaseExperienceController::class);
    Route::apiResource('fournisseurs', FournisseurController::class);
    Route::apiResource('parcs', ParcController::class);

    Route::put('tickets/{ticket}/approuver', [TicketController::class, 'approuver'])->name('tickets.approuver');
    Route::put('tickets/{ticket}/refuser', [TicketController::class, 'refuser'])->name('tickets.refuser');
    Route::put('tickets/{ticket}/traiter', [TicketController::class, 'traiter'])->name('tickets.traiter');
    Route::put('tickets/{ticket}/nonTraiter', [TicketController::class, 'nonTraiter'])->name('tickets.nonTraiter');
});
