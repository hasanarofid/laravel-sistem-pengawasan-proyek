<?php

namespace App\Http\Controllers;

use App\Models\MasterDokumen;
use Illuminate\Http\Request;

class RekapLaporanController extends Controller
{
    function __construct()
    {
        $this->middleware('permission:dashboard-admin', ['all']);
    }

    public function index(){
        $laporan = MasterDokumen::get();
        return view('admin.rekapLaporan.index', compact('laporan'));
    }
}
