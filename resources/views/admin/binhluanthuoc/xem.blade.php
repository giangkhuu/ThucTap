@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Danh sách bình luận thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.binhluanthuoc') }}">Danh sách thuốc</a></li>
            <li class="breadcrumb-item active">Danh sách bình luận thuốc</li>
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
                    <th width="20%">Tên thuốc</th>
                    <th width="20%">Tên khách hàng</th>
                    <th width="30%">Nội dung bình luận</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($binhluanthuoc as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->Thuoc->tenthuoc }}</td>           
                    <td>{{ $value->NguoiDung->name }}</td>
                    <td>{{ $value->noidungbinhluan }}</td>
                    <td class="text-center"><a href="{{ route('admin.binhluanthuoc.sua', ['id' => $value->id]) }}"><i class="fa-light fa-edit"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.binhluanthuoc.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa bình luận này không?')"><i class="fa-light fa-trash-alt text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection