@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Thuốc</li>
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
                    <th width="10%">Danh mục</th>
                    <th width="10%">Nhóm thuốc</th>
                    <th width="30%">Công dụng</th>
                    <th width="5%">Số lượng</th>
                    <th width="10%">Hình ảnh</th>
                    <th width="5%">Sửa</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach($thuoc as $value)
                <tr>
                    <td>{{ $loop->index + $thuoc-> firstItem() }}</td>
                    <td>{{ $value->tenthuoc }}</td>
                    <td>{{ $value->DanhMuc->tendanhmuc }}</td>
                    <td>{{ $value->NhomThuoc->tennhomthuoc }}</td>
                    <td>{{ $value->congdung }}</td>
                    <td>{{ $value->soluong }}</td>
                    <td class="text-center"><img src="{{ env('APP_URL') . '/storage/app/' . $value->hinhanh }}" width="80" class="img-thumbnail" /></td>
                    <td class="text-center"><a href="{{ route('admin.thuoc.sua', ['id' => $value->id]) }}"><i class="fa-light fa-edit"></i></a></td>
                    <td class="text-center"><a href="{{ route('admin.thuoc.xoa', ['id' => $value->id]) }}" onclick="return confirm('Bạn có muốn xóa thuốc {{ $value->tenbietduoc }} không?')"><i class="fa-light fa-trash-alt text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
        {{ $thuoc->links() }}
    </div>
</div>
@endsection