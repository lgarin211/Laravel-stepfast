<?php
use App\Http\Controllers\Tagihan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PayController;
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


Route::get('/call_tagihan', [Tagihan::class, 'call_tagihan']);
Route::get('/make_tagihan/{meteran}', [Tagihan::class, 'tagihan']);
Route::get('/pay', [PayController::class, 'bayar_tagihan']);
Route::get('/pay/done', [PayController::class, 'nestedpay']);
Route::get('/pay/notyet', [PayController::class, 'notpay']);

Route::get('/hispay', [PayController::class, 'newsTransaktion']);


Route::get('/build', [Tagihan::class, 'daftarmateran']);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
