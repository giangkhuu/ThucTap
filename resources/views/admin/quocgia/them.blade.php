@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Thêm quốc gia</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.quocgia') }}">Quốc gia</a></li>
            <li class="breadcrumb-item active">Thêm quốc gia</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.quocgia.them') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tenquocgia">Tên quốc gia </label>
                <input type="text" class="form-control @error('tenquocgia') is-invalid @enderror" id="tenquocgia" name="tenquocgia" value="{{ old('tenquocgia') }}" required />
                @error('tenquocgia')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh quốc gia </label>
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="fa-light fa-save"></i> Thêm vào CSDL</button>
        </form>
    </div>
</div>
@endsection