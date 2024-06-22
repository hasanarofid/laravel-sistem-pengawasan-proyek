<?php

namespace App\Http\Controllers;

class SuratPekerjaanController extends Controller
{
    function __construct()
    {
        $this->middleware('permission:dashboard-admin', ['all']);
    }

    public function index()
    {
        return view('admin.suratPekerjaan.index');
    }
}