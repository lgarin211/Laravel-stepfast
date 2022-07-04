<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PayController;
use App\Http\Controllers\Tagihan;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::resource('products', ProductController::class);

// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{id}', [ProductController::class, 'show']);
Route::get('/products/search/{name}', [ProductController::class, 'search']);


// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/products', [ProductController::class, 'store']);
    Route::put('/products/{id}', [ProductController::class, 'update']);
    Route::delete('/products/{id}', [ProductController::class, 'destroy']);
    Route::post('/logout', [AuthController::class, 'logout']);

    Route::post('/call_tagihan', [Tagihan::class, 'call_tagihan']);
    Route::get('/make_tagihan/{meteran}', [Tagihan::class, 'tagihan']);

    Route::post('/pay', [PayController::class, 'bayar_tagihan']);
    Route::get('/pay/done', [PayController::class, 'nestedpay']);
    Route::get('/pay/notyet', [PayController::class, 'notpay']);

    Route::get('/hispay', [PayController::class, 'newsTransaktion']);
});



Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
