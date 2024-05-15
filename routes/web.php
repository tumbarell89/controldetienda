<?php

use App\Http\Controllers\DalamaceninternoController;
use App\Http\Controllers\DalamacenventaController;
use App\Http\Controllers\DalmaceninternoController;
use App\Http\Controllers\DclienteproveedorController;
use App\Http\Controllers\DentradaalmacenController;
use App\Http\Controllers\DproductoController;
use App\Http\Controllers\DsalidaalmacenController;
use App\Http\Controllers\DventaController;
use App\Http\Controllers\NalmacenController;
use App\Http\Controllers\NgiroController;
use App\Http\Controllers\NtipogiroController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });
Route::redirect('/', '/dashboard');

// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', fn()=> Inertia::render('Dashboard'))->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('dproductos', DproductoController::class);
    Route::resource('ngiros', NgiroController::class);
    Route::resource('ntipogiros', NtipogiroController::class);
    Route::resource('nalmacens', NalmacenController::class);
    Route::resource('dclienteproveedors', DclienteproveedorController::class);
    Route::resource('dalmaceninternos', DalmaceninternoController::class);
    Route::resource('dalmacenventas', DalmaceninternoController::class);
    Route::resource('dventas', DventaController::class);
    Route::resource('dentradaalmacens', DentradaalmacenController::class);
    Route::resource('dsalidaalmacens', DsalidaalmacenController::class);
});

require __DIR__.'/auth.php';
