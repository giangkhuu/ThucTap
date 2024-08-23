@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Danh sách thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item active">Danh sách thuốc</li>
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
                    <th width="10%">Số lượng bình luận</th>
                    <th width="5%">Xem</th>
                </tr>
            </thead>
            <tbody>
                @foreach($thuoc as $value)
                <tr>
                    <td>{{ $loop->index + $thuoc-> firstItem() }}</td>
                    <td>{{ $value->tenthuoc }}</td>           
                    <td>{{ $value->BinhLuanThuoc->count() }}</td>
                    <td class="text-center"><a href="{{ route('admin.binhluanthuoc.xem', ['id' => $value->id]) }}"><i class="bi bi-eye"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
        {{ $thuoc->links() }}
    </div>
</div>
@endsection