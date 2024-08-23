@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Thêm danh mục</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.danhmuc') }}">Danh mục</a></li>
            <li class="breadcrumb-item active">Thêm danh mục</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.danhmuc.them') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tendanhmuc">Tên danh mục</label>
                <input type="text" class="form-control @error('tendanhmuc') is-invalid @enderror" id="tendanhmuc" name="tendanhmuc" value="{{ old('tendanhmuc') }}" required />
                @error('tendanhmuc')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="motadanhmuc">Mô tả danh mục</label>
                <textarea class="form-control" id="motadanhmuc" name="motadanhmuc"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh danh mục</label>
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="fa-light fa-save"></i> Thêm vào CSDL</button>
        </form>
    </div>
</div>
@endsection