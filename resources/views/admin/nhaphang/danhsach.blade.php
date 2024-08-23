@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Nhập hàng</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Nhập hàng</li>
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
                    <th width="20%">Mã nhập hàng</th>
                    <th width="20%">Người nhập hàng</th>
                    <th width="20%">Ngày nhập</th>
                    <!-- <th width="20%">Tổng tiền</th> -->
                    <!--                     <th width="5%">Sửa</th> -->
<!--                     <th width="5%">Xóa</th> -->
                </tr>
            </thead>
            <tbody>
                @foreach($nhaphang as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->NhaCungCap->tennhacungcap }}</td>
                    <td>{{ $value->manhap }}</td>
                    <td>{{ $value->nguoinhap }}</td>
                    <td>{{ \Carbon\Carbon::parse($value->ngaynhap)->format('d-m-Y') }}</td>
                    <!-- <td>{{ $value->tongtiennhap }}</td> -->
                    <!-- <td class="text-center"><a href="{{ route('admin.nhaphang.sua', ['id' => $value->id]) }}"><i class="fa-light fa-edit"></i></a></td> -->
                    <!-- <td class="text-center"><a href="{{ route('admin.nhaphang.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa hóa đơn {{ $value->mahoadon }} không?')"><i class="fa-light fa-trash-alt text-danger"></i></a></td> -->
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection