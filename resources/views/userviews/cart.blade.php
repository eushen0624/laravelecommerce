@extends('layouts.app')
@section('content')
	<h1 class="text-center py-5">
		Cart
	</h1>

	@if($items != null)

	

	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Item Name:</th>
							<th>Item Price:</th>
							<th>Item Quantity:</th>
							<th>Item Subtotal:</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						@foreach($items as $item)
							<tr>
								<td>{{$item->name}}</td>
								<td>{{$item->price}}</td>
								<td>{{$item->quantity}}</td>
								<td>{{$item->subtotal}}</td>
								<td>
									<form action="/removeitem/{{$item->id}}" method="POST">
										@csrf
										@method('DELETE')
										<button class="btn btn-danger" type="submit">
											Remove from Cart
										</button>
									</form>
								</td>
							</tr>
						@endforeach
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>Total: {{$total}}</td>
							<td>
								<form action="/removeall" method="POST">
										@csrf
										@method('DELETE')
										<button class="btn btn-danger" type="submit">
											Remove All
										</button>
								</form>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>
								<a href="/checkout" class="btn btn-secondary">Pay via COD</a>
							</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	@else
		<h2 class="text-center py-5">
			CART IS EMPTY, GO SHOPPING!!!
		</h2>

	@endif
@endsection