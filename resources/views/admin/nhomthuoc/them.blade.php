@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Thêm nhóm thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.nhomthuoc') }}">Nhóm thuốc</a></li>
            <li class="breadcrumb-item active">Thêm nhóm thuốc</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.nhomthuoc.them') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tennhomthuoc">Tên nhóm thuốc</label>
                <input type="text" class="form-control @error('tennhomthuoc') is-invalid @enderror" id="tennhomthuoc" name="tennhomthuoc" value="{{ old('tennhomthuoc') }}" required />
                @error('tennhomthuoc')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="motanhomthuoc">Mô tả nhóm thuốc</label>
                <textarea class="form-control" id="motanhomthuoc" name="motanhomthuoc"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh nhóm thuốc</label>
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="fa-light fa-save"></i> Thêm vào CSDL</button>
        </form>
    </div>
</div>
@endsection