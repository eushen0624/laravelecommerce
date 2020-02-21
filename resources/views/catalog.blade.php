@extends('layouts.app')
@section('content')

	<h1 class="text-center">ITEMS</h1>

	@if(Session::has("message"))
		<h4>{{Session::get('message')}}</h4>
	@endif
	<div class="container">
		<div class="row">
			@foreach($items as $indiv_item)
				<div class="col-lg-4 my-2">
					<div class="card">
						<img src="{{$indiv_item->imgPath}}" height="250px">
						<div class="card-body">
							<h6 class="card-title">
								{{$indiv_item->name}}
							</h6>
							<p class="card-text">
								Price {{$indiv_item->price}}
							</p>
							<p class="card-text">
								Description: {{$indiv_item->description}}
							</p>
							
							<p class="card-text">
								Category: {{$indiv_item->category->name}}
							</p>
						<div class="card-footer">
							<form action="/deleteitem/{{$indiv_item->id}}" method="POST">
							@csrf
							@method('DELETE')
							<button class="btn btn-danger" type="submit">
								Delete
							</button>
							<a href="/edititem/{{$indiv_item->id}}" class="btn btn-success">Edit</a>
						</form>
						</div>
						<div class="card-footer">
							
							<form action="/addtocart/{{$indiv_item->id}}" method="POST">
								@csrf
								<input type="number" name="quantity" class="form-control" value="1">
								<button class="btn btn-primary" type="submit">
									Add to Cart
								</button>
							</form>
						</div>
						
						
							
						
						</div>
					</div>
					
				</div>
			@endforeach
		</div>
	</div>
@endsection