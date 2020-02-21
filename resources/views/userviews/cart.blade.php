@extends('layouts.app')
@section('content')
	<h1 class="text-center py-5">
		Cart
	</h1>

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
								<td></td>
							</tr>
						@endforeach
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>Total: {{$total}}</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
@endsection