@extends('layouts.app')
@section('content')

	<h1 class="text-center py-5">Add Item</h1>
	<div class="col-lg-6 offset-lg-3">
		<form action="/additem" method="POST" enctype="multipart/form-data">
				@csrf
				<div class="form-group">
					<label for="name">
						Name: 
					</label>
					<input type="text" name="name" class="form-control">
				</div>
				<div class="form-group">
					<label for="price">
						Price:
					</label>
					<input type="number" name="price" class="form-control">
				</div>
				<div class="form-group">
					<label for="description">
						Description:
					</label>
					<textarea name="description" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label for="price">
						Image:
					</label>
					<input type="file" name="imgPath" class="form-control">
				</div>
				<div class="form-group">
					<label for="category_id">
						Category:
					</label>
					<select name="category_id" class="form-control">
						@foreach($categories as $indiv_category)
							<option value="{{$indiv_category->id}}">
								{{$indiv_category->name}}
							</option>
						@endforeach
					</select>
				</div>
				<button class="btn btn-warning" type="submit">
					Add Item
				</button>
			</form>
	</div>
@endsection