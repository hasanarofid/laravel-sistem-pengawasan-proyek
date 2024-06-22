@extends('layout.base')


@section('title', 'Edit Data Laporan Harian')


@section('content_header')
<div class="page-header page-header-default">
    <div class="page-header-content">
        <div class="page-title">
            <h4><i class="icon-users4"></i> <span class="text-semibold">Data Laporan Harian</span>
                - Edit Data Laporan Harian</h4>
        </div>

    </div>

    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li> <a href="{{ route('laporanHarian.index') }}"> <i class="active icon-home2 position-left"></i> List Data
                    Laporan Harian
                </a>
            </li>
            <li class="active">Edit Data Laporan Harian</li>
        </ul>
    </div>
</div>
@endsection

@section('content')
<div class="panel bg-info">
    <div class="panel-heading">
        <em>
            <h6> Halaman ini berguna apabila anda ingin menambah data Laporan Harian baru, pastikan data yang akan diEditkan
                belum ada di dalam database.</h6>
        </em>
        <div class="heading-elements">
            <ul class="icons-list">
                <li><a data-action="close"></a></li>
            </ul>
        </div>

    </div>
</div>

<form method="post" enctype="multipart/form-data" action="{{ route('laporanHarian.update', $id) }}">

    {{ csrf_field() }}
    {{ method_field('PUT') }}

    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title">Edit Data Laporan Harian</h5>
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
                            <input type="date" name="tanggal" class="form-control" value="{{ $laporan->tanggal }}">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Barang :</label>
                            <input type="text" name="barang" class="form-control" placeholder="Barang Yang Masuk...." value="{{ $laporan->barang }}">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Kegiatan :</label>
                            <input type="text" name="kegiatan" class="form-control" placeholder="Pekerjaaan Yang Dikerjakan...." value="{{ $laporan->kegiatan }}">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Jumlah Pekerjaan :</label>
                            <input type="text" name="jumlah_pekerjaan" class="form-control" placeholder="jumlah Pekerja...." value="{{ $laporan->jumlah_pekerjaan }}">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Alat Digunakan :</label>
                            <input type="text" name="alat_digunakan" class="form-control" placeholder="Alat Yang Digunakan...." value="{{ $laporan->alat_digunakan }}">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Status :</label>
                            <input type="text" name="keterangan" class="form-control" placeholder="Status...." value="{{ $laporan->keterangan }}">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Dokumentasi :</label>
                            <input type="file" name="dokumentasi" class="form-control" value="{{ $laporan->dokumentasi }}">
                        </div>
                </div>
            </div>
            <div class="text-right mt-3">
                <button type="submit" class="btn btn-primary">Update Data <i
                        class="icon-arrow-right14 position-right"></i></button>
            </div>
        </div>
    </div>
</form>
<!-- /2 columns form -->

@endsection