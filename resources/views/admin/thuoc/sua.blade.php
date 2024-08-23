@extends('layouts.app')
@section('content')
<div class="pagetitle">
    <h1>Sửa thuốc</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('admin.thuoc') }}">Thuốc</a></li>
            <li class="breadcrumb-item active">Sửa thuốc</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="card">
    <br>
    <div class="card-body">
        <form action="{{ route('admin.thuoc.sua', ['id' => $thuoc->id]) }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="row g-3 bg-white">
                <div class="mb-3">Nhập thông tin thuốc</div>
                <div class="col-md-4">
                    <label class="form-label" for="sodangky"> Số đăng kí</label>
                    <input type="text" class="form-control @error('sodangky') is-invalid @enderror" id="sodangky" name="sodangky" value="{{ $thuoc->sodangky }}" required />
                    @error('sodangky')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label for="tenthuoc" class="form-label"> Tên thuốc</label>
                    <input type="text" class="form-control @error('tenthuoc') is-invalid @enderror" id="tenthuoc" name="tenthuoc" value="{{ $thuoc->tenthuoc }}" required />
                    @error('tenthuoc')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="tenbietduoc"> Tên biệt dược</label>
                    <input type="text" class="form-control @error('tenbietduoc') is-invalid @enderror" id="tenbietduoc" name="tenbietduoc" value="{{ $thuoc->tenbietduoc }}" required />
                    @error('tenbietduoc')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="hoatchat"> Hoạt chất</label>
                    <input type="text" class="form-control @error('hoatchat') is-invalid @enderror" id="hoatchat" name="hoatchat" value="{{ $thuoc->hoatchat }}" required />
                    @error('hoatchat')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="dongiaban"> Đơn giá</label>
                    <input type="number" class="form-control @error('dongiaban') is-invalid @enderror" id="dongiaban" name="dongiaban" value="{{ $thuoc->dongiaban }}" required />
                    @error('dongiaban')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="donggoi"> Quy cách đóng gói</label>
                    <input type="text" class="form-control @error('donggoi') is-invalid @enderror" id="donggoi" name="donggoi" value="{{ $thuoc->donggoi }}" required />
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
                        <option value="Viên" {{ ($thuoc->donvitinh == 'Viên') ? 'selected' : '' }}> Viên</option>
                        <option value="Chai" {{ ($thuoc->donvitinh == 'Chai') ? 'selected' : '' }}> Chai</option>
                        <option value="Tuýp" {{ ($thuoc->donvitinh == 'Tuýp') ? 'selected' : '' }}> Tuýp</option>
                        <option value="Hộp" {{ ($thuoc->donvitinh == 'Hộp') ? 'selected' : '' }}> Hộp</option>
                        <option value="Gói" {{ ($thuoc->donvitinh == 'Gói') ? 'selected' : '' }}> Gói</option>
                        <option value="Lọ" {{ ($thuoc->donvitinh == 'Lọ') ? 'selected' : '' }}> Lọ</option>
                        <option value="Khác" {{ ($thuoc->donvitinh == 'Khác') ? 'selected' : '' }}> Khác</option>
                    </select>
                    @error('donvitinh')
                    <div class="invaxlid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="thuockedon">Thuốc kê đơn</label>
                    <select class="form-select @error('thuockedon') is-invalid @enderror" id="thuockedon" name="thuockedon" required>
                        <option value="">-- Chọn thuốc kê đơn --</option>
                        <option value="1" {{ ($thuoc->thuockedon == '1') ? 'selected' : '' }}> Có</option>
                        <option value="0" {{ ($thuoc->thuockedon == '0') ? 'selected' : '' }}> Không</option>
                    </select>
                    @error('thuockedon')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label" for="thang">Số tháng hết hạng</label>
                    <select class="form-select @error('thang') is-invalid @enderror" id="thang" name="thang" required>
                        <option value="">-- Chọn số tháng --</option>
                        <option value="1" {{ ($thuoc->thang == '1') ? 'selected' : '' }}> 1 Tháng</option>
                        <option value="2" {{ ($thuoc->thang == '2') ? 'selected' : '' }}> 2 Tháng</option>
                        <option value="3" {{ ($thuoc->thang == '3') ? 'selected' : '' }}> 3 Tháng</option>
                        <option value="4" {{ ($thuoc->thang == '4') ? 'selected' : '' }}> 4 Tháng</option>
                        <option value="5" {{ ($thuoc->thang == '5') ? 'selected' : '' }}> 5 Tháng</option>
                        <option value="6" {{ ($thuoc->thang == '6') ? 'selected' : '' }}> 6 Tháng</option>
                        <option value="12" {{ ($thuoc->thang == '12') ? 'selected' : '' }}> 12 Tháng(1 năm)</option>
                        <option value="24" {{ ($thuoc->thang == '24') ? 'selected' : '' }}> 24 Tháng(2 năm)</option>
                        <option value="36" {{ ($thuoc->thang == '36') ? 'selected' : '' }}> 36 Tháng(3 năm)</option>
                        <option value="48" {{ ($thuoc->thang == '48') ? 'selected' : '' }}> 48 Tháng(4 năm)</option>
                        <option value="60" {{ ($thuoc->thang == '60') ? 'selected' : '' }}> 60 Tháng(5 năm)</option>
                        <option value="72" {{ ($thuoc->thang == '72') ? 'selected' : '' }}> 72 Tháng(6 năm)</option>
                    </select>
                    @error('thang')
                    <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                    @enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label" for="danhmuc_id">Danh mục</label>
                    <select class="form-select @error('danhmuc_id') is-invalid @enderror" id="danhmuc_id" name="danhmuc_id" required>
                        <option value="">-- Chọn danh mục --</option>@foreach($danhmuc as $value)
                        <option value="{{ $value->id }}" {{ ($thuoc->danhmuc_id == $value->id) ? 'selected' : '' }}>{{ $value->tendanhmuc }}</option>
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
                        <option value="{{ $value->id }}" {{ ($thuoc->nhomthuoc_id == $value->id) ? 'selected' : '' }}>{{ $value->tennhomthuoc }}</option>
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
                        <option value="{{ $value->id }}" {{ ($thuoc->hangsanxuat_id == $value->id) ? 'selected' : '' }}>{{ $value->tenhang }}</option>
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
                        <option value="{{ $value->id }}" {{ ($thuoc->quocgia_id == $value->id) ? 'selected' : '' }}>{{ $value->tenquocgia }}</option>
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
                        <input type="text" class="form-control @error('congdung') is-invalid @enderror" id="congdung" name="congdung" value="{{ $thuoc->congdung }}" required />
                        @error('congdung')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="hinhanh">Hình ảnh chính thuốc</label>
                        @if(!empty($thuoc->hinhanh))
                        <img class="d-block rounded img-thumbnail" src="{{ env('APP_URL') . '/storage/app/' . $thuoc->hinhanh }}" width="100" />
                        <span class="d-block small text-danger">Bỏ trống nếu muốn giữ nguyên ảnh cũ.</span>
                        @endif
                        <input type="file" class="form-control @error('hinhanh') is-invalid @enderror" id="hinhanh" name="hinhanh" value="{{ $thuoc->hinhanh }}" />
                        @error('hinhanh')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="hinhanhmota">Hình ảnh mô tả sản phẩm</label>
                        @if($dshinhanh->isNotEmpty())
                        <div class="d-flex">
                            @foreach($dshinhanh as $value)
                            <img class="d-block rounded img-thumbnail mx-2" src="{{ env('APP_URL') . '/storage/app/' . $value->hinhanhmota }}" width="100" />
                            @endforeach
                        </div>
                        <span class="d-block small text-danger">Bỏ trống nếu muốn giữ nguyên ảnh cũ.</span>
                        @endif
                        <input type="file" class="form-control @error('hinhanhmota') is-invalid @enderror" id="hinhanhmota" name="hinhanhmota[]" value="{{ $value->hinhanhmota }}" multiple />
                        @error('hinhanhmota')
                        <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="motathuoc">Mô tả thuốc</label>
                        <textarea class="form-control" id="motathuoc" name="motathuoc">{!! $thuoc->motathuoc !!}</textarea>
                    </div>

                </div>
            </div>

            <button type="submit" class="btn btn-primary"><i class="bi bi-save"></i> Cập nhật</button>
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