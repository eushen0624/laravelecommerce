<?php

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


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


//Show catalog
Route::get('/catalog', 'ItemController@index');

//Add item form
Route::get('/additem', 'ItemController@create');

//to save
Route::post('/additem', 'ItemController@store');

//Delete item
Route::delete('/deleteitem/{id}', 'ItemController@destroy');

//
Route::get('/edititem/{id}', 'ItemController@edit');

Route::patch('/edititem/{id}', 'ItemController@update');


//add to cart
Route::post('/addtocart/{id}', 'ItemController@addToCart');

//for car
Route::get('/showcart', 'ItemController@showCart');

//To remove an item
Route::delete('/removeitem/{id}', 'ItemController@removeItem');

//To remove all items
Route::delete('/removeall', 'ItemController@removeAll');

//Checkout
Route::get('/checkout', 'OrderController@checkout');


//view orders
Route::get('/showorders', 'OrderController@showOrders');