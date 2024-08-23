@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Liên hệ</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Liên hệ</li>
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
                    <th width="20%">Tên liên hệ</th>
                    <th width="20%">Email</th>
                    <th width="10%">Điện thoại</th>
                    <th width="30%">Chủ đề</th>
                    <th width="10%">Xem chi tiết</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lienhe as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->ten }}</td>
                    <td>{{ $value->email }}</td>
                    <td>{{ $value->sdt }}</td>
                    <td>{{ $value->chude }}</td>
                    <td class="text-center"><a href="{{ route('admin.lienhe.xem', ['id' => $value->id]) }}"><i class="bi bi-eye"></i></a></td>
                    <td class="text-center"><a href="" onclick="return confirm('Bạn muốn xóa chủ đề: {{ $value->chude }} không?')"><i class="bi bi-trash text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection