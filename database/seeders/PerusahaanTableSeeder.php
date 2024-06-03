<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class PerusahaanTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('perusahaan')->insert([
            [
                'nama' => 'PT. PRABU CIPTA TEHNIK',
                'alamat' => 'Jl. Otto Iskandar Dinata No. 392 Graha LDA lt.2 Suite 06 RT. 001 RW. 001 Kel. Nyengseret Kec. Astana Anyar KotanBandung 40242 Nomor Induk Berusaha ',
                'kota' => 'Bandung',
                'no_telp' => '0220204122324',
                'email_public' => 'info@prabucipta.com',
                'path_logo' => 'path/to/logo.png',
                'email_private' => 'admin@prabucipta.com',
                'password' => Hash::make('secret'),
                'created_at' => now(),
                'updated_at' => now()
            ],
            // You can add more entries here
        ]);
    }
}
