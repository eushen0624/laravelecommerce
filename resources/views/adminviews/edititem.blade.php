@extends('layouts.app')
@section('content')
	<h1 class="text-center">Edit Item</h1>
	<div class="col-lg-6 offset-lg-3">
		<form action="/edititem/{{$item->id}}" method="POST">
			@csrf
			@method('PATCH')
				<div class="form-group">
					<label for="name">
						Name: 
					</label>
					<input type="text" name="name" class="form-control" value="{{$item->name}}">
				</div>
				<div class="form-group">
					<label for="price">
						Price:
					</label>
					<input type="number" name="price" class="form-control" value="{{$item->price}}">
				</div>
				<div class="form-group">
					<label for="description">
						Description:
					</label>
					<input type="text" name="description" class="form-control" value="{{$item->description}}">
				</div>
				<div class="form-group">
					<label for="price">
						Image:
					</label>
					<input type="file" name="imgPath" class="form-control" value="{{$item->imgPath}}">
				</div>
				<div class="form-group">
					<label for="category_id">
						Category:
					</label>
					<select name="category_id" class="form-control">
						@foreach($categories as $indiv_category)
							<option value="{{$indiv_category->id}}" {{$indiv_category->id == $item->category_id ? "selected" : ""}}>{{$indiv_category->name}}</option>
						@endforeach
					</select>
				</div>
				<button class="btn btn-warning" type="submit">
					Edit
				</button>
		</form>
	</div>
@endsection