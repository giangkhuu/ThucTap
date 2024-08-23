<?php

namespace App\Http\Controllers;

use App\Models\NhaCungCap;
use App\Models\NhapHang;
use App\Models\SoLuongThuoc;
use App\Models\ThongTinNhapHang;
use App\Models\Thuoc;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;


class NhapHangController extends Controller
{
    public function getDanhSach()
    {
        $nhaphang = NhapHang::all();
        return view('admin.nhaphang.danhsach', compact('nhaphang'));
    }

    public function getThem()
    {
        $thuoc = Thuoc::all();
        $thongtinnhaphang = ThongTinNhapHang::all();
        $nhacungcap = NhaCungCap::all();
        return view('admin.nhaphang.them', compact('thuoc', 'thongtinnhaphang', 'nhacungcap'));
    }


    public function postThem(Request $request)
    {
        // Kiểm tra
        /*  $request->validate([
            'tendanhmuc' => ['required', 'string', 'max:191', 'unique:danhmuc'],
            'hinhanh' => ['nullable', 'image', 'max:1024']
        ]); */
        // Lưu vào nhạp hàng
        $nh = new NhapHang();
        $nh->nhacungcap_id = $request->nhacungcap_id;
        $nh->manhap = 'PNK_' . Str::random(7);        ;
        $nh->nguoinhap = Auth::user()->name;
        $nh->ngaynhap =  Carbon::today()->toDateString();
        $nh->save();
        // Lưu vào số lượng
        foreach (Cart::content() as $value) {
            $sl = new ThongTinNhapHang();
            $sl->thuoc_id = $value->id;
            $sl->nhaphang_id = $nh->id;
            $sl->solo = $value->options->solo;
            $sl->ngaysanxuat = $value->options->nsx;
            $sl->hansudung = $value->options->hsd;
            $sl->dongianhap = $value->price;
            $sl->soluong = $value->qty;
            $sl->save();
            $orm = Thuoc::find($value->id);
            $orm->soluong += $value->qty;
            $orm->save();
        }
        
        Cart::destroy();
        return redirect()->route('admin.nhaphang');
    }



    public function postNhapHang_Them(Request $request)
    {
        $tenthuoc = Thuoc::where('id', $request->thuoc_id)->firstOrFail();
        $title = $tenthuoc->tenthuoc;
        Cart::add([
            'id' => $request->thuoc_id,
            'name' => $title,
            'price' => $request->dongianhap,
            'qty' => $request->soluong,
            'weight' => 0, // cân nặng 
            'options' => [
                'solo' => $request->solo,
                'nsx' => $request->ngaysanxuat,
                'hsd' => $request->hansudung
            ]
        ]);
        return redirect()->route('admin.nhaphang.them');
    }


    public function getNhapHang_Xoa($row_id)
    {
        Cart::remove($row_id);
        return redirect()->route('admin.nhaphang.them');
    }
}
