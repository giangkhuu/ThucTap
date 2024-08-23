@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa nhóm thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.nhomthuoc') }}">Nhóm thuốc</a></li>
            <li class="breadcrumb-item active">Sửa nhóm thuốc</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.nhomthuoc.sua', ['id' => $nhomthuoc->id]) }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tennhomthuoc">Tên nhóm thuốc</label>
                <input type="text" class="form-control @error('tennhomthuoc') is-invalid @enderror" id="tennhomthuoc" name="tennhomthuoc" value="{{ $nhomthuoc->tennhomthuoc }}" required />
                @error('tennhomthuoc')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="motanhomthuoc">Mô tả nhóm thuốc</label>
                <textarea class="form-control" id="motanhomthuoc" name="motanhomthuoc">{{ $nhomthuoc->motanhomthuoc }}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh</label>
                @if(!empty($nhomthuoc->hinhanh))
                <img class="d-block rounded img-thumbnail" src="{{ env('APP_URL') . '/storage/app/' . $nhomthuoc->hinhanh }}" width="100" />
                <span class="d-block small text-danger">Bỏ trống nếu muốn giữ nguyên ảnh cũ.</span>
                @endif
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection