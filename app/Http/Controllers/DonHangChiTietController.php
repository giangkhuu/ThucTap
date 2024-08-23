<?php

namespace App\Http\Controllers;

use App\Models\DonHang_ChiTiet;
use Illuminate\Http\Request;

class DonHangChiTietController extends Controller
{
    public function getDanhSach()
    {
        $donhang_chitiet = DonHang_ChiTiet::all();
        return view('admin.donhang_chitiet.danhsach', compact('donhang_chitiet'));
    }
}