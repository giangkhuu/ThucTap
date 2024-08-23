@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa hãng sản xuất</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.hangsanxuat') }}">Hãng sản xuất</a></li>
            <li class="breadcrumb-item active">Sửa hãng sản xuất</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.hangsanxuat.sua', ['id' => $hangsanxuat->id]) }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tenhang">Tên hãng</label>
                <input type="text" class="form-control @error('tenhang') is-invalid @enderror" id="tenhang" name="tenhang" value="{{ $hangsanxuat->tenhang }}" required />
                @error('tenhang')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="motahang">Mô tả hãng</label>
                <textarea class="form-control" id="motahang" name="motahang">{{ $hangsanxuat->motahang }}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="hinhanh">Hình ảnh</label>
                @if(!empty($hangsanxuat->hinhanh))
                <img class="d-block rounded img-thumbnail" src="{{ env('APP_URL') . '/storage/app/' . $hangsanxuat->hinhanh }}" width="100" />
                <span class="d-block small text-danger">Bỏ trống nếu muốn giữ nguyên ảnh cũ.</span>
                @endif
                <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection