<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMasterDokumenTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('master_dokumen', function (Blueprint $table) {
            $table->id();
            $table->string('type');
            $table->string('nama');
            $table->date('tanggal');
            $table->string('file');
            $table->integer('id_user_create');
            $table->integer('id_user_update')->nullable();
            $table->timestamps();
            
            // Foreign key constraints (assuming `users` table exists)
            // $table->foreign('id_user_create')->references('id')->on('users')->onDelete('cascade');
            // $table->foreign('id_user_update')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('master_dokumen');
    }
}
