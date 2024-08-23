@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Tình trạng</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Tinh trạng</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover table-sm mb-0">
            <thead>
                <tr>
                    <th width="5%">#</th>
                    <th width="85%">Tình trạng</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($tinhtrang as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->tinhtrang }}</td>
                    <td class="text-center"><a href="{{ route('admin.tinhtrang.sua', ['id' => $value->id]) }}"><i class="bi bi-pencil-square"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.tinhtrang.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn muốn xóa tình trạng: {{ $value->tinhtrang }} không?')"><i class="bi bi-trash text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection