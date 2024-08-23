@extends('layouts.frontend')
@section('title', 'Sản phẩm')
@section('content')
<div class="bg-dark pt-4">
    <div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
        <div class="d-lg-flex justify-content-between pb-3">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item">
                            <a class="text-nowrap" href="{{ route('frontend.home') }}"><i class="ci-home"></i>Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page">Tìm kiếm</li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                <h1 class="h3 text-light mb-0">Tìm kiếm</h1>
            </div>
        </div>
    </div>
</div>
<div class="container pb-5 mb-2 mb-md-4">
    <div class="row pt-3 mx-n2">
        @foreach($timkiem as $timkiem)
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">
            <div class="card product-card">
                <a class="card-img-top d-block overflow-hidden" href="{{ route('frontend.sanpham.chitiet', ['tendanhmuc_slug' => $timkiem->DanhMuc->tendanhmuc_slug, 'tenbietduoc_slug' => $timkiem->tenbietduoc_slug . '-' . $timkiem->id . '.html']) }}">
                    <img src="{{ env('APP_URL') . '/storage/app/' . $timkiem->hinhanh }}" />
                </a>
                <div class="card-body py-2 text-center">
                    <a class="product-meta d-block fs-xs pb-1" href="#">{{ $timkiem->DanhMuc->tendanhmuc }}</a>
                    <h3 class="product-title fs-sm">
                        <a href="{{ route('frontend.sanpham.chitiet', ['tendanhmuc_slug' => $timkiem->DanhMuc->tendanhmuc_slug, 'tenbietduoc_slug' => $timkiem->tenbietduoc_slug . '-' . $timkiem->id . '.html']) }}">{{ $timkiem->tenthuoc }}</a>
                    </h3>
                    <div class="d-flex justify-content-center">
                        <div class="product-price text-center">
                            <span class="text-accent">{{ number_format($timkiem->dongiaban, 0, ',', '.') }}<small> đ</small>/{{ $timkiem->donvitinh }}</span>
                        </div>
                    </div>
                </div>
                <div class="card-body card-body-hidden">
                    @guest
                    <a class="btn btn-primary btn-sm d-block w-100 mb-2" href="{{ route('user.dangnhap') }}">
                        <i class="ci-cart fs-sm me-1"></i>Thêm vào giỏ hàng
                    </a>
                    @else
                    <a class="btn btn-primary btn-sm d-block w-100 mb-2" href="{{ route('user.giohang.them', ['id' => $timkiem->id]) }}">
                        <i class="ci-cart fs-sm me-1"></i>Thêm vào giỏ hàng
                    </a>
                    @endguest
                </div>
            </div>
            <hr class="d-sm-none">
        </div>
        @endforeach
    </div>
</div>
@endsection