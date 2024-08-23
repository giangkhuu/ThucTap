@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Hãng sản xuất</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Hãng sản xuất</li>
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
                    <th width="20%">Tên hãng</th>
                    <th width="20%">Tên hãng không dấu</th>
                    <th width="30%">Mô tả hãng</th>
                    <th width="15%">Hình ảnh</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($hangsanxuat as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->tenhang }}</td>
                    <td>{{ $value->tenhang_slug }}</td>
                    <td>{{ $value->motahang }}</td>
                    <td class="text-center"><img src="{{ env('APP_URL') . '/storage/app/' . $value->hinhanh }}" width="80" class="img-thumbnail" /></td>
                    <td class="text-center"><a href="{{ route('admin.hangsanxuat.sua', ['id' => $value->id]) }}"><i class="fa-light fa-edit"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.hangsanxuat.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa hãng sản xuất {{ $value->tenhang }} không?')"><i class="fa-light fa-trash-alt text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection