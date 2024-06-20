<?php

use App\Http\Controllers\DalamaceninternoController;
use App\Http\Controllers\DalamacenventaController;
use App\Http\Controllers\DalmaceninternoController;
use App\Http\Controllers\DalmacenventaController;
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
    Route::get('/embarazadas', [DclienteproveedorController::class, 'embarazadas'])->name('dclienteproveedors.embarazadas');
    Route::get('/embarazadas/exportExcel', [DclienteproveedorController::class, 'exportExcel'])->name('dclienteproveedors.exportExcel');
    Route::get('/embarazadas/export/pdf', [DclienteproveedorController::class, 'exportEmbarazadasPDF'])->name('dclienteproveedors.exportPDF');
    Route::resource('dalmaceninternos', DalmaceninternoController::class);
    Route::resource('dalmacenventas', DalmacenventaController::class);
    Route::resource('dventas', DventaController::class);
    Route::put('dventas/complete/{id}', [DventaController::class, 'complete'])->name('dventas.complete');
    Route::resource('dentradaalmacens', DentradaalmacenController::class);
    Route::put('dentradaalmacens/complete/{id}', [DentradaalmacenController::class, 'complete'])->name('dentradaalmacens.complete');
    Route::resource('dsalidaalmacens', DsalidaalmacenController::class);
    Route::put('dsalidaalmacens/complete/{id}', [DsalidaalmacenController::class, 'complete'])->name('dsalidaalmacens.complete');
});

require __DIR__.'/auth.php';
