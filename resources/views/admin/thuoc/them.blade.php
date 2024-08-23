@extends('layouts.app')
@section('content')

<div class="pagetitle">
    <h1>Thêm thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.thuoc') }}">Thuốc</a></li>
            <li class="breadcrumb-item active">Thêm thuốc</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.thuoc.them') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="row g-3 bg-white">
                <div class="mb-3">Nhập thông tin thuốc</div>
                <div class="col-md-4">
                    <label class="form-label" for="sodangky"> Số đăng kí</label>
                    <input type="text" class="form-control @error('sodangky') is-invalid @enderror" id="sodangky" name="sodangky" value="{{ old('sodangky') }}" required />
                    @error('sodangky')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label for="tenthuoc" class="form-label"> Tên thuốc</label>
                    <input type="text" class="form-control @error('tenthuoc') is-invalid @enderror" id="tenthuoc" name="tenthuoc" value="{{ old('tenthuoc') }}" required />
                    @error('tenthuoc')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="tenbietduoc"> Tên biệt dược</label>
                    <input type="text" class="form-control @error('tenbietduoc') is-invalid @enderror" id="tenbietduoc" name="tenbietduoc" value="{{ old('tenbietduoc') }}" required />
                    @error('tenbietduoc')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="hoatchat"> Hoạt chất</label>
                    <input type="text" class="form-control @error('hoatchat') is-invalid @enderror" id="hoatchat" name="hoatchat" value="{{ old('hoatchat') }}" required />
                    @error('hoatchat')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="dongiaban"> Đơn giá</label>
                    <input type="number" class="form-control @error('dongiaban') is-invalid @enderror" id="dongiaban" name="dongiaban" value="{{ old('dongiaban') }}" required />
                    @error('dongiaban')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="donggoi"> Quy cách đóng gói</label>
                    <input type="text" class="form-control @error('donggoi') is-invalid @enderror" id="donggoi" name="donggoi" value="{{ old('donggoi') }}" required />
                    @error('donggoi')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-12">
                    <br>
                </div>
            </div>
            <br>
            <div class="row g-3 bg-white">
                <div class="mb-3">Chọn thông tin thuốc</div>
                <div class="col-md-4">
                    <label class="form-label" for="donvitinh">Đơn vị tính</label>
                    <select class="form-select @error('donvitinh') is-invalid @enderror" id="donvitinh" name="donvitinh" required>
                        <option value="">-- Chọn đơn vị tính --</option>
                        <option value="Viên"> Viên</option>
                        <option value="Chai"> Chai</option>
                        <option value="Tuýp"> Tuýp</option>
                        <option value="Hộp"> Hộp</option>
                        <option value="Gói"> Gói</option>
                        <option value="Lọ"> Lọ</option>
                        <option value="Khác"> Khác</option>
                    </select>
                    @error('donvitinh')
                    <div class="invaxlid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="thuockedon">Thuốc kê đơn</label>
                    <select class="form-select @error('thuockedon') is-invalid @enderror" id="thuockedon" name="thuockedon" required>
                        <option value="">-- Chọn thuốc kê đơn --</option>
                        <option value="1"> Có</option>
                        <option value="0"> Không</option>
                    </select>
                    @error('thuockedon')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="thang">Số tháng hết hạng</label>
                    <select class="form-select @error('thang') is-invalid @enderror" id="thang" name="thang" required>
                        <option value="">-- Chọn số tháng --</option>
                        <option value="1"> 1 Tháng</option>
                        <option value="2"> 2 Tháng</option>
                        <option value="3"> 3 Tháng</option>
                        <option value="4"> 4 Tháng</option>
                        <option value="5"> 5 Tháng</option>
                        <option value="6"> 6 Tháng</option>
                        <option value="12"> 12 Tháng(1 năm)</option>
                        <option value="24"> 24 Tháng(2 năm)</option>
                        <option value="36"> 36 Tháng(3 năm)</option>
                        <option value="48"> 48 Tháng(4 năm)</option>
                        <option value="60"> 60 Tháng(5 năm)</option>
                        <option value="72"> 72 Tháng(6 năm)</option>
                    </select>
                    @error('thang')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="danhmuc_id">Danh mục</label>
                    <select class="form-select @error('danhmuc_id') is-invalid @enderror" id="danhmuc_id" name="danhmuc_id" required>
                        <option value="">-- Chọn danh mục --</option>@foreach($danhmuc as $value)
                        <option value="{{ $value->id }}">{{ $value->tendanhmuc }}</option>
                        @endforeach
                    </select>
                    @error('danhmuc_id')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="nhomthuoc_id">Nhóm thuốc</label>
                    <select class="form-select @error('nhomthuoc_id') is-invalid @enderror" id="nhomthuoc_id" name="nhomthuoc_id" required>
                        <option value="">-- Chọn nhóm thuốc --</option>@foreach($nhomthuoc as $value)
                        <option value="{{ $value->id }}">{{ $value->tennhomthuoc }}</option>
                        @endforeach
                    </select>
                    @error('nhomthuoc_id')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="hangsanxuat_id">Hãng sản xuất</label>
                    <select class="form-select @error('hangsanxuat_id') is-invalid @enderror" id="hangsanxuat_id" name="hangsanxuat_id" required>
                        <option value="">-- Chọn hãng sản xuất --</option>@foreach($hangsanxuat as $value)
                        <option value="{{ $value->id }}">{{ $value->tenhang }}</option>
                        @endforeach
                    </select>
                    @error('hangsanxuat_id')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="quocgia_id">Quốc gia</label>
                    <select class="form-select @error('quocgia_id') is-invalid @enderror" id="quocgia_id" name="quocgia_id" required>
                        <option value="">-- Chọn quốc gia --</option>@foreach($quocgia as $value)
                        <option value="{{ $value->id }}">{{ $value->tenquocgia }}</option>
                        @endforeach
                    </select>
                    @error('quocgia_id')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-12">
                    <br>
                </div>
            </div>
            <br>
            <div class="row bg-white">
                <div class="mb-3"></div>
                <div class="mb-3">Nhập thông tin mô tả thuốcc</div>

                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label" for="congdung">Công dụng</label>
                        <input type="text" class="form-control @error('congdung') is-invalid @enderror" id="congdung" name="congdung" value="{{ old('congdung') }}" required />
                        @error('congdung')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="hinhanh">Hình ảnh chính thuốc</label>
                        <input type="file" class="form-control" id="hinhanh" name="hinhanh" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="hinhanhmota">Hình ảnh mô tả sản phẩm</label>
                        <input type="file" class="form-control @error('hinhanhmota') is-invalid @enderror" id="hinhanhmota" name="hinhanhmota[]" value="{{ old('hinhanhmota') }}" multiple />
                        @error('hinhanhmota')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="motathuoc">Mô tả thuốc</label>
                        <textarea class="form-control" id="motathuoc" name="motathuoc">{{ old('motathuoc') }}</textarea>
                    </div>

                </div>
            </div>
            <button type="submit" class="btn btn-primary"><i class="fa-light fa-save"></i> Thêm vào CSDL</button>
        </form>
    </div>
</div>
@endsection
@section('javascript')
<script src="{{ asset('vendor/ckeditor5/ckeditor.js') }}"></script>

<script>
    ClassicEditor.create(document.querySelector('#motathuoc'), {
        licenseKey: '',
    }).then(editor => {
        window.editor = editor;
    }).catch(error => {
        console.error(error);
    });
</script>
@endsection