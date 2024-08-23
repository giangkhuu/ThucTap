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

<br>
<form action="{{ route('admin.nhaphang.themthuoc') }}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="row g-3 bg-white">
        <div class="col-md-6">
            <label class="form-label" for="thuoc_id">Tên thuốc</label>
            <select class="form-select @error('thuoc_id') is-invalid @enderror" id="thuoc_id" name="thuoc_id" required>
                <option value="">-- Chọn thuốc --</option>@foreach($thuoc as $value)
                <option value="{{ $value->id }}">{{ $value->tenthuoc }}</option>
                @endforeach
            </select>
            @error('thuoc_id')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="col-md-6">
            <label for="solo" class="form-label"> Số lô hàng</label>
            <input type="text" class="form-control @error('solo') is-invalid @enderror" id="solo" name="solo" value="{{ old('solo') }}" required />
            @error('solo')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="col-md-6">
            <label class="form-label" for="ngaysanxuat"> Ngày sản xuất</label>
            <input type="date" class="form-control @error('ngaysanxuat') is-invalid @enderror" id="ngaysanxuat" name="ngaysanxuat" value="{{ old('ngaysanxuat') }}" required />
            @error('ngaysanxuat')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="col-md-6">
            <label for="hansudung" class="form-label"> Hạn sản xuất</label>
            <input type="date" class="form-control @error('hansudung') is-invalid @enderror" id="hansudung" name="hansudung" value="{{ old('hansudung') }}" required />
            @error('hansudung')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="col-md-6">
            <label class="form-label" for="dongianhap"> Đơn giá nhập</label>
            <input type="number" class="form-control @error('dongianhap') is-invalid @enderror" id="dongianhap" name="dongianhap" value="{{ old('dongianhap') }}" required />
            @error('ngaynhap')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="col-md-6">
            <label for="soluong" class="form-label"> Số lượng</label>
            <input type="number" class="form-control @error('soluong') is-invalid @enderror" id="soluong" name="soluong" value="{{ old('soluong') }}" required />
            @error('soluong')
            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
            @enderror
        </div>
        <div class="col-md-3">

        </div>
        <div class="col-md-3">

        </div>
        <div class="col-md-3">

        </div>
        <div class="col-md-3">
            <button type="submit" class="btn btn-primary"><i class="fa-light fa-save"></i> Tạo thuốc nhập hàng</button>
        </div>

        <div class="col-md-12">
            <br>
        </div>
    </div>
</form>
<br>
<div class="row bg-white">
    <div class="mb-3"></div>
    <div class="mb-3">Danh sách thuốc chuẩn bị nhập</div>

    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover table-sm mb-0">
            <thead>
                <tr>
                    <th width="5%">#</th>
                    <th width="20%">Tên thuốc</th>
                    <th width="10%">Số lô hàng</th>
                    <th width="10%">Ngày sản xuất</th>
                    <th width="10%">Hạn sản xuất</th>
                    <th width="10%">Đơn giá nhập</th>
                    <th width="10%">Số lượng</th>
                    <th width="10%">Thành tiền</th>
                    <th width="5%">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @foreach(Cart::content() as $value)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $value->name }}</td>
                    <td>{{ $value->options->solo }}</td>
                    <td>{{ \Carbon\Carbon::parse($value->options->nsx)->format('d-m-Y') }}</td>
                    <td>{{ \Carbon\Carbon::parse($value->options->hsd)->format('d-m-Y') }}</td>
                    <td>{{ number_format($value->price, 0, ',', '.') }}</td>
                    <td>{{ $value->qty }}</td>
                    <td>{{ number_format($value->price * $value->qty, 0, ',', '.') }}</td>
                    <td class="text-center"><a href="{{ route('admin.nhaphang.xoathuoc', ['row_id' => $value->rowId]) }}" "><i class=" fa-light fa-trash-alt text-danger"></i></a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Tạo đơn
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form action="{{ route('admin.nhaphang.them') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row g-3 bg-white">
                        <div class="mb-3"> Nhập thông tin nhập hàng</div>
                        <div class="col-md-12">
                            <label class="form-label" for="nhacungcap_id">Nhà cung cấp</label>
                            <select class="form-select @error('nhacungcap_id') is-invalid @enderror" id="nhacungcap_id" name="nhacungcap_id">
                                <option value="">-- Chọn nhà cung cấp --</option>@foreach($nhacungcap as $value)
                                <option value="{{ $value->id }}">{{ $value->tennhacungcap }}</option>
                                @endforeach
                            </select>
                            @error('nhacungcap_id')
                            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                            @enderror
                        </div>
                        <div class="col-12">
                            <br>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary"><i class="fa-light fa-save"></i> Tạo hóa đơn nhập</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection