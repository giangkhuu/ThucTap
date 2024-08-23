@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Xem liên hệ</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.lienhe') }}">Liên hệ</a></li>
            <li class="breadcrumb-item active">Xem liên hệ</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        @csrf
        <div class="mb-3">
            <label class="form-label" for="ten">Tên</label>
            <input type="text" class="form-control @error('ten') is-invalid @enderror" id="ten" name="ten" value="{{ $lienhe->ten }}" disabled />
            @error('ten')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="mb-3">
            <label class="form-label" for="email">Email</label>
            <input type="text" class="form-control @error('email') is-invalid @enderror" id="email" name="email" value="{{ $lienhe->email }}" disabled />
            @error('email')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="mb-3">
            <label class="form-label" for="sdt">Điện thoại</label>
            <input type="text" class="form-control @error('sdt') is-invalid @enderror" id="sdt" name="sdt" value="{{ $lienhe->sdt }}" disabled />
            @error('sdt')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="mb-3">
            <label class="form-label" for="chude">Chủ đề</label>
            <input type="text" class="form-control @error('chude') is-invalid @enderror" id="chude" name="chude" value="{{ $lienhe->chude }}" disabled />
            @error('chude')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="mb-3">
            <label class="form-label" for="noidung">Nội dung</label>
            <textarea class="form-control" id="noidung" name="noidung">{{ $lienhe->noidung }}</textarea>
        </div>
        <button class="btn "><a class="text-danger" href="{{ route('admin.lienhe.xoa', ['id' => $lienhe->id]) }}" onclick="return confirm('Bạn muốn xóa chủ đề: {{ $lienhe->chude }} không?')"><i class="bi bi-trash text-danger"></i> Xóa</a></button>
        </form>
    </div>
</div>
@endsection
@section('javascript')
<script src="{{ asset('vendor/ckeditor5/ckeditor.js') }}"></script>

<script>
    ClassicEditor.create(document.querySelector('#noidung'), {
        licenseKey: '',
    }).then(editor => {
        window.editor = editor;
    }).catch(error => {
        console.error(error);
    });
</script>
@endsection