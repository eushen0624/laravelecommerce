<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Item extends Model
{
     public function category(){
    	return $this->belongsTo("\App\Category");
    }

    public function orders(){
    	return $this->belongsToMany("\App\Order")->withPivot("quantity")->withTimeStamps();
    }

    use SoftDeletes;


}
