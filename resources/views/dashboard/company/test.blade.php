@extends('dashboard.layout.app')
@section('title', 'Company List')

@section('content')
    <div class="container-fluid">
        <div class="text-right">
            <button class="btn btn-danger mr-2 mb-2" onclick="window.history.back()"><i class="fa fa-arrow-left"
                    aria-hidden="true"></i></button>
            <button class="btn btn-warning mr-2 mb-2" onclick="window.location.reload()"><i class="fa fa-spinner"
                    aria-hidden="true"></i></button>
            <a href="{{ route('company.create_question') }}" class="btn btn-primary mr-2 mb-2">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </a>
        </div>
        <div class="card">
            <div class="card-header row">
                <div class='col-md-7'><h4>Questionnaire List</h4></div>
                <div class="col-md-5">
                        
        <form action="" class="row" method="GET">
        <div class="col-md-4">
        <input type="text" name="search" placeholder="Search..." value="" class="form-control">
        </div>
        <div class="col-md-2">
        <button type="submit" class="btn btn-primary">Search</button>
        </div>       
        </form>
        </div>


        <div class="card-body">
        <table id="submissions-table" class="table table-bordered">
    <thead>
        <tr>
            <th>Case ID</th>
            <th>Work</th>
            <th>Questionnaire Fields</th>
        </tr>
    </thead>
    <tbody>
      @foreach ($submissions as $submission)
<tr>
    <td>{{ $submission['case_id'] }}</td>
    <td>{{ $submission['work'] }}</td>
    <td>
        @foreach ($submission['questionnaire'] as $field)
            <strong>{{ $field['name'] ?? '-' }}</strong>: {{ $field['data'] ?? '-' }}<br>
        @endforeach
    </td>
</tr>
@endforeach
    </tbody>
</table>

<!-- ✅ Pagination links -->
        <div class="d-flex justify-content-center mt-3">
        {{ $submissions->links() }}
        </div>



        </div>
        </div>
        </div>
@endsection
