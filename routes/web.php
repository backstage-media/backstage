<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\GoogleAuthController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';

Route::middleware(['auth:sanctum', 'verified'])->group(function(){
    Route::get('/dashboard',[DashboardController::class, 'index'])->name('dashboard');
    Route::get('/content',[ContentController::class, 'index'])->name('content');

    Route::get('/media',[MediaController::class, 'add']);
    Route::post('/media',[MediaController::class, 'create']);
    Route::get('/media/{id}',[MediaController::class, 'view']);

    Route::get('/stats',[MediaController::class, 'index'])->name('stats');
    
});


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/login/google', [GoogleAuthController::class,'redirectToGoogleProvider']);
Route::get('/login/google/callback', [GoogleAuthController::class,'handleProviderGoogleCallback']);
