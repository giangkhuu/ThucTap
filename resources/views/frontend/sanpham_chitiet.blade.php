@extends('layouts.frontend')
@section('title', 'Thuốc')
@section('content')
<!-- Page Title-->
<div class="page-title-overlap bg-dark pt-4">
    <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
        <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                    <li class="breadcrumb-item">
                        <a class="text-nowrap" href="{{ route('frontend.home') }}"><i class="ci-home"></i>Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap">
                        <a href="{{ route('frontend.sanpham') }}">Sản phẩm</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Chi tiết</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">{{ $thuoc->tenthuoc }}</h1>
        </div>
    </div>
</div>
<div class="container">
    <div class="bg-light shadow-lg rounded-3 px-4 py-3 mb-5">
        <div class="px-lg-3">
            <div class="row">
                <div class="col-lg-7 pe-lg-0 pt-lg-4">
                    <div class="shop-details-images-wrap">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane show active" id="itemOne-tab-pane" role="tabpanel" aria-labelledby="itemOne-tab" tabindex="0">
                                <img id="big-img" src="{{ env('APP_URL') . '/storage/app/' . $thuoc->hinhanh }}" alt="{{$thuoc->tenbiecduoc}}" width="100%">
                            </div>
                        </div>
                        <div class="d-flex">
                            <ul class="nav nav-tabs">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link">
                                        <img class="thumb-image" src="{{ env('APP_URL') . '/storage/app/' . $thuoc->hinhanh }}" alt="" width="125px">
                                    </button>
                                </li>
                            </ul>
                            @foreach($thuoc->HinhAnh as $ha)
                            <ul class="nav nav-tabs">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link">
                                        <img class="thumb-image" src="{{ env('APP_URL') . '/storage/app/' . $ha->hinhanhmota }}" alt="" width="125px">
                                    </button>
                                </li>
                            </ul>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 pt-4 pt-lg-0">
                    <div class="product-details ms-auto pb-3">
                        <div class="mb-3">
                            <div class="row ">
                                <div class="col-md-3">

                                </div>
                                <div class="col-md-3">

                                </div>
                                <div class="col-md-3">

                                </div>
                                <div class="col-md-3 text-right">
                                    {{ $thuoc->sodangky }}
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <h3>{{ $thuoc->tenbietduoc }}</h3>
                        </div>
                        <div class="mb-3">
                            <h3>Giá bán: <span class="h3 fw-normal text-accent me-1">{{ number_format($thuoc->dongiaban, 0, ',', '.') }}<small>đ</small>/{{ $thuoc->donvitinh }}</span></h3>
                        </div>
                        <div class="accordion mb-4" id="productPanels">
                            <div class="accordion-item">
                                <h3 class="accordion-header">
                                    <a class="accordion-button" href="#productInfo" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="productInfo">
                                        <i class="ci-announcement text-muted fs-lg align-middle mt-n1 me-2"></i>Thông tin cơ bản
                                    </a>
                                </h3>
                                <div class="accordion-collapse collapse show" id="productInfo" data-bs-parent="#productPanels">
                                    <div class="accordion-body">
                                        <p>
                                        <h6 style="display: inline;">Hoạt chất:</h6> {{ $thuoc->hoatchat }}</p>
                                        <p>
                                        <h6 style="display: inline;">Kho:</h6> {{ $thuoc->soluong }}</p>
                                        <p>
                                        <h6 style="display: inline;">Quy cách đóng gói:</h6> {{ $thuoc->donvitinh }} {{ $thuoc->donggoi }}</p>
                                        <p>
                                        <h6 style="display: inline;">Công dụng:</h6> {{ $thuoc->congdung }}</p>
                                        <p>
                                        <h6 style="display: inline;">Số tháng hết hạn:</h6> {{ $thuoc->thang }} tháng</p>

                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h3 class="accordion-header">
                                    <a class="accordion-button collapsed" href="#shippingOptions" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="shippingOptions">
                                        <i class="ci-announcement text-muted lead align-middle mt-n1 me-2"></i>Thông tin liên quan
                                    </a>
                                </h3>
                                <div class="accordion-collapse collapse" id="shippingOptions" data-bs-parent="#productPanels">
                                    <div class="accordion-body">
                                        <p>
                                        <h6 style="display: inline;">Danh mục:</h6> {{ $thuoc->DanhMuc->tendanhmuc }}</p>
                                        <p>
                                        <h6 style="display: inline;">Nhóm Thuốc:</h6> {{ $thuoc->NhomThuoc->tennhomthuoc}} </p>
                                        <p>
                                        <h6 style="display: inline;">Thương hiệu</h6>:</h6> {{ $thuoc->HangSanXuat->tenhang}}</p>
                                        <p>
                                        <h6 style="display: inline;">Quốc gia:</h6> {{ $thuoc->QuocGia->tenquocgia}}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 d-flex align-items-center">
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
                </div>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-md-3">
        <div class="col-12 py-4">
            <h2 class="h3 mb-4 pb-2">Giới thiệu chi tiết thuốc</h2>
            <p class="text-muted pb-2" style="text-align:justify">{!! $thuoc->motathuoc !!}</p>
        </div>
    </div>

    <!-- Comments-->

    <div class="pt-2 mt-5" id="comments">
        <h2 class="h4">Bình luận<span class="badge bg-secondary fs-sm text-body align-middle ms-2">{{ $thuoc->BinhLuanThuoc->count() }}</span></h2>
        @foreach( $thuoc->BinhLuanThuoc as $value)
        <div class="d-flex align-items-start py-4">
            @if(empty($value->NguoiDung->hinhanh))
            <img class="rounded-circle" src="{{ asset('img/avatar.jpg') }}" width="50" />
            @else
            <img class="rounded-circle" src="{{ env('APP_URL') . '/storage/app/' . $value->NguoiDung->hinhanh }}" width="50" />
            @endif
            <div class="ps-3">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h6 class="fs-md mb-0">{{ $value->NguoiDung->name }} </h6>
                </div>

                <p class="fs-md mb-1" style="text-align:justify">{{ $value->noidungbinhluan }}</p>

                <span class="fs-ms text-muted"><i class="ci-time align-middle me-2"></i>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $value->created_at)->format('d/m/Y') }}</span>
            </div>
        </div>
        @endforeach

        <div class="card border-0 shadow mt-2 mb-4">

            <div class="card-body">
                <div class="d-flex align-items-start">
                    @if(empty($value->NguoiDung->hinhanh))
                    <img class="rounded-circle" src="{{ asset('img/avatar.jpg') }}" width="50" />
                    @else
                    <img class="rounded-circle" src="{{ env('APP_URL') . '/storage/app/' . $value->NguoiDung->hinhanh }}" width="50" />
                    @endif
                    @if(Auth::check())
                    @if(Auth::user()->role == 'admin')
                    <form class="w-100 needs-validation ms-3" action="{{ route('admin.binhluanthuoc.them') }}" method="POST" enctype="multipart/form-data" novalidate>
                        @else
                        <form class="w-100 needs-validation ms-3" action="{{ route('user.binhluanthuoc.them') }}" method="POST" enctype="multipart/form-data" novalidate>
                            @endif
                            @else
                            <form class="w-100 needs-validation ms-3" action="{{ route('user.dangnhap') }}" method="POST" enctype="multipart/form-data" novalidate>
                                @endif
                                @csrf
                                <div class="mb-3">
                                    <div class="form-group">
                                        <input type="text" hidden class="form-control" id="thuoc_id" name="thuoc_id" value="{{ $thuoc->id }}">
                                    </div>
                                    <div class="form-group">
                                        @if(Auth::check())
                                        <input type="text" hidden class="form-control" id="nguoidung_id" name="nguoidung_id" value="{{Auth::user()->id}}">
                                        @endif
                                    </div>
                                    <textarea class="form-control" rows="3" id="noidungbinhluan" name="noidungbinhluan" required></textarea>
                                    @guest
                                    <div class="invalid-feedback">Bạn phải đăng nhập để chia sẻ bình luận.</div>
                                    @else
                                    <div class="invalid-feedback">Nội dung bình luận không được bỏ trống.</div>
                                    @endguest
                                </div>
                                @if(Auth::check())
                                <button class="btn btn-primary btn-sm" type="submit">Đăng bình luận</button>
                                @else
                                <a class="btn btn-primary btn-sm" href="{{ route('user.dangnhap') }}">Đăng bình luận</a>
                                @endif

                            </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row align-items-center py-md-3">
        <div class="col-12 py-4">
            <h2 class="h3 mb-4 pb-2">Thuốc liên quan</h2>
            <div class="tns-carousel">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: false, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 20},&quot;900&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 30}}}">
                    @foreach($thuoccungdanhmuc as $tcdm)
                    <article>
                        <a class="blog-entry-thumb mb-3" href="{{ route('frontend.sanpham.chitiet', ['tendanhmuc_slug' => $danhmuc->tendanhmuc_slug, 'tenbietduoc_slug' => $tcdm->tenbietduoc_slug . '-' . $tcdm->id . '.html']) }}">
                            <img src="{{ env('APP_URL') . '/storage/app/' . $tcdm->hinhanh }}" />
                        </a>
                        <div class="d-flex align-items-center fs-sm mb-2">
                            <span class="text-accent"> {{ number_format($tcdm->dongiaban, 0, ',', '.') }}<small>đ</small></span>
                        </div>
                        <h3 class="h6 blog-entry-title">
                            <a href="{{ route('frontend.sanpham.chitiet', ['tendanhmuc_slug' => $danhmuc->tendanhmuc_slug, 'tenbietduoc_slug' => $tcdm->tenbietduoc_slug . '-' . $tcdm->id . '.html']) }}">
                                {{ $tcdm->tenthuoc }}
                            </a>
                        </h3>
                    </article>
                    @endforeach
                </div>
            </div>
        </div>
    </div>



</div>


@endsection
@section('javascript')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('.thumb-image').click(function(e) {
            e.preventDefault();
            var imgUrl = $(this).attr('src');
            console.log('Clicked image source:', imgUrl); // Kiểm tra xem imgUrl được lấy chính xác hay không
            $('#big-img').attr('src', imgUrl);
        });
    });
</script>
@endsection