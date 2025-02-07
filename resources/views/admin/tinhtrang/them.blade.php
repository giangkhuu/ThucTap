@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Thêm tình trạng</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.tinhtrang') }}">Tình trạng</a></li>
            <li class="breadcrumb-item active">Thêm tình trạng</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.tinhtrang.them') }}" method="post">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tinhtrang">Tình trạng</label>
                <input type="text" class="form-control @error('tinhtrang') is-invalid @enderror" id="tinhtrang" name="tinhtrang" value="{{ old('tinhtrang') }}" required />
                @error('tinhtrang')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Thêm vào CSDL</button>
        </form>
    </div>
</div>
@endsection