<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LaporanHarian extends Model
{
    use HasFactory;
    protected $table = 'laporan_harian_t';
    protected $primaryKey = 'id';
    protected $guarded = [];
    public $timestamps = false;
}
