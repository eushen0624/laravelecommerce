<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Item;
use \App\Category;
use Session;

class ItemController extends Controller
{
    public function index(){
    	$items = Item::all();
    	
    	return view('catalog', compact("items"));
    }

    public function create(){
    	$categories = Category::all();

    	return view('adminviews.additem', compact("categories"));
    }

    public function store(Request $req){
    	//validate
    	$rules = array(
    		"name"=> "required",
    		"description"=>"required",
    		"price"=>"required|numeric",
    		"category_id"=>"required",
    		"imgPath"=>"required|image|mimes:jpeg,jpg,png,gif,tiff,tif,webp,bitmap|max:2048"
    	);

    	$this->validate($req, $rules);

    	// capture;
    	$newItem = new Item;
    	$newItem->name=$req->name;
    	$newItem->description = $req->description;
    	$newItem->price=$req->price;
    	$newItem->category_id=$req->category_id;

    	//image handling
    	$image = $req->file('imgPath');
    	$image_name = time().".".$image->getClientOriginalExtension();

    	//corresponds to the images public directory
    	$destination = "images/";
    	$image->move($destination, $image_name);

    	$newItem->imgPath = $destination.$image_name;
    	
    	//save
    	$newItem->save();


    	Session::flash("message","$newItem->name has been added!");
    	return redirect('/catalog');
    	
    	
    }

    public function destroy($id){
    	$itemToDelete = item::find($id);
    	$itemToDelete->delete();

    	Session::flash("message", "$itemToDelete->name has been deleted");
    	return redirect()->back();
    }

    public function edit($id){
    	$item = Item::find($id);
    	$categories = Category::all();


    	return view('/adminviews.edititem', compact('item', 'categories'));
    }

    public function update($id, Request $req){
    	$item = Item::find($id);

    	$rules = array(
    		"name"=> "required",
    		"description"=>"required",
    		"price"=>"required|numeric",
    		"category_id"=>"required",
    		"imgPath"=>"image|mimes:jpeg,jpg,png,gif,tiff,tif,webp,bitmap"
    	);

    	$this->validate($req, $rules);

    	$item->name=$req->name;
    	$item->description=$req->description;
    	$item->price=$req->price;
    	$item->category_id=$req->category_id;
    	
    	if($req->file('imgPath')!= null){
    		$image = $req->file('imgPath');
    		$image_name = time().".".$image->getClientOriginalExtension();
    		$destination = "images/";

    		$image->move($destination, $image_name);
    		$item->imgPath = $destination.$image_name;
    	}

    	$item->save();
    	Session::flash('message', "$item->name has been updated");

    	return redirect('/catalog');
    }

    public function addToCart($id, Request $req){
    	// Check if there is an existing session
    	$item = Item::find($id);

    	if(Session::has('cart')){
    		$cart = Session::get('cart');
    	}else{
    		$cart = [];
    	}
    	//Check if this is the first time we'll add an item to our cart
    	if(isset($cart[$id])){
    		$cart[$id] += $req->quantity;
    	}else{
    		$cart[$id] = $req->quantity;
    	}
    	// dd($cart);

    	Session::put("cart", $cart);

    	Session::flash('message', "$req->quantity of $item->name successfully added to cart! ");


    	//Flash a message
    	//Find the item
    	//Use the name and quantity in your flash message
    	//Ex: 2 of the itemName successfully added to cart

    	return redirect()->back();
    }

    public function showCart(){

    	//we will create a new array containing item name, price, quantity, and subtotal;
    	//initialize and empty array
    	$items = [];
    	$total = 0;
    	if(Session::has('cart')){
    		$cart = Session::get('cart');


    		foreach($cart as $itemId => $quantity){
 
    			$item = Item::find($itemId);
 
    			$item->quantity=$quantity;
    			$item->subtotal=$item->price * $quantity;

    			$items[] = $item;
    			$total += $item->subtotal;
    		}
    	}
    	return view('userviews.cart', compact('items', 'total'));
    }

    public function removeitem($id){
        // $cart = Session::get('cart');

        Session::forget("cart.$id");
        return redirect()->back();
    }

    public function removeAll(){
        // $cart = Session::get('cart');

        Session::forget("cart");
        return redirect()->back();
    }

}
