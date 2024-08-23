@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa nhà cung cấp</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.nhacungcap') }}">Nhà cung cấp</a></li>
            <li class="breadcrumb-item active">Sửa nhà cung cấp</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
    <form action="{{ route('admin.nhacungcap.sua', ['id' => $nhacungcap->id]) }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label class="form-label" for="tennhacungcap">Tên nhà cung cấp</label>
                <input type="text" class="form-control @error('tennhacungcap') is-invalid @enderror" id="tennhacungcap" name="tennhacungcap" value="{{ $nhacungcap->tennhacungcap }}" required />
                @error('tennhacungcap')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="masothue">Mã số thuế</label>
                <input type="text" class="form-control @error('masothue') is-invalid @enderror" id="masothue" name="masothue" value="{{ $nhacungcap->masothue }}" required />
                @error('masothue')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="email">Email</label>
                <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" value="{{ $nhacungcap->email }}" required />
                @error('email')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="sdt">Số điện thoại</label>
                <input type="text" class="form-control @error('sdt') is-invalid @enderror" id="sdt" name="sdt" value="{{ $nhacungcap->sdt }}" required />
                @error('sdt')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="diachi">Địa chỉ</label>
                <input type="text" class="form-control @error('diachi') is-invalid @enderror" id="diachi" name="diachi" value="{{ $nhacungcap->diachi }}" required />
                @error('diachi')
                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
        </form>
    </div>
</div>
@endsection