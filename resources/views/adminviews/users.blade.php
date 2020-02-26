@extends('layouts.app')
@section('content')
	
	<h1 class="text-center py-5">
		All USERS
	</h1>

	<div class="col-lg-10 offset-lg-1">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Name:</th>
					<th>Email Address:</th>
					<th>Role:</th>
					<th>Action:</th>
				</tr>
			</thead>
			<tbody>
				@foreach($users as $user)
					<tr>
						<th>{{$user->name}}</th>
						<th>{{$user->email}}</th>
						<th>{{$user->role->name}}</th>
						<th>
							@if($user->role_id == 1)
								<a href="/changerole/{{$user->id}}" class="btn btn-info">Demote</a>
							@else
								<a href="/changerole/{{$user->id}}" class="btn btn-success">Promote</a>
							@endif
							

							{{-- in this section in_array method is used to check if the user id is in the $userWithOrders array --}}
							@if(in_array($user->id, $usersWithOrders)|| $user->role_id==1)
							@else
								<form action="/deleteuser/{{$user->id}}" method="POST">
									@csrf
									@method('DELETE')
									<button type="submit" class="btn btn-danger">Delete User</button>
								</form>
							@endif
							
						
						</th>
					</tr>
				@endforeach
			</tbody>
		</table>
	</div>
@endsection