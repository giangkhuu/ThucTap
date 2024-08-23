@extends('layouts.frontend')
@section('title', 'Quên mật khẩu')
@section('content')
<div class="container py-4 my-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card border-0 shadow">
                <div class="card-body">
                    <h2 class="h4 mb-1">Đặt lại mật khẩu</h2>
                    <hr>
                    <form method="POST" action="{{ route('password.email') }}">
                        @csrf
                        @if(session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                        @endif
                        @error('email')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                        <div class="input-group mb-3">
                            <i class="ci-mail position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                            <input type="email" class="form-control rounded-start @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}" placeholder="Email" required />
                        </div>
                        <hr class="mt-4">
                        <div class="text-end pt-4">
                            <button class="btn btn-primary" type="submit"><i class="ci-sign-in me-2 ms-n21"></i>Gửi liên kết khôi phục mật khẩu</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection