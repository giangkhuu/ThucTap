@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Nhà cung cấp</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Nhà cung cấp</li>
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
                    <th width="20%">Tên nhà cung cấp</th>
                    <th width="10%">Mã số thuế</th>
                    <th width="15%">Email</th>
                    <th width="15%">Số điện thoai</th>
                    <th width="15%">Địa chỉ</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($nhacungcap as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->tennhacungcap }}</td>
                    <td>{{ $value->masothue }}</td>
                    <td>{{ $value->email }}</td>
                    <td>{{ $value->sdt }}</td>
                    <td>{{ $value->diachi }}</td>
                    <td class="text-center"><a href="{{ route('admin.nhacungcap.sua', ['id' => $value->id]) }}"><i class="fa-light fa-edit"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.nhacungcap.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa nhà cung cấp {{ $value->tennhacungcap }} không?')"><i class="fa-light fa-trash-alt text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection