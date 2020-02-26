<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\User;
use \App\Order;

class UserController extends Controller
{
    public function index(){
    	$users = User::all();

    	$order = Order::all();

    	$usersWithOrders = $order->pluck('user_id')->toArray();


    	return view('adminviews.users', compact('users', 'usersWithOrders'));
    }

    public function changeRole($id){
    	//checks what is the current id
    	$user = User::find($id);

    	if($user->role_id == 2){
    		$user->role_id = 1;

    	}else{
    		$user->role_id = 2;
    	}
    	$user->save();
    	return redirect('/allusers');
    }

    public function destroy($id){
        $user = User::find($id);
        $user ->delete();

        return redirect()->back();
    }

}
