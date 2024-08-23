@extends('layouts.frontend')
@section('title', 'Đơn hàng')
@section('content')
<div class="page-title-overlap bg-dark pt-4">
    <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
        <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                    <li class="breadcrumb-item">
                        <a class="text-nowrap" href="{{ route('frontend.home') }}"><i class="ci-home"></i>Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap">
                        <a href="{{ route('user.home') }}">Khách hàng</a>
                    </li>
                    <li class="breadcrumb-item text-nowrap active" aria-current="page">Lịch sử mua hàng</li>
                </ol>
            </nav>
        </div>
        <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">Đơn hàng của tôi</h1>
        </div>
    </div>
</div>

<div class="container pb-5 mb-2 mb-md-4">
    <div class="row">
        <aside class="col-lg-4 pt-4 pt-lg-0 pe-xl-5">
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
                <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                    <div class="d-md-flex align-items-center">
                        <div class="img-thumbnail rounded-circle position-relative flex-shrink-0 mx-auto mb-2 mx-md-0 mb-md-0" style="width:6.375rem;">
                            @if(empty($nguoidung->hinhanh))
                            <img class="rounded-circle" src="{{ asset('img/avatar.jpg') }}" width="90" />
                            @else
                            <img class="rounded-circle" src="{{ env('APP_URL') . '/storage/app/' . $nguoidung->hinhanh }}" width="90" />
                            @endif
                        </div>
                        <div class="ps-md-3">
                            <h3 class="fs-base mb-0">{{ $nguoidung->name }}</h3>
                            <span class="text-accent fs-sm">{{ $nguoidung->email }}</span>
                        </div>
                    </div>
                    <a class="btn btn-primary d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="ci-menu me-2"></i>Hồ sơ khách hàng
                    </a>
                </div>
                <div class="d-lg-block collapse" id="account-menu">
                    <div class="bg-secondary px-4 py-3">
                        <h3 class="fs-sm mb-0 text-muted">Quản lý</h3>
                    </div>
                    <ul class="list-unstyled mb-0">
                        @if($nguoidung->DonHang->count() > 0)
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3 active" href="{{ route('user.donhang') }}"><i class="ci-bag opacity-60 me-2"></i>Đơn hàng<span class="fs-sm text-muted ms-auto">{{ $nguoidung->DonHang->count() }}</span>
                            </a>
                        </li>
                        @else
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3 active" href="#">
                                <i class="ci-bag opacity-60 me-2"></i>Đơn hàng<span class="fs-sm text-muted ms-auto">0</span>
                            </a>
                        </li>
                        @endif
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" href="#">
                                <i class="ci-heart opacity-60 me-2"></i>Sản phẩm yêu thích<span class="fs-sm text-muted ms-auto">0</span>
                            </a>
                        </li>
                        <li class="mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" href="#">
                                <i class="ci-star opacity-60 me-2"></i>Đánh giá sản phẩm<span class="fs-sm text-muted ms-auto">0</span>
                            </a>
                        </li>
                    </ul>
                    <div class="bg-secondary px-4 py-3">
                        <h3 class="fs-sm mb-0 text-muted">Thiết lập tài khoản</h3>
                    </div>
                    <ul class="list-unstyled mb-0">
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" href="{{ route('user.hosocanhan') }}">
                                <i class="ci-user opacity-60 me-2"></i>Hồ sơ cá nhân
                            </a>
                        </li>
                        <li class="border-bottom mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" href="#">
                                <i class="ci-location opacity-60 me-2"></i>Sổ địa chỉ
                            </a>
                        </li>
                        <li class="mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" href="#">
                                <i class="ci-card opacity-60 me-2"></i>Phương thức thanh toán
                            </a>
                        </li>
                        <li class="d-lg-none border-top mb-0">
                            <a class="nav-link-style d-flex align-items-center px-4 py-3" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                <i class="ci-sign-out opacity-60 me-2"></i>Đăng xuất
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="post" class="d-none">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
        <section class="col-lg-8">
            <!-- <div class="d-flex justify-content-between align-items-center pt-lg-2 pb-4 pb-lg-5 mb-lg-3">
                <!-- <div class="d-flex align-items-center">
                    <label class="d-none d-lg-block fs-sm text-light text-nowrap opacity-75 me-2" for="order-sort">Sắp xếp theo:</label>
                    <label class="d-lg-none fs-sm text-nowrap opacity-75 me-2" for="order-sort">Sắp xếp theo:</label>
                    <select class="form-select" id="order-sort">
                        <option>Tất cả</option>
                        <option>Đã giao</option>
                        <option>Đang vận chuyển</option>
                        <option>Đã chuyển hoàn</option>
                        <option>Đã hủy</option>
                    </select>
                </div> -->
            <div class="d-none d-lg-flex justify-content-between align-items-center pt-lg-3 pb-4 pb-lg-5 mb-lg-3">
                <h6 class="fs-base text-light mb-0"></h6>
                <a class="btn btn-primary btn-sm" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="ci-sign-out me-2"></i>Đăng xuất
                </a>
            </div>
            <div class="table-responsive fs-md mb-4">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Ngày đặt hàng</th>
                            <th>Trạng thái</th>
                            <th>Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($donhang as $value)
                        <tr>
                            <td class="py-3"><a class="nav-link-style fw-medium fs-sm " href="#ChiTietDonHang_{{ $value->id }}" data-bs-toggle="modal">MHĐ0000{{ $value->id }}</a></td>
                            <td class="py-3">{{ \Carbon\Carbon::parse($value->created_at)->format('d-m-Y') }}</td>
                            <td class="py-3">
                                @if($value->tinhtrang_id == 1)
                                <span class="badge bg-info m-0">{{ $value->TinhTrang->tinhtrang }}</span>
                                @elseif($value->tinhtrang_id == 2)
                                <span class="badge bg-warning m-0">{{ $value->TinhTrang->tinhtrang }}</span>
                                @elseif($value->tinhtrang_id == 3)
                                <span class="badge bg-success m-0">{{ $value->TinhTrang->tinhtrang }}</span>
                                @endif
                            </td>
                            <td class="py-3 textl-center">
                                @php $tongtiendh = 0; @endphp
                                @foreach($value->DonHang_ChiTiet as $chitiet)
                                @php $tongtiendh += $chitiet->soluongban * $chitiet->dongiaban; @endphp
                                @endforeach

                                <strong>{{ number_format($tongtiendh, 0, ',', '.') }} </strong><small>đ</small>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $donhang->links() }}
            </div>
        </section>
    </div>
</div>
@foreach($donhang as $value)
<div class="modal fade" id="ChiTietDonHang_{{ $value->id }}">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chi tiết đơn hàng - MHĐ0000{{ $value->id }}</h5>
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pb-0">
                @foreach($value->DonHang_ChiTiet as $chitiet)
                <div class="d-sm-flex justify-content-between mb-3 pb-3 pb-sm-2 border-bottom">
                    <div class="d-sm-flex text-center text-sm-start">
                        <a class="d-inline-block flex-shrink-0 mx-auto" href="#" style="width:10rem;">
                            <img src="{{ env('APP_URL') . '/storage/app/' . $chitiet->thuoc->hinhanh }}" alt="Product">
                        </a>
                        <div class="ps-sm-4 pt-2">
                            <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">{{ $chitiet->Thuoc->tenthuoc }}</a></h3>
                            <div class="fs-lg text-accent pt-2"><strong>{{ number_format($chitiet->dongiaban, 0, ',', '.') }}</strong><small>đ</small></div>
                        </div>
                    </div>
                    <div class="pt-2 ps-sm-3 mx-auto mx-sm-0 text-center">
                        <div class="text-muted mb-2">Số lượng</div>
                        <span>{{ $chitiet->soluongban }}</span>
                    </div>
                    <div class="pt-2 ps-sm-3 mx-auto mx-sm-0 text-center">
                        <div class="text-muted mb-2">Thành tiền</div>
                        <strong>{{ number_format($chitiet->dongiaban * $chitiet->soluongban, 0, ',', '.') }}</strong><small>đ</small>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="modal-footer flex-wrap bg-secondary fs-md">
                <div class="py-1 text-end">
                    <span class="text-muted">Tổng tiền sản phẩm:</span>
                    @php $tongtiendh = 0; @endphp
                    @foreach($value->DonHang_ChiTiet as $chitiet)
                    @php $tongtiendh += $chitiet->soluongban * $chitiet->dongiaban; @endphp
                    @endforeach


                    <span class="fs-lg"><strong>{{ number_format($tongtiendh, 0, ',', '.') }} </strong><small>đ</small></span>
                </div>
            </div>
        </div>
    </div>
</div>
@endforeach
@endsection