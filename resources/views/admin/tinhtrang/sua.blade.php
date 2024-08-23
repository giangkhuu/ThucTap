@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa tình trạng</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.danhmuc') }}">Tình trạng</a></li>
            <li class="breadcrumb-item active">Sửa tình trạng</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.tinhtrang.sua', ['id' => $tinhtrang->id]) }}" method="post">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tinhtrang">Tình trạng</label>
                <input type="text" class="form-control @error('tinhtrang') is-invalid @enderror" id="tinhtrang" name="tinhtrang" value="{{ $tinhtrang->tinhtrang }}" required />
                @error('tinhtrang')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection