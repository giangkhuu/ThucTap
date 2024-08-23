@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa quốc gia</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.quocgia') }}">Quốc gia</a></li>
            <li class="breadcrumb-item active">Sửa quốc gia</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.quocgia.sua', ['id' => $quocgia->id]) }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tenquocgia">Tên quốc gia</label>
                <input type="text" class="form-control @error('tenquocgia') is-invalid @enderror" id="tenquocgia" name="tenquocgia" value="{{ $quocgia->tenquocgia }}" required />
                @error('tenquocgia')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh</label>
                @if(!empty($quocgia->hinhanh))
                <img class="d-block rounded img-thumbnail" src="{{ env('APP_URL') . '/storage/app/' . $quocgia->hinhanh }}" width="100" />
                <span class="d-block small text-danger">Bỏ trống nếu muốn giữ nguyên ảnh cũ.</span>
                @endif
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection