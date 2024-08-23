@extends('layouts.frontend')
@section('title', 'Giỏ Hàng')
@section('content')
<div class="page-title-overlap bg-dark pt-4">
    <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
        <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                    <li class="breadcrumb-item">
                        <a class="text-nowrap" href="#"><i class="ci-home"></i>Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap">
                        <a href="#">Thuốc</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Giỏ hàng</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">Giỏ hàng</h1>
        </div>
    </div>
</div>
<div class="container pb-5 mb-2 mb-md-4">
    <div class="row">
        <section class="col-lg-8">
            <div class="d-flex justify-content-between align-items-center pt-3 pb-4 pb-sm-5 mt-1">
                <h2 class="h6 text-light mb-0">Thuốc trong giỏ</h2>
                <a class="btn btn-outline-primary btn-sm ps-2" href="#">
                    <i class="ci-arrow-left me-2"></i>Tiếp tục mua hàng
                </a>
            </div>
            @foreach($giohang as $value)
            <div class="d-sm-flex justify-content-between align-items-center py-3 border-bottom">
                <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                    <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="#">
                        <img src="{{ env('APP_URL') . '/storage/app/' . $value->thuoc->hinhanh }}" width="160" />
                    </a>
                    <div class="pt-2">
                        <h3 class="product-title fs-base mb-2">{{ $value->thuoc->tenthuoc}}</h3>
                        <div class="fs-lg text-accent pt-2">{{ number_format($value->dongiaban, 0, ',', '.') }}<small> đ</small></div>
                    </div>
                </div>
                <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width:12rem;">

                    <label class="form-label" for="quantity">Số lượng</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <a href="{{ route('user.giohang.giam', ['id' => $value->id]) }}"><i class="ci-arrow-left-circle"></i></a>
                        </span>

                        <input class="form-control text-center" type="text" id="qty" name="qty[{{ $value->id }}]" min="1" value="{{ $value->soluong }}" />

                        <span class="input-group-text">
                            <a href="{{ route('user.giohang.tang', ['id' => $value->id]) }}"><i class="ci-arrow-right-circle"></i></a>
                        </span>
                    </div>
                    <a class="btn btn-link px-0 text-danger" href="{{ route('user.giohang.xoa', ['id' => $value->id]) }}">
                        <i class="ci-close-circle me-2"></i><span class="fs-sm">Xóa</span>
                    </a>
                </div>
            </div>
            @endforeach
        </section>

        <aside class="col-lg-4 pt-4 pt-lg-0 ps-xl-5">
            <div class="bg-white rounded-3 shadow-lg p-4">
                <div class="py-2 px-xl-2">
                    <div class="text-center mb-4 pb-3 border-bottom">
                        <h2 class="h6 mb-3 pb-1">Tổng tiền</h2>
                        <h3 class="fw-normal">
                        {{ number_format($tongtien, 0, ',', '.') }}
                            <small>đ</small>
                        </h3>
                    </div>
                    <a class="btn btn-primary btn-shadow d-block w-100 mt-4" href="{{ route('user.dathang') }}">
                        <i class="ci-card fs-lg me-2"></i>Đặt hàng
                    </a>
                </div>
            </div>
        </aside>
    </div>
</div>
@endsection