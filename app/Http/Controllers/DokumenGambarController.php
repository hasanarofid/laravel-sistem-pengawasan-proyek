<?php

namespace App\Http\Controllers;

use App\Models\MasterDokumen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Crypt;

class DokumenGambarController extends Controller
{
    // index dokumenGambar
    public function __construct()
    {
        $this->middleware('auth');
    }

    // dokumenGambar
    public function index(){
        $laporan = MasterDokumen::where('type','dokumenGambar')->get();
        return view('masterDokumen.dokumenGambar.index', compact('laporan'));
    }

    // dokumenGambar add
    public function create(){
        return view('masterDokumen.dokumenGambar.create');
    }
    //dokumenGambar store
    public function store(Request $request){
        // dd(Auth::user()->id);
        $extension = $request->file('file')->extension();

        $docname = $request->nama . '_' . date('dmyHi') . '.' . $extension;

        $path = Storage::putFileAs('public/dokumen', $request->file('file'), $docname);
     
        $masterdokumen = new MasterDokumen();
        $masterdokumen->type = 'dokumenGambar';
        $masterdokumen->nama = $request->nama;
        $masterdokumen->tanggal = $request->tanggal;
        $masterdokumen->file = $docname;
        $masterdokumen->id_user_create = Auth::user()->id;
                $masterdokumen->save();

        Alert::success('success', ' Berhasil Input Data !');
        return redirect('dokumenGambar');
    }

    public function edit($data)
    {
        //
        $id = Crypt::decryptString($data);
        $laporan = MasterDokumen::find($id);
        

        return view('masterDokumen.dokumenGambar.edit', [
            'id' => $data,
            'laporan' => $laporan,
        ]);
    }

    //update time shedule
    public function update(Request $request)
    {
        $masterdokumen = MasterDokumen::findOrFail($request->id); // Correct method to fetch the document by id
    
        if($request->file){
            $extension = $request->file('file')->extension();
            $docname = $request->nama . '_' . date('dmyHi') . '.' . $extension;
            $path = Storage::putFileAs('public/dokumen', $request->file('file'), $docname);
            $masterdokumen->file = $docname;
        }
    
        $masterdokumen->type = 'dokumenGambar';
        $masterdokumen->nama = $request->nama;
        $masterdokumen->tanggal = $request->tanggal;
        $masterdokumen->id_user_update = Auth::user()->id;
        $masterdokumen->save();
    
        Alert::success('success', 'Berhasil Update Input Data!');
        return redirect('dokumenGambar');
    }
    // destroy timeshedule
    public function destroy($data)
    {
        $id = Crypt::decryptString($data);
        // dd($id);
        MasterDokumen::where('id', $id)->delete();
        // dd($pegawai);

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect(route('dokumenGambar'));
    }
}

