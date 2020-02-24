@extends('layouts.app')
@section('content')
	<h1 class="text-center py-5">
		Orders
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
							<th>Payment</th>
							<th>Order Status</th>
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
								<td>{{$order->payment->status}}</td>
								<td></td>
							</tr>

						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>

@endsection