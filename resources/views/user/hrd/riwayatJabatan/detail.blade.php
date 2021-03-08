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
                    <li class="breadcrumb-item"><a href="{{ route('hrdPegawai.index') }}">List Pegawai</a></li>
                    <li class="breadcrumb-item"><a
                            href="{{ route('hrdPegawai.show', $id) }}">{{ $pegawai->id . '-' . $pegawai->nama }} </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">List Riwayat Jabatan</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            @if (session('success_message'))
                <div class="alert alert success">
                    {{ session('success_message') }}
                </div>
            @endif

            <table style="text-align:center" class="table table-bordered table-hover table-striped">
                <thead>
                    <tr>
                        <th>@sortablelink('id_jabatan','JABATAN')</th>
                        <th>@sortablelink('tgl_mulai','TANGGAL MULAI')</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @if ($riwayat_jabatan->count())
                        @foreach ($riwayat_jabatan as $key => $p)
                            <tr>
                                <td>{{ $p->jabatan->nm_jabatan }}</td>
                                <td>{{ $p->tgl_mulai }}</td>
                                <td>
                                    <?php $encyrpt = Crypt::encryptString($p->id); ?>
                                    <a href="{{ route('hrdRiwayatJabatan.edit', $encyrpt) }}"
                                        class="btn btn-warning">Edit</a>
                                    <a href="{{ route('hrdRiwayatJabatan.destroy', $encyrpt) }}"
                                        class="btn btn-danger delete-confirm">Delete</a>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                </tbody>
            </table>

            <br />
            <div class="pagenation">

                Page : {{ $riwayat_jabatan->currentPage() }}
                || Total Data : {{ $riwayat_jabatan->total() }}
                {{ $riwayat_jabatan->links() }}

            </div>
        </div>
    </section>
@endsection
