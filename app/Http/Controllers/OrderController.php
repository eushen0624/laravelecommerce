<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use \App\Order;
use \App\Item;
use Session;

class OrderController extends Controller
{
   public function checkout(){
   	//save the transaction in the order table
   	//Make sure that there is a user logged in
   	//Populate our item_order;

   	if(Auth::user()){

   		//how to access many to many table
   		$order = new Order;
   		$order->user_id = Auth::user()->id;
   		$order->status_id = 1;//pending
   		$order->payment_id = 1; //cod
   		$order->total = 0;
   		$order->save();

   		$cart = Session::get('cart');

   		$total = 0;

   		foreach($cart as $itemId => $quantity){
   			//syntax for adding entries to our many to many table
   			$order->items()->attach($itemId, ["quantity"=>$quantity]);

   			$item = Item::find($itemId);
   			$total += $item->price * $quantity;
   		}

   		$order->total = $total;
   		$order->save();

   		Session::forget('cart');
   		Session::flash('message', "Order successfully placed");
   		return redirect('/catalog');
   	}else{
   		return redirect('/login');
   	}
   }

   public function showOrders(){
   		$orders = Order::where('user_id', Auth::user()->id)->get();
   		//"get()" - to get all data. "first()" - to get 1 data.

   		return view('userviews.orders', compact('orders'));
   }
}
