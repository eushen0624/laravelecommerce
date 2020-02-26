@extends('layouts.app')
@section('content')
	<h1 class="text-center py-5">
		All Orders
	</h1>

	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<table class="table table-stripedborder">
					<thead>
						<tr>
							<th>Order Id</th>
							<th>Order Date</th>
							<th>Order Details</th>
							<th>Order Total</th>
							<th>Customer Name</th>
							<th>Payment</th>
							<th>Status</th>
							<th>Actions</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						@foreach($orders as $order)
							<tr>
								<td>{{$order->created_at->format('U')}}-{{$order->id}}</td>
								<td>{{$order->created_at->diffForHumans()}}</td>
								<td>
									@foreach($order->items as $item)

									Name: {{$item->name}},
									Qty: {{$item->pivot->quantity}}
									<br>
									

									@endforeach
								</td>
								<td>{{$order->total}}</td>
								<td>{{$order->payment->name}}</td>
								<td>{{$item->price}}</td>
								<td>{{$order->status->name}}</td>
								<td>{{$order->user->name}}</td>
								<td>
									<a href="/cancelorder/{{$order->id}}" class="btn btn-danger {{$order->status_id == 4 || $order->status_id == 3 ? "disabled" : ""	}}">Cancel</a>
								</td>
							</tr>

						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>

@endsection