@extends('layouts.app')
@section('content')

	<h1 class="text-center">ITEMS</h1>
	<div class="d-flex justify-content-end">
		<div class="col-lg-5">
			<form class="p-3" action="/search" method="POST">
				@csrf
				<div class="input-group">
					<input type="text" name="search" class="form-control" placeholder="Search items by name, description">
					<div class="input-group-append">
						<button class="btn btn-info" type="submit">
							Search
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	@if(Session::has("message"))
		<h4>{{Session::get('message')}}</h4>
	@endif

	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<h4>Filter by Category:</h4>

				<ul class="list-group">
					@foreach($categories as $category)
						<li class="list-group-item">
							<a href="/catalog/{{$category->id}}">{{$category->name}}</a>
						</li>
					@endforeach
						<li class="list-group-item">
							<a href="/catalog">All</a>
						</li>
				</ul>
				<h4>Sort By Price</h4>
				<ul class="list-group">
					<li class="list-group-item">
						<a href="/catalog/sort/asc">Cheapest First</a>
					</li>
					<li class="list-group-item">
						<a href="/catalog/sort/desc">Most Expensive First</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-10">
				<div class="row w-100">
				@foreach($items as $indiv_item)
				<div class="col-lg-4 my-2">
					<div class="card">
						<img src="{{asset($indiv_item->imgPath)}}" height="250px">
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

						@auth
						@if(Auth::user()->role_id==1)
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
						@else
						<div class="card-footer">
							
							<form action="/addtocart/{{$indiv_item->id}}" method="POST">
								@csrf
								<input type="number" name="quantity" class="form-control" value="1" id="quantity_{{$indiv_item->id}}">
								<button class="btn btn-primary my-2" onclick="addToCart({{$indiv_item->id}})" type="submit">
									Add to Cart
								</button>
							</form>
						</div>
						
						@endif
						@endauth
							
						
						</div>
					</div>
					
				</div>
			@endforeach
		</div>
			</div>
		</div>
	</div>


	{{-- script code to prevent the screen from refreshing whenever add to cart button is clicked --}}
	<script type="text/javascript">
		const addToCart = id =>{
			let quantity =document.querySelector("#quantity_" + id).value;
			// alert(quantity + " of item " + id + " has been added to cart!");

			let data = new FormData;

			data.append("_token", "{{csrf_token()}}"); //_token - csrf's property name
			data.append("quantity", quantity);

			fetch("/addtocart/" + id, {method: "POST", body: data})
			.then(res=>res.text())
			.then(res=>console.log(res))
		}
	</script>
@endsection