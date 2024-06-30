<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterDokumen extends Model
{
    use HasFactory;
    protected $table = 'master_dokumen';
    protected $primaryKey = 'id';

}
