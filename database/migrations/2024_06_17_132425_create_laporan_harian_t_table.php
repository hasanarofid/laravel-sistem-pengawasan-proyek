<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLaporanHarianTTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('laporan_harian_t', function (Blueprint $table) {
            $table->id();
            $table->date('tanggal'); // Date of the report
            $table->string('barang'); // Activity description
            $table->string('kegiatan'); // Activity description
            $table->string('dokumentasi'); // Activity description
            $table->string('jumlah_pekerjaan'); // Activity description
            $table->string('alat_digunakan'); // Activity description
            $table->integer('id_user');
            $table->text('keterangan')->nullable(); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('laporan_harian_t');
    }
}
