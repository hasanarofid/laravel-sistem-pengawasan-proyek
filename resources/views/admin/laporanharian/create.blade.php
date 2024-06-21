@extends('layout.base')


@section('title', 'Tambah Data Laporan Harian')


@section('content_header')
<div class="page-header page-header-default">
    <div class="page-header-content">
        <div class="page-title">
            <h4><i class="icon-users4"></i> <span class="text-semibold">Data Laporan Harian</span>
                - Tambah Data Laporan Harian</h4>
        </div>

    </div>

    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li> <a href="{{ route('laporanHarian.index') }}"> <i class="active icon-home2 position-left"></i> List Data
                    Laporan Harian
                </a>
            </li>
            <li class="active">Tambah Data Laporan Harian</li>
        </ul>
    </div>
</div>
@endsection

@section('content')
<div class="panel bg-info">
    <div class="panel-heading">
        <em>
            <h6> Halaman ini berguna apabila anda ingin menambah data Laporan Harian baru, pastikan data yang akan ditambahkan
                belum ada di dalam database.</h6>
        </em>
        <div class="heading-elements">
            <ul class="icons-list">
                <li><a data-action="close"></a></li>
            </ul>
        </div>

    </div>
</div>

<form method="post" enctype="multipart/form-data" action="{{ route('laporanHarian.store') }}">

    {{ csrf_field() }}

    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title">Tambah Data Laporan Harian</h5>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col">
                    <legend class="text-semibold"><i class="icon-reading position-left"></i> Data Personal
                    </legend>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Tanggal :</label>
                            <input type="date" name="txtTanggal" class="form-control" value="">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Barang :</label>
                            <input type="text" name="txtBarang" class="form-control" placeholder="Barang Yang Masuk...." value="">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Kegiatan :</label>
                            <input type="text" name="txtKegiatan" class="form-control" placeholder="Pekerjaaan Yang Dikerjakan...." value="">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Jumlah Pekerjaan :</label>
                            <input type="text" name="txtJumlah" class="form-control" placeholder="jumlah Pekerja...." value="">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Alat Digunakan :</label>
                            <input type="text" name="txtAlat" class="form-control" placeholder="Alat Yang Digunakan...." value="">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Status :</label>
                            <input type="text" name="txtStatus" class="form-control" placeholder="Status...." value="">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Dokumentasi :</label>
                            <input type="file" name="fileupload" class="form-control" value="">
                        </div>
                </div>
            </div>
            <div class="text-right mt-3">
                <button type="submit" class="btn btn-primary">Submit form <i class="icon-arrow-right14 position-right"></i></button>
            </div>
        </div>
    </div>
</form>
<!-- /2 columns form -->

@endsection