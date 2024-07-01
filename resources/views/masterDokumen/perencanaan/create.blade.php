@extends('layout.base')


@section('title', 'Tambah Data perencanaan')


@section('content_header')
<div class="page-header page-header-default">
    <div class="page-header-content">
        <div class="page-title">
            <h4><i class="icon-users4"></i> <span class="text-semibold">Data perencanaan</span>
                - Tambah Data perencanaan</h4>
        </div>

    </div>

    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li> <a href="{{ route('laporanHarian.index') }}"> <i class="active icon-home2 position-left"></i> List Data
                    perencanaan
                </a>
            </li>
            <li class="active">Tambah Data perencanaan</li>
        </ul>
    </div>
</div>
@endsection

@section('content')
<div class="panel bg-info">
    <div class="panel-heading">
        <em>
            <h6> Halaman ini berguna apabila anda ingin menambah data Laporan perencanaan baru, pastikan data yang akan ditambahkan
                belum ada di dalam database.</h6>
        </em>
        <div class="heading-elements">
            <ul class="icons-list">
                <li><a data-action="close"></a></li>
            </ul>
        </div>

    </div>
</div>

<form method="post" enctype="multipart/form-data" action="{{ route('perencanaan.store') }}">

    {{ csrf_field() }}

    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title">Tambah Data </h5>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col">
                    <legend class="text-semibold"><i class="icon-reading position-left"></i> Data Dokumen
                    </legend>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Tanggal :</label>
                            <input type="date" name="tanggal" class="form-control" value="">
                        </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Nama :</label>
                            <input type="text" name="nama" class="form-control" placeholder="Nama Dokumen...." value="">
                        </div>
                </div>
            </div>
          
            <div class="row">
                <div class="col-md-6">
                        <div class="form-group">
                            <label>File :</label>
                            <input type="file" name="file" class="form-control" value="">
                        </div>
                </div>
            </div>
            <div class="text-right mt-3">
                <button type="submit" class="btn btn-primary">Tambah <i class="icon-arrow-right14 position-right"></i></button>
            </div>
        </div>
    </div>
</form>
<!-- /2 columns form -->

@endsection