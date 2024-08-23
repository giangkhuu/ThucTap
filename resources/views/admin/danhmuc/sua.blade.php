@extends('layouts.app')
@section('content')

<div class="pagetitle">
    <h1>Sửa danh mục</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.danhmuc') }}">Danh mục</a></li>
            <li class="breadcrumb-item active">Sửa danh mục</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.danhmuc.sua', ['id' => $danhmuc->id]) }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tendanhmuc">Tên danh mục</label>
                <input type="text" class="form-control @error('tendanhmuc') is-invalid @enderror" id="tendanhmuc" name="tendanhmuc" value="{{ $danhmuc->tendanhmuc }}" required />
                @error('tendanhmuc')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="motadanhmuc">Mô tả danh mục</label>
                <textarea class="form-control" id="motadanhmuc" name="motadanhmuc">{{ $danhmuc->motadanhmuc }}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh</label>
                @if(!empty($danhmuc->hinhanh))
                <img class="d-block rounded img-thumbnail" src="{{ env('APP_URL') . '/storage/app/' . $danhmuc->hinhanh }}" width="100" />
                <span class="d-block small text-danger">Bỏ trống nếu muốn giữ nguyên ảnh cũ.</span>
                @endif
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection