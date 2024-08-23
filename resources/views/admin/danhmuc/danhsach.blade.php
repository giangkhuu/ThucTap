@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Danh mục</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Danh mục</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <div class="card-body table-responsive">
        <br>
        <table class="table table-bordered table-hover table-sm mb-0">
            <thead>
                <tr>
                    <th width="5%">#</th>
                    <th width="20%">Tên danh mục</th>
                    <th width="20%">Tên danh mục không dấu</th>
                    <th width="30%">Mô tả danh mục thuốc</th>
                    <th width="15%">Hình ảnh</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($danhmuc as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->tendanhmuc }}</td>
                    <td>{{ $value->tendanhmuc_slug }}</td>
                    <td>{{ $value->motadanhmuc }}</td>
                    <td class="text-center"><img src="{{ env('APP_URL') . '/storage/app/' . $value->hinhanh }}" width="80" class="img-thumbnail" /></td>
                    <td class="text-center"><a href="{{ route('admin.danhmuc.sua', ['id' => $value->id]) }}"><i class="fa-light fa-edit"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.danhmuc.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa danh mục {{ $value->tendanhmuc }} không?')"><i class="fa-light fa-trash-alt text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection