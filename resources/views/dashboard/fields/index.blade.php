@extends('dashboard.layout.app')
@section('title', 'Case List')

@section('content')
    <div class="container-fluid">
        <div class="text-right">
            <button class="btn btn-danger mr-2 mb-2" onclick="window.history.back()"><i class="fa fa-arrow-left"
                    aria-hidden="true"></i></button>
            <button class="btn btn-warning mr-2 mb-2" onclick="window.location.reload()"><i class="fa fa-spinner"
                    aria-hidden="true"></i></button>
            <a href="{{ route('field-addition.create') }}" class="btn btn-primary mr-2 mb-2">
                <i class="fa fa-plus" aria-hidden="true"></i>
            </a>
        </div>
        <div class="card">
            <div class="card-header">
                <h4>Case List</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped text-center">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>TYPE</th>
                                <th>VALIDATION</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <?php $i = 1; ?>
                        <tbody>
                            @foreach ($fields as $field)
                                <tr>
                                    <td><?php echo $i++; ?></td>
                                    <td>{{ $field->name }}</td>
                                    <td>{{ $field->type }}</td>
                                    <td>{{ is_array($field->validation) ? implode(', ', $field->validation) : $field->validation }}</td>
                                    <td><a  href="{{route('field-addition.edit', $field->id )}}" class="btn btn-primary">Edit</a>
                                        <a  href="{{route('field-addition.destroy',$field->id  )}}" class="btn btn-danger">Delete</a></td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-right">
                        {{ $fields->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
