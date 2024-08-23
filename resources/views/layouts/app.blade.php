<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="{{ asset('vendor/font-awesome/css/all.min.css') }}" />
    <!-- CSS Giao Dien -->
    <link href="{{ asset('vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">


<body>



    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center">

        <div class="d-flex align-items-center justify-content-between">
            <a href="{{ route('admin.home') }}" class="logo d-flex align-items-center">
                <!-- <img src="assets/img/logo.png" alt=""> -->
                <span class="d-none d-lg-block">PharmacyShop_Admin</span>
            </a>
            <i class="bi bi-list toggle-sidebar-btn"></i>
        </div><!-- End Logo -->

        <!-- <div class="search-bar">
            <form class="search-form d-flex align-items-center" method="POST" action="#">
                <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                <button type="submit" title="Search"><i class="bi bi-search"></i></button>
            </form>
        </div><!-- End Search Bar -->

        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">

                <!-- <li class="nav-item d-block d-lg-none">
                    <a class="nav-link nav-icon search-bar-toggle " href="#">
                        <i class="bi bi-search"></i>
                    </a>
                </li><!-- End Search Icon-->
                @guest
                @if (Route::has('login'))
                <li class="nav-item dropdown pe-3">
                    <a class="nav-link" href="{{ route('login') }}"><i class="fa-light fa-fw fa-sign-in-alt"></i> Đăng nhập</a>
                </li>

                @endif
                @if (Route::has('register'))
                <li class="nav-item dropdown pe-3">
                    <a class="nav-link" href="{{ route('register') }}"><i class="fa-light fa-user-plus"></i> Đăng ký</a>
                </li>

                @endif
                @else
                <li class="nav-item dropdown pe-3">
                    <a class="nav-link dropdown-toggle" href="#nguoidung" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-light fa-user-circle"></i> {{ Auth::user()->name }}
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                            <i class="fa-light fa-fw fa-sign-out-alt"></i> Đăng xuất
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="post" class="d-none">
                            @csrf
                        </form>
                    </div>
                </li>
                @endguest
                <!-- End Profile Nav -->

            </ul>
        </nav><!-- End Icons Navigation -->

    </header><!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">

        <ul class="sidebar-nav" id="sidebar-nav">

            <li class="nav-heading">FrontEnd</li>
            <li class="nav-item">
                <a class="nav-link " href="{{ route('frontend.home') }}">
                    <i class="bi bi-grid"></i>
                    <span> Trang bán hàng</span>
                </a>
            </li><!-- End Dashboard Nav -->

            <li class="nav-heading">Quản Lý</li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#danhmuc-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Danh Mục</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="danhmuc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.danhmuc') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.danhmuc.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#nhomthuoc-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Nhóm Thuốc</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="nhomthuoc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.nhomthuoc') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.nhomthuoc.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#hangsanxuat-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Hãng Sản Xuất</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="hangsanxuat-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.hangsanxuat') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.hangsanxuat.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#quocgia-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Quốc Gia</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="quocgia-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.quocgia') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.quocgia.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#thuoc-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Kho Dược</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="thuoc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.thuoc') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.thuoc.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#binhluan-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Bình Luận</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="binhluan-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.binhluanthuoc') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#nhacungcap-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Nhà Cung Cấp</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="nhacungcap-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.nhacungcap') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.nhacungcap.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm Mới</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#nhaphang-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Nhập Hàng</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="nhaphang-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.nhaphang') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.nhaphang.them') }}">
                            <i class="bi bi-circle"></i><span>Nhập Hàng</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#user-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Người Dùng</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="user-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.nguoidung') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.nguoidung.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm mới</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#tinhtrang-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Tình Trạng</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="tinhtrang-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.tinhtrang') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('admin.tinhtrang.them') }}">
                            <i class="bi bi-circle"></i><span>Thêm mới</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#donhang-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Quản Lý Đơn Hàng</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="donhang-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="{{ route('admin.donhang') }}">
                            <i class="bi bi-circle"></i><span>Danh Sách</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="{{ route('admin.lienhe') }}">
                    <i class="bi bi-grid"></i>
                    <span> Quản Lý Liên Hệ</span>
                </a>
            </li>
        </ul>

    </aside><!-- End Sidebar-->

    <main id="main" class="main">
        <section class="section dashboard">
            @yield('content')
        </section>
    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        Bản quyền &copy; {{ date('Y') }} bởi {{ config('app.name', 'Laravel') }}.
        <!-- Lấy bên giao diện để thay đổi  -->
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Scripts Giao Dien -->
    <script src="{{ asset('js/main.js') }}"></script>
    @yield('javascript')
</body>

</html>