<?php

use App\Http\Controllers\Controller;
use App\Http\Controllers\CutiController;
use App\Http\Controllers\LaporanUmumController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\JabatanController;
use App\Http\Controllers\DivisiController;
use App\Http\Controllers\PresensiHarianController;
use App\Http\Controllers\RiwayatJabatanController;
use App\Http\Controllers\PeraturanController;
use App\Http\Controllers\RiwayatDivisiController;
use App\Http\Controllers\RekapPresensiController;
use App\Http\Controllers\RekapCutiController;


use App\Http\Controllers\DownloadFileController;
use App\Http\Controllers\Hrd\HrdPengajuanCutiController;
use Illuminate\Support\Facades\Mail;
use PhpOffice\PhpSpreadsheet\Chart\Layout;


use App\Http\Controllers\AuthController;
use App\Http\Controllers\Dashboard;
use App\Http\Controllers\DokumenGambarController;
use App\Http\Controllers\PasswordController;
use App\Http\Controllers\ForgotPasswordController;
use App\Http\Controllers\GajiController;
use App\Http\Controllers\Hrd\HrdDashboardController;
use App\Http\Controllers\KerangkaAcuanKerjaController;
use App\Http\Controllers\LaporanHarianController;
use App\Http\Controllers\ManajemenPerusahaanController;
use App\Http\Controllers\ManajemenRoleMenuController;
use App\Http\Controllers\MasterDokumenController;
use App\Http\Controllers\MemoLapanganController;
use App\Http\Controllers\PelaksanaController;
use App\Http\Controllers\PengawasController;
use App\Http\Controllers\PenilaianKinerjaController;
use App\Http\Controllers\PerencanaanController;
use App\Http\Controllers\PotonganController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Controllers\ProfilController;
use App\Http\Controllers\ReportKinerjaController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\Staff\StaffCutiController;
use App\Http\Controllers\Staff\StaffDashboardController;
use App\Http\Controllers\Staff\StaffPengajuanCutiController;
use App\Http\Controllers\SuratIjinPekerjaanController;
use App\Http\Controllers\SuratPekerjaanController;
use App\Http\Controllers\SuratPemberitahuanController;
use App\Http\Controllers\SuratPeringatanController;
use App\Http\Controllers\SuratUndanganRapatController;
use App\Http\Controllers\TunjanganController;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// DI SINI ADALAH ROUTES UNTUK MENU LOGIN //
Route::get('/', [AuthController::class, 'index'])->name('login');
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');


// Reset Password
Route::get('/forget-password', [ForgotPasswordController::class, 'getEmail'])->name('forget-password.getEmail');
Route::post('/forget-password/postEmail', [ForgotPasswordController::class, 'postEmail'])->name('forget-password.postEmail');
Route::get('/reset-password/{token}', [ResetPasswordController::class, 'getPassword'])->name('reset-password.getPassword');
Route::post('/reset-password', [ResetPasswordController::class, 'updatePassword'])->name('reset-password.updatePassword');


Route::group(['middleware' => ['auth']], function () {

    //Search
    Route::get('/pegawai/search/', [SearchController::class, 'pegawai'])->name('pegawai.search');
    Route::get('/penilaian/search/', [SearchController::class, 'penilaian'])->name('penilaian.search');
    Route::get('/riwayatJabatan/search/', [SearchController::class, 'riwayatJabatan'])->name('riwayatJabatan.search');
    Route::get('/riwayatDivisi/search/', [SearchController::class, 'riwayatDivisi'])->name('riwayatDivisi.search');
    Route::get('/rekapPresensi/search/', [SearchController::class, 'rekapPresensi'])->name('rekapPresensi.search.pegawai');
    Route::get('/rekapCuti/search/', [SearchController::class, 'rekapCuti'])->name('rekapCuti.search.pegawai');
    Route::get('/gaji/search/', [SearchController::class, 'gaji'])->name('gaji.search.pegawai');
    Route::get('/report/search/', [SearchController::class, 'report'])->name('report.search.pegawai');
    Route::get('/presensi/search/', [SearchController::class, 'presensi'])->name('presensi.search.data');
    Route::get('/cuti/search/', [SearchController::class, 'cuti'])->name('cuti.search.data');


    //Rekap Presensi Pegawai
    Route::resource('rekapPresensi', RekapPresensiController::class);
    Route::get('/rekapPresensi/tahun/{data}', [RekapPresensiController::class, 'search'])->name('rekapPresensi.search');


    //Rekap Cuti Pegawai
    Route::resource('rekapCuti', RekapCutiController::class);
    Route::get('/rekapCuti/tahun/{data}', [RekapCutiController::class, 'showYear'])->name('rekapCuti.showYear');


    //Profil
    Route::resource('/profil', ProfilController::class);


    // Ganti Password
    Route::resource('/pass', PasswordController::class);


    //Cuti Staff
    Route::resource('staffCuti', StaffCutiController::class);
    Route::post('/staffCuti/tahun/', [StaffCutiController::class, 'tahunCuti'])->name('staffCuti.search');


    //Pengajuan Cuti
    Route::resource('staffPengajuanCuti', StaffPengajuanCutiController::class);
    Route::put('/staffPengajuanCuti/keputusan/{data}', [StaffPengajuanCutiController::class, 'keputusan'])->name('staffPengajuanCuti.keputusan');


    // Dashboard Admin
    Route::resource('superAdmin', Dashboard::class);


    // Dashboard HRD
    Route::resource('hrd', HrdDashboardController::class);
    Route::post('/hrd/grafKehadiran/', [HrdDashboardController::class, 'kehadiran'])->name('hrd.grafKehadiran');


    //Pegawai
    Route::get('/pegawai/restore/{data}', [PegawaiController::class, 'restore'])->name('pegawai.restore');
    Route::get('/pegawai/trash/', [PegawaiController::class, 'trash'])->name('pegawai.trash');
    Route::resource('pegawai', PegawaiController::class);
    Route::get('/pegawai/destroy/{data}', [PegawaiController::class, 'destroy'])->name('pegawai.destroy');
    Route::get('/pegawai/destroyPermanent/{data}', [PegawaiController::class, 'destroyPermanent'])->name('pegawai.destroyPermanent');


    //Jabatan
    Route::resource('jabatan', JabatanController::class);
    Route::get('/jabatan/destroy/{data}', [JabatanController::class, 'destroy'])->name('jabatan.destroy');


    //Divisi
    Route::resource('divisi', DivisiController::class);
    Route::get('/divisi/destroy/{data}', [DivisiController::class, 'destroy'])->name('divisi.destroy');


    //Presensi
    Route::get('/presensi/tanggal/', [PresensiHarianController::class, 'tglPresensi'])->name('presensi.search');
    Route::get('/presensi/template_download', [PresensiHarianController::class, 'download'])->name('presensi.template');
    Route::resource('/presensi', PresensiHarianController::class);
    Route::get('/presensi/destroy/{data}', [PresensiHarianController::class, 'destroy'])->name('presensi.destroy');
    Route::post('/presensi/import_excel', [PresensiHarianController::class, 'import'])->name('presensi.import');


    //Cuti
    Route::get('/cuti/tanggal/', [CutiController::class, 'tglPresensi'])->name('cuti.search');
    Route::get('/cuti/cutiBersama', [CutiController::class, 'cutiBersama'])->name('cuti.cutiBersama');
    Route::post('/cuti/cutiBersama/store', [CutiController::class, 'storeCutiBersama'])->name('cuti.storeCutiBersama');
    Route::resource('cuti', CutiController::class);
    Route::get('/cuti/destroy/{data}', [CutiController::class, 'destroy'])->name('cuti.destroy');
    Route::resource('hrdPengajuanCuti', HrdPengajuanCutiController::class); // pengajuan cuti tingkat HRD
    Route::put('/hrdPengajuanCuti/keputusan/{data}', [HrdPengajuanCutiController::class, 'keputusan'])->name('hrdPengajuanCuti.keputusan');


    //RiwayatJabatan
    Route::resource('riwayatJabatan', RiwayatJabatanController::class);
    Route::post('/riwayatJabatan/store', [RiwayatJabatanController::class, 'store'])->name('riwayatJabatan.store');
    Route::get('/riwayatJabatan/createData/{data}', [RiwayatJabatanController::class, 'createData'])->name('riwayatJabatan.createData');
    Route::get('/riwayatJabatan/destroy/{data}', [RiwayatJabatanController::class, 'destroy'])->name('riwayatJabatan.destroy');


    //RiwayatDivisi
    Route::resource('riwayatDivisi', RiwayatDivisiController::class);
    Route::post('/riwayatDivisi/store', [RiwayatDivisiController::class, 'store'])->name('riwayatDivisi.store');
    Route::get('/riwayatDivisi/createData/{data}', [RiwayatDivisiController::class, 'createData'])->name('riwayatDivisi.createData');
    Route::get('/riwayatDivisi/destroy/{data}', [RiwayatDivisiController::class, 'destroy'])->name('riwayatDivisi.destroy');


    //Kebijakan Jam Kerja & Cuti
    Route::resource('peraturan', PeraturanController::class);


    //Menu Staff
    Route::resource('staff', StaffDashboardController::class);
    Route::post('/staff/pres/', [StaffDashboardController::class, 'presensi'])->name('staff.presensi');
    Route::get('/staff/openFile/{data}', [StaffDashboardController::class, 'openFile'])->name('staff.openFile');


    //Menu Manajemen Role & Menu Dinamis
    Route::resource('role', RoleController::class);
    Route::get('/role/destroy/{data}', [RoleController::class, 'destroy'])->name('role.destroy');
    Route::patch('/role/update/{data}', [RoleController::class, 'update'])->name('role.update');

    Route::get('/manajemen', [ManajemenRoleMenuController::class, 'index'])->name('manajemen.index');

    Route::get('/manajemen/createMenu', [ManajemenRoleMenuController::class, 'createMenu'])->name('manajemen.createMenu');
    Route::post('/manajemen/storeMenu', [ManajemenRoleMenuController::class, 'storeMenu'])->name('manajemen.storeMenu');
    Route::get('/manajemen/{data}/editMenu', [ManajemenRoleMenuController::class, 'editMenu'])->name('manajemen.editMenu');
    Route::patch('/manajemen/{data}/updateMenu', [ManajemenRoleMenuController::class, 'updateMenu'])->name('manajemen.updateMenu');
    Route::get('/manajemen/{data}/destroyMenu', [ManajemenRoleMenuController::class, 'destroyMenu'])->name('manajemen.destroyMenu');

    Route::get('/manajemen/createHakAkses', [ManajemenRoleMenuController::class, 'createHakAkses'])->name('manajemen.createHakAkses');
    Route::post('/manajemen/storeHakAkses', [ManajemenRoleMenuController::class, 'storeHakAkses'])->name('manajemen.storeHakAkses');


    // Menu Gaji
    Route::resource('tunjangan', TunjanganController::class);
    Route::get('/tunjangan/destroy/{data}', [TunjanganController::class, 'destroy'])->name('tunjangan.destroy');
    Route::put('/tunjangan/isActive/{data}', [TunjanganController::class, 'isActive'])->name('tunjangan.isActive');
    Route::put('/tunjangan/isShown/{data}', [TunjanganController::class, 'isShown'])->name('tunjangan.isShown');

    Route::resource('potongan', PotonganController::class);
    Route::get('/potongan/destroy/{data}', [PotonganController::class, 'destroy'])->name('potongan.destroy');
    Route::put('/potongan/isActive/{data}', [PotonganController::class, 'isActive'])->name('potongan.isActive');
    Route::put('/potongan/isShown/{data}', [PotonganController::class, 'isShown'])->name('potongan.isShown');

    Route::resource('gaji', GajiController::class);
    Route::get('/gaji/createData/{data}', [GajiController::class, 'createData'])->name('gaji.createData');
    Route::get('/gaji/download/{data}', [GajiController::class, 'downloadSlipGaji'])->name('gaji.download');
    Route::get('/gaji/destroy/{data}', [GajiController::class, 'destroy'])->name('gaji.destroy');
    Route::get('/gaji/send/{id_pegawai}/{id_gaji}', [GajiController::class, 'sendEmail'])->name('gaji.send');


    //Menu Surat Peringatan
    Route::get('/suratPeringatan/search/', [SuratPeringatanController::class, 'searchSurat'])->name('suratPeringatan.search');
    Route::resource('suratPeringatan', SuratPeringatanController::class);
    Route::get('/suratPeringatan/destroy/{data}', [SuratPeringatanController::class, 'destroy'])->name('suratPeringatan.destroy');


    //Menu Report Kinerja
    Route::get('report/export/getYear', [ReportKinerjaController::class, 'getList'])->name('report.getYear');
    Route::resource('report', ReportKinerjaController::class);
    Route::get('/report/export/{id_pegawai}/{year}', [ReportKinerjaController::class, 'exportKinerja'])->name('report.exportKinerja');


    //Menu Manajemen Perusahaan
    Route::resource('perusahaan', ManajemenPerusahaanController::class);


    //Penilaian Kinerja Karyawan
    Route::get('/penilaian/showAll', [PenilaianKinerjaController::class, 'showAll'])->name('penilaian.showAll');
    Route::resource('penilaian', PenilaianKinerjaController::class);
    Route::get('/penilaian/createData/{data}', [PenilaianKinerjaController::class, 'createData'])->name('penilaian.createData');

    //laporan harian
    Route::resource('laporanHarian', LaporanHarianController::class);
    Route::get('/laporanHarian/destroy/{data}', [LaporanHarianController::class, 'destroy'])->name('laporanHarian.destroy');

    //laporan harian
    Route::resource('suratPekerjaan', SuratPekerjaanController::class);

    //masterDokumen
    Route::get('timeShedule', [MasterDokumenController::class, 'timeShedule'])->name('timeShedule');
    Route::get('timeShedule/create', [MasterDokumenController::class, 'timeSheduleCreate'])->name('timeShedule.create');
    Route::get('timeShedule/edit/{data}', [MasterDokumenController::class, 'timeSheduleEdit'])->name('timeShedule.edit');
    Route::post('timeShedule/store', [MasterDokumenController::class, 'timeSheduleStore'])->name('timeShedule.store');
    Route::put('timeShedule/update', [MasterDokumenController::class, 'timeSheduleUpdate'])->name('timeShedule.update');
    Route::get('/timeShedule/destroy/{data}', [MasterDokumenController::class, 'timeSheduledestroy'])->name('timeShedule.destroy');
    // end master dokumen

     //laporan umum
     Route::get('laporanUmum', [LaporanUmumController::class, 'index'])->name('laporanUmum');
     Route::get('laporanUmum/create', [LaporanUmumController::class, 'create'])->name('laporanUmum.create');
     Route::get('laporanUmum/edit/{data}', [LaporanUmumController::class, 'edit'])->name('laporanUmum.edit');
     Route::post('laporanUmum/store', [LaporanUmumController::class, 'store'])->name('laporanUmum.store');
     Route::put('laporanUmum/update', [LaporanUmumController::class, 'update'])->name('laporanUmum.update');
     Route::get('/laporanUmum/destroy/{data}', [LaporanUmumController::class, 'destroy'])->name('laporanUmum.destroy');
     // end laporan umum

    //perencanaan
    Route::get('perencanaan', [PerencanaanController::class, 'index'])->name('perencanaan');
    Route::get('perencanaan/create', [PerencanaanController::class, 'create'])->name('perencanaan.create');
    Route::get('perencanaan/edit/{data}', [PerencanaanController::class, 'edit'])->name('perencanaan.edit');
    Route::post('perencanaan/store', [PerencanaanController::class, 'store'])->name('perencanaan.store');
    Route::put('perencanaan/update', [PerencanaanController::class, 'update'])->name('perencanaan.update');
    Route::get('/perencanaan/destroy/{data}', [PerencanaanController::class, 'destroy'])->name('perencanaan.destroy');
    //end perencanaan

    //pengawas
    Route::get('pengawas', [PengawasController::class, 'index'])->name('pengawas');
    Route::get('pengawas/create', [PengawasController::class, 'create'])->name('pengawas.create');
    Route::get('pengawas/edit/{data}', [PengawasController::class, 'edit'])->name('pengawas.edit');
    Route::post('pengawas/store', [PengawasController::class, 'store'])->name('pengawas.store');
    Route::put('pengawas/update', [PengawasController::class, 'update'])->name('pengawas.update');
    Route::get('/pengawas/destroy/{data}', [PengawasController::class, 'destroy'])->name('pengawas.destroy');
    //end pengawas

    // pelaksana
    Route::get('pelaksana', [PelaksanaController::class, 'index'])->name('pelaksana');
    Route::get('pelaksana/create', [PelaksanaController::class, 'create'])->name('pelaksana.create');
    Route::get('pelaksana/edit/{data}', [PelaksanaController::class, 'edit'])->name('pelaksana.edit');
    Route::post('pelaksana/store', [PelaksanaController::class, 'store'])->name('pelaksana.store');
    Route::put('pelaksana/update', [PelaksanaController::class, 'update'])->name('pelaksana.update');
    Route::get('/pelaksana/destroy/{data}', [PelaksanaController::class, 'destroy'])->name('pelaksana.destroy');
    // end pelaksana

    // dokumenGambar
        Route::get('dokumenGambar', [DokumenGambarController::class, 'index'])->name('dokumenGambar');
        Route::get('dokumenGambar/create', [DokumenGambarController::class, 'create'])->name('dokumenGambar.create');
        Route::get('dokumenGambar/edit/{data}', [DokumenGambarController::class, 'edit'])->name('dokumenGambar.edit');
        Route::post('dokumenGambar/store', [DokumenGambarController::class, 'store'])->name('dokumenGambar.store');
        Route::put('dokumenGambar/update', [DokumenGambarController::class, 'update'])->name('dokumenGambar.update');
        Route::get('/dokumenGambar/destroy/{data}', [DokumenGambarController::class, 'destroy'])->name('dokumenGambar.destroy');
    // end dokumenGambar

    //kerangkaAcuanKerja
        Route::get('kerangkaAcuanKerja', [KerangkaAcuanKerjaController::class, 'index'])->name('kerangkaAcuanKerja');
        Route::get('kerangkaAcuanKerja/create', [KerangkaAcuanKerjaController::class, 'create'])->name('kerangkaAcuanKerja.create');
        Route::get('kerangkaAcuanKerja/edit/{data}', [KerangkaAcuanKerjaController::class, 'edit'])->name('kerangkaAcuanKerja.edit');
        Route::post('kerangkaAcuanKerja/store', [KerangkaAcuanKerjaController::class, 'store'])->name('kerangkaAcuanKerja.store');
        Route::put('kerangkaAcuanKerja/update', [KerangkaAcuanKerjaController::class, 'update'])->name('kerangkaAcuanKerja.update');
        Route::get('/kerangkaAcuanKerja/destroy/{data}', [KerangkaAcuanKerjaController::class, 'destroy'])->name('kerangkaAcuanKerja.destroy');
    // end kerangkaAcuanKerja

    // suratIjinPekerjaan
        Route::get('suratIjinPekerjaan', [SuratIjinPekerjaanController::class, 'index'])->name('suratIjinPekerjaan');
        Route::get('suratIjinPekerjaan/create', [SuratIjinPekerjaanController::class, 'create'])->name('suratIjinPekerjaan.create');
        Route::get('suratIjinPekerjaan/edit/{data}', [SuratIjinPekerjaanController::class, 'edit'])->name('suratIjinPekerjaan.edit');
        Route::post('suratIjinPekerjaan/store', [SuratIjinPekerjaanController::class, 'store'])->name('suratIjinPekerjaan.store');
        Route::put('suratIjinPekerjaan/update', [SuratIjinPekerjaanController::class, 'update'])->name('suratIjinPekerjaan.update');
        Route::get('/suratIjinPekerjaan/destroy/{data}', [SuratIjinPekerjaanController::class, 'destroy'])->name('suratIjinPekerjaan.destroy');
    // end suratIjinPekerjaan

    // suratUndanganRapat
        Route::get('suratUndanganRapat', [SuratUndanganRapatController::class, 'index'])->name('suratUndanganRapat');
        Route::get('suratUndanganRapat/create', [SuratUndanganRapatController::class, 'create'])->name('suratUndanganRapat.create');
        Route::get('suratUndanganRapat/edit/{data}', [SuratUndanganRapatController::class, 'edit'])->name('suratUndanganRapat.edit');
        Route::post('suratUndanganRapat/store', [SuratUndanganRapatController::class, 'store'])->name('suratUndanganRapat.store');
        Route::put('suratUndanganRapat/update', [SuratUndanganRapatController::class, 'update'])->name('suratUndanganRapat.update');
        Route::get('/suratUndanganRapat/destroy/{data}', [SuratUndanganRapatController::class, 'destroy'])->name('suratUndanganRapat.destroy');
    // end suratUndanganRapat

    // suratPemberitahuan
    Route::get('suratPemberitahuan', [SuratPemberitahuanController::class, 'index'])->name('suratPemberitahuan');
    Route::get('suratPemberitahuan/create', [SuratPemberitahuanController::class, 'create'])->name('suratPemberitahuan.create');
    Route::get('suratPemberitahuan/edit/{data}', [SuratPemberitahuanController::class, 'edit'])->name('suratPemberitahuan.edit');
    Route::post('suratPemberitahuan/store', [SuratPemberitahuanController::class, 'store'])->name('suratPemberitahuan.store');
    Route::put('suratPemberitahuan/update', [SuratPemberitahuanController::class, 'update'])->name('suratPemberitahuan.update');
    Route::get('/suratPemberitahuan/destroy/{data}', [SuratPemberitahuanController::class, 'destroy'])->name('suratPemberitahuan.destroy');
    //end suratPemberitahuan

    // memoLapangan
    Route::get('memoLapangan', [MemoLapanganController::class, 'index'])->name('memoLapangan');
    Route::get('memoLapangan/create', [MemoLapanganController::class, 'create'])->name('memoLapangan.create');
    Route::get('memoLapangan/edit/{data}', [MemoLapanganController::class, 'edit'])->name('memoLapangan.edit');
    Route::post('memoLapangan/store', [MemoLapanganController::class, 'store'])->name('memoLapangan.store');
    Route::put('memoLapangan/update', [MemoLapanganController::class, 'update'])->name('memoLapangan.update');
    Route::get('/memoLapangan/destroy/{data}', [MemoLapanganController::class, 'destroy'])->name('memoLapangan.destroy');
    //end memoLapangan

    //download file
    Route::get('downloadfile/{file}', [MasterDokumenController::class, 'downloadfile'])->name('downloadfile');

    
});

Auth::routes();
