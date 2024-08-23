@extends('layouts.frontend')
@section('title', 'Trang chủ')
@section('content')
<section class="container mt-4 mb-grid-gutter">
    <div class="bg-faded-info rounded-3 py-4">
        <div class="row align-items-center">
            <div class="col-md-5">
                <div class="px-4 pe-sm-0 ps-sm-5">
                    <span class="badge bg-danger">Khuyến mãi đặc biệt</span>
                    <h3 class="mt-4 mb-1 text-body fw-light">Sản phẩm mới 100%</h3>
                    <h2 class="mb-1"></h2> Bản Mới</h2>
                    <p class="h5 text-body fw-light">Số lượng sản phẩm có hạn!</p>
                    <!-- <a class="btn btn-accent" href="#">Xem chi tiết<i class="ci-arrow-right fs-ms ms-1"></i></a> -->
                </div>
            </div>
            <div class="col-md-7"><img src="{{ asset('img/johnson-baby-125ml-1.png') }}" /></div>
        </div>
    </div>
</section>
<!-- <section class="container">
    <div class="tns-carousel border-end">
        <div class="tns-carousel-inner" data-carousel-options="{ &quot;nav&quot;: false, &quot;controls&quot;: false, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 4000, &quot;loop&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;360&quot;:{&quot;items&quot;:2},&quot;600&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;"><img class="d-block mx-auto" src="{{ asset('img/brands/13.png') }}" style="width:165px;" />
                </a>
            </div>
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/14.png') }}" style="width:165px;" />
                </a>
            </div>
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/17.png') }}" style="width:165px;" />
                </a>
            </div>
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/16.png') }}" style="width:165px;" />
                </a>
            </div>
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/15.png') }}" style="width:165px;" />
                </a>
            </div>
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/18.png') }}" style="width:165px;" />
                </a>
            </div>
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/19.png') }}" style="width:165px;" />
                </a>
            </div> 
            <div>
                <a class="d-block bg-white border py-4 py-sm-5 px-2" href="#" style="margin-right:-.0625rem;">
                    <img class="d-block mx-auto" src="{{ asset('img/brands/20.png') }}" style="width:165px;" />
                </a>
            </div>
        </div>
    </div>
</section> -->
@foreach($danhmuc as $danhmuc)
<section class="container pt-3 pb-5">
    <div class="d-flex flex-wrap justify-content-between align-items-center pt-1 border-bottom pb-4 mb-4">
        <h2 class="h3 mb-0 pt-3 me-2">{{ $danhmuc->tendanhmuc }}</h2>
        <div class="pt-3">
            <a class="btn btn-outline-accent btn-sm" href="{{ route('frontend.sanpham.phandanhmuc', ['tendanhmuc_slug' => $danhmuc->tendanhmuc_slug]) }}">
                Xem tất cả<i class="ci-arrow-right ms-1 me-n1"></i>
            </a>
        </div>
    </div>
    <div class="row pt-2 mx-n2">
        @php
        $thuoctheodm = $danhmuc->Thuoc->sortByDesc('created_at')->take(4);
        @endphp
        @foreach($thuoctheodm as $thuoc)
        <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-4">

            <div class="card product-card">
                <a class="card-img-top d-block overflow-hidden" href="{{ route('frontend.sanpham.chitiet', ['tendanhmuc_slug' => $danhmuc->tendanhmuc_slug, 'tenbietduoc_slug' => $thuoc->tenbietduoc_slug . '-' . $thuoc->id . '.html']) }}">
                    <img src="{{ env('APP_URL') . '/storage/app/' . $thuoc->hinhanh }}" /></a>
                <div class="card-body py-2">
                    <a class="product-meta d-block fs-xs pb-1" href="{{ route('frontend.sanpham.phandanhmuc', ['tendanhmuc_slug' => $danhmuc->tendanhmuc_slug]) }}">{{ $danhmuc->tendanhmuc }}</a>
                    <h3 class="product-title fs-sm">
                        <a href="{{ route('frontend.sanpham.chitiet', ['tendanhmuc_slug' => $danhmuc->tendanhmuc_slug, 'tenbietduoc_slug' => $thuoc->tenbietduoc_slug . '-' . $thuoc->id . '.html']) }}">{{ $thuoc->tenthuoc }}</a>
                    </h3>
                    <div class="d-flex justify-content-between">
                        <div class="product-price">
                            <span class="text-accent">{{ number_format($thuoc->dongiaban, 0, ',', '.') }}<small>đ</small></span>
                        </div>
                        <!-- <div class="star-rating">
                            <i class="star-rating-icon ci-star-filled active"></i>
                            <i class="star-rating-icon ci-star-filled active"></i>
                            <i class="star-rating-icon ci-star-filled active"></i>
                            <i class="star-rating-icon ci-star-filled active"></i>
                            <i class="star-rating-icon ci-star"></i>
                        </div> -->
                    </div>
                </div>
                <div class="card-body card-body-hidden">
                    @guest
                    <a class="btn btn-primary btn-sm d-block w-100 mb-2" href="{{ route('user.dangnhap') }}">
                        <i class="ci-cart fs-sm me-1"></i>Thêm vào giỏ hàng
                    </a>
                    @else
                    <a class="btn btn-primary btn-sm d-block w-100 mb-2" href="{{ route('user.giohang.them', ['id' => $thuoc->id]) }}">
                        <i class="ci-cart fs-sm me-1"></i>Thêm vào giỏ hàng
                    </a>
                    @endguest
                </div>
            </div>
            <hr class="d-sm-none">

        </div>
        @endforeach
    </div>
</section>
@endforeach
@endsection