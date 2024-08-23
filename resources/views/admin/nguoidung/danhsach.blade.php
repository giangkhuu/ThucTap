@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Người dùng</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Người dùng</li>
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
                    <th width="20%">Họ và tên</th>
                    <th width="20%">Tên đăng nhập</th>
                    <th width="35%">Email</th>
                    <th width="10%">Quyền hạn</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($nguoidung as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->name }}</td>
                    <td>{{ $value->username }}</td>
                    <td>{{ $value->email }}</td>
                    <td>{{ $value->role }}</td>
                    <td class="text-center"><a href="{{ route('admin.nguoidung.sua', ['id' => $value->id]) }}"><i class="bi bi-pencil-square"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.nguoidung.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa thuốc {{ $value->name }} không?')"><i class="bi bi-trash text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection