<?php

use App\Http\Controllers\CommentsController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\ContractController;
use App\Http\Controllers\GoogleAuthController;
use App\Http\Controllers\WizardController;
use App\Http\Controllers\FindContentManagerController;
use App\Http\Controllers\PlansController;
use App\Http\Controllers\ManageContentController;

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

require __DIR__ . '/auth.php';

Route::middleware(['auth:sanctum', 'verified'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/content', [ContentController::class, 'index'])->name('content');

    Route::get('/media', [MediaController::class, 'add']);
    Route::post('/media', [MediaController::class, 'create']);
    Route::get('/media/{id}', [MediaController::class, 'view']);

    Route::get('/stats', [MediaController::class, 'index'])->name('stats');
    Route::get('/wizard', [WizardController::class, 'index'])->name('wizard');

    Route::post('wizard/submit', [WizardController::class, 'submit']);
    
    Route::get('/managers', [FindContentManagerController::class, 'index'])->name('findmanagers');

    Route::get('/plans', [PlansController::class, 'index'])->name('plans');
    Route::post('/plans/create', [PlansController::class, 'submit']);

    Route::get('/contract/{id}', [ContractController::class, 'view']);
    Route::post('contract/add', [ContractController::class, 'add']);

    Route::post('comment/add', [CommentsController::class, 'add']);

    Route::get('/creators/assigned', [ContractController::class, 'list_from_manager'])->name('manager/creators');

    Route::get('/manage/exit', [ManageContentController::class, 'exit'])->name('exit');
    Route::get('/manage/{creator_id}', [ManageContentController::class, 'manage']);
    

});


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/login/google', [GoogleAuthController::class, 'redirectToGoogleProvider']);
Route::get('/login/google/callback', [GoogleAuthController::class, 'handleProviderGoogleCallback']);
