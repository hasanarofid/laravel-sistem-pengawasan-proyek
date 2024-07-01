@extends('layout.base')

@section('title', 'Data pengawas')

@section('content_header')
    <div class="page-header page-header-default">
        <div class="page-header-content">
            <div class="page-title">
                <h4><i class="icon-cash3"></i> <span class="text-semibold">Data pengawas</span>
                    - List Data pengawas</h4>
            </div>

        </div>

        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><i class="active icon-home2 position-left"></i> List Data pengawas</li>
                {{-- <li class="active">Dashboard</li> --}}
            </ul>
        </div>
    </div>
@endsection

@section('content')
    <div class="panel bg-info">
        <div class="panel-heading">
            <em>
                <h6>Pada halaman ini terdapat list daftar pengawas yang ada di dalam perusahaan ini. masing-masing
                    Time Shedule bisa
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
            <a href="{{ route('pengawas.create') }}"><i class="icon-file-plus"></i> Tambah Data  </a>
        </div>

        <div class="panel-body ">
            <div class="table-responsive">
            <table class="table datatable-basic table-bordered table-striped table-hover table-xs ">
                <thead class="bg-primary">
                    <tr>
                        <th>No</th>
                        <th>Tanggal </th>
                        <th>Nama </th>
                        <th> File</th>
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
                                    {{ $p->nama }}
                                </td>
                                <td>
                                    <a target="_blank" href="{{ route('downloadfile',['file'=>$p->file]) }}">{{ $p->file }}</a>
                                    
                                </td>
                                
                                <td class="text-center">
                                    <ul class="icons-list">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                <i class="icon-menu9"></i>
                                            </a>

                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <?php $encyrpt = Crypt::encryptString($p->id); ?>
                                                <li><a href="{{ route('pengawas.destroy', $encyrpt) }}"><i
                                                            class=" icon-trash"></i> Hapus</a>
                                                </li>
                                                <li><a href="{{ route('pengawas.edit', $encyrpt) }}"><i
                                                            class=" icon-pencil5"></i> Edit</a>
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
