@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa bình luận</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.binhluanthuoc') }}">Danh sách thuốc</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.binhluanthuoc.xem', ['id' => $binhluanthuoc->thuoc_id]) }}">Danh sách bình luận</a></li>
            <li class="breadcrumb-item active">Sửa bình luận</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.binhluanthuoc.sua', ['id' => $binhluanthuoc->id]) }}" method="post">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="noidungbinhluan">Nội dung bình luận</label>
                <input type="text" class="form-control @error('noidungbinhluan') is-invalid @enderror" id="noidungbinhluan" name="noidungbinhluan" value="{{ $binhluanthuoc->noidungbinhluan }}" required />
                @error('noidungbinhluan')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection