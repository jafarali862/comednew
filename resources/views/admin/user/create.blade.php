<x-admin>
    @section('title', 'Create User')

    <div class="card card-primary">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h3 class="card-title">Create User</h3>
            <a href="{{ route('admin.user.index') }}" class="btn btn-sm btn-secondary">
                <i class="fas fa-arrow-left mr-1"></i> Back
            </a>
        </div>
        <form action="{{ route('admin.user.store') }}" method="POST">
            @csrf
            <div class="card-body">
                <div class="row">
                    <!-- Name -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">Name: <span class="text-danger">*</span></label>
                            <input type="text" id="name" name="name" class="form-control @error('name') is-invalid @enderror"
                                value="{{ old('name') }}" required>
                            <x-error name="name" />
                        </div>
                    </div>
                    <!-- Email -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email">Email: <span class="text-danger">*</span></label>
                            <input type="email" id="email" name="email" class="form-control @error('email') is-invalid @enderror"
                                value="{{ old('email') }}" required>
                            <x-error name="email" />
                        </div>
                    </div>
                    <!-- Password -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="password">Password: <span class="text-danger">*</span></label>
                            <input type="password" id="password" name="password" class="form-control @error('password') is-invalid @enderror"
                                required>
                            <x-error name="password" />
                        </div>
                    </div>
                    <!-- Role -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="role">Role: <span class="text-danger">*</span></label>
                            <select id="role" name="role" class="form-control @error('role') is-invalid @enderror" required>
                                <option value="" disabled {{ old('role') ? '' : 'selected' }}>Select the role</option>
                                @foreach ($roles as $role)
                                    <option value="{{ $role->name }}" {{ $role->name == old('role') ? 'selected' : '' }}>
                                        {{ ucfirst($role->name) }}
                                    </option>
                                @endforeach
                            </select>
                            <x-error name="role" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-footer text-right">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save mr-1"></i> Save
                </button>
            </div>
        </form>
    </div>
</x-admin>
