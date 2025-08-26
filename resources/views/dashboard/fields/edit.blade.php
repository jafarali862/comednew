@extends('dashboard.layout.app')
@section('title', 'Add Form Fields')
@section('content')
    <div class="container-fluid">
        <div class="text-right">
            <button class="btn btn-danger mr-2 mb-2" onclick="window.history.back()"><i class="fa fa-arrow-left"
                    aria-hidden="true"></i></button>
            <button class="btn btn-warning mr-2 mb-2" onclick="window.location.reload()"><i class="fa fa-spinner"
                    aria-hidden="true"></i></button>
            <a href="{{route('field-addition.index')}}" class="btn btn-primary mr-2 mb-2">
                <i class="fa fa-list" aria-hidden="true"></i>
            </a>
        </div>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card mb-5">
                    <div class="card-header">
                        <h4>Add New Form Fields</h4>
                    </div>
                    <div id="successMessage" class="alert alert-success mt-3" style="display: none;"></div>
                    <div class="card-body">
                        <form  action="{{route('field-addition.update',$fieldList->id)}}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="form-group">
                                <label for="name">Name</label> <span class="text-danger">*</span>
                                <input type="text" id="name" name="name" class="form-control" placeholder="Enter name" value="{{$fieldList->name}}">
                                <span id="name-error" class="text-danger"></span>
                            </div>

                            <div class="form-group">
                                <label for="father_name">Field Type</label> <span class="text-danger">*</span>
                                <input type="text" id="" name="type" class="form-control" placeholder="Field Type" value="{{$fieldList->type}}">
                                
                            </div>


                            <div class="form-group">
                                <label for="validation">validation</label> <span class="text-danger">*</span>
                                <input type="text" id="" name="validation[]" class="form-control" placeholder="Validation" value="{{ is_array($fieldList->validation) ? implode(', ', $fieldList->validation) : $fieldList->validation }}">
                                <span id="phone-error" class="text-danger"></span>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
@endsection
