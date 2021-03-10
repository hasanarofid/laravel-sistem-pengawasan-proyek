@extends('user.layouts.base')

@section('title', 'Data Pegawai')

@section('content')


    <!-- Start top-section Area -->
    <section class="banner-area relative">
        <div class="overlay overlay-bg"></div>
        <div class="container">
            <div class="row justify-content-between align-items-center text-center banner-content">
                <div class="col-lg-12">
                    <h1 class="text-white">Data Pegawai</h1>
                    <p>Mengelola Semua Data Pegawai Perusahaan dengan Efisien </p>
                </div>
            </div>
        </div>
    </section>
    <!-- End top-section Area -->




    <section class="about-area section-gap">
        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">List Pegawai / </li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            @if (session('success_message'))
                <div class="alert alert success">
                    {{ session('success_message') }}
                </div>
            @endif
            <div class="row">
                <div class="col">
                    <a href="{{ route('hrdPegawai.create') }}" class="btn btn-primary">Tambah Pegawai Baru</a>
                </div>
                <div class="col"></div>
                <div class="col">
                    <form action="{{ route('hrdPegawai.search') }}" method="GET" class="form-inline">
                        {{ csrf_field() }}

                        <div class="form-group ml-5">
                            <div class="input-group">
                                <input class="form-control mr-2" type="text" name="cari" placeholder="Cari Pegawai .."
                                    value="{{ old('cari') }}">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" type="submit">Go!</button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div class="mb-3"></div>
            <table style="text-align:center" class="table table-bordered table-hover table-striped">
                <thead>
                    <tr>
                        <th>@sortablelink('id','ID Pegawai')</th>
                        <th>@sortablelink('nama','NAMA ')</th>
                        <th>@sortablelink('id_jabatan','JABATAN')</th>
                        <th>@sortablelink('id_divisi','DIVISI')</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @if ($pegawai->count())
                        @foreach ($pegawai as $key => $p)
                            <tr>
                                <td>{{ $p->id }}</td>
                                <td>{{ $p->nama }}</td>
                                <td>{{ $p->jabatan->nm_jabatan }}</td>
                                <td>{{ $p->divisi->nm_divisi }}</td>
                                <td>
                                    <?php $encyrpt = Crypt::encryptString($p->id); ?>
                                    <a href="{{ route('hrdPegawai.show', $encyrpt) }}" class="btn btn-success">Detail</a>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                </tbody>
            </table>

            <br />
            <div class="pagenation">

                Page : {{ $pegawai->currentPage() }}
                || Total Data : {{ $pegawai->total() }}
                {{ $pegawai->appends(\Request::except('page'))->render() }}

            </div>
        </div>
    </section>
@endsection
