@extends('layout.base')

@section('title', 'Data Laporan Harian')

@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Data Laporan Harian</span>
                    - List Data Laporan Harian</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><i class="active icon-home2 position-left"></i> List Data Laporan Harian</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')
    <div class="panel bg-info">
        <div class="panel-heading">
            <em>
                <h6>Pada halaman ini terdapat list daftar Laporan Harian Laporan Harian yang ada di dalam perusahaan ini. masing-masing
                    Laporan Harian bisa
                    dihapus dan diedit.
                </h6>
            </em>
            <div class="heading-elements">
                <ul class="icons-list">
                    <li><a data-action="close"></a></li>
                </ul>
            </div>

        </div>
    </div>

    <div class="panel panel-flat">
        <div class="panel-heading">
            <a href="{{ route('laporanHarian.create') }}"><i class="icon-file-plus"></i> Tambah Data  Laporan Harian </a>
        </div>

        <div class="panel-body ">
            <div class="table-responsive">
            <table class="table datatable-basic table-bordered table-striped table-hover table-xs ">
                <thead class="bg-primary">
                    <tr>
                        <th>No</th>
                        <th>Tanggal </th>
                        <th>Barang </th>
                        <th> Kegiatan</th>
                        <th> Dokumentasi</th>
                        <th> Jumlah pekerjaan</th>
                        <th> Alat digunakan</th>
                        <th> Status</th>
                        {{-- <th hidden></th> --}}
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    @if ($laporan->count())
                        @foreach ($laporan as $key => $p)
                            @php
                                $encyrpt = Crypt::encryptString($p->id);
                            @endphp

                            <tr>
                                <td>{{ $i++ }}</td>
                                <td>{{ $p->tanggal }}</td>
                                <td>
                                    {{ $p->barang }}
                                </td>
                                <td>
                                    {{ $p->kegiatan }}
                                </td>
                                <td>
                                    <div class="text-center">
                                        @php $path =Storage::url('images/'.$p->dokumentasi); @endphp
                                        <img src="{{ url($path) }}"
                                            onerror="this.onerror=null; this.src='{{ URL::to('/admin/assets/images/brands/user.jpeg') }}'"
                                            alt="Dokumentasi" width="160">
                                    </div>
                                    {{ $p->dokumentasi }}
                                </td>
                                <td>
                                {{ $p->jumlah_pekerjaan }}
                                </td>
                                <td>
                                {{ $p->alat_digunakan }}
                                </td>
                                <td>
                                {{ $p->keterangan }}
                                </td>
                                <td class="text-center">
                                    <ul class="icons-list">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                <i class="icon-menu9"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <?php $encyrpt = Crypt::encryptString($p->id); ?>
                                                <li><a href="{{ route('laporanHarian.destroy', $encyrpt) }}"><i
                                                            class=" icon-trash"></i> Hapus</a>
                                                </li>
                                                <li><a href="{{ route('laporanHarian.edit', $encyrpt) }}"><i
                                                            class=" icon-pencil5"></i> Edit</a>
                                                </li>
                                                <li><a href="{{ route('laporanHarian.show', $encyrpt) }}"
                                                    target="_blank"><i class=" icon-folder-open3"></i> Buka File
                                                    Surat</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        @endforeach
                    @endif

                </tbody>
            </table>
            </div>
        </div>
    </div>
    <!-- /basic datatable -->

@endsection
