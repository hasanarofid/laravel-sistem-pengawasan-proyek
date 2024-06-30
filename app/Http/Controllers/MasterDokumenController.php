<?php

namespace App\Http\Controllers;

use App\Models\MasterDokumen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Crypt;

class MasterDokumenController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function downloadfile($file)
    {
        $filePath = 'public/dokumen/' . $file;

        if (Storage::exists($filePath)) {
            return Storage::download($filePath);
        }

        return redirect()->back()->with('error', 'File not found.');
    }

    // timeShedule
    public function timeShedule(){
        $laporan = MasterDokumen::where('type','timeShedule')->get();
        return view('masterDokumen.timeShedule.index', compact('laporan'));
    }

    // timeShedule add
    public function timeSheduleCreate(){
        return view('masterDokumen.timeShedule.create');
    }
    //timeshedule store
    public function timeSheduleStore(Request $request){
        // dd(Auth::user()->id);
        $extension = $request->file('file')->extension();

        $docname = $request->nama . '_' . date('dmyHi') . '.' . $extension;

        $path = Storage::putFileAs('public/dokumen', $request->file('file'), $docname);
     
        $masterdokumen = new MasterDokumen();
        $masterdokumen->type = 'timeShedule';
        $masterdokumen->nama = $request->nama;
        $masterdokumen->tanggal = $request->tanggal;
        $masterdokumen->file = $docname;
        $masterdokumen->id_user_create = Auth::user()->id;
                $masterdokumen->save();

        Alert::success('success', ' Berhasil Input Data !');
        return redirect('timeShedule');
    }

    public function timeSheduleEdit($data)
    {
        //
        $id = Crypt::decryptString($data);
        $laporan = MasterDokumen::find($id);
        

        return view('masterDokumen.timeShedule.edit', [
            'id' => $data,
            'laporan' => $laporan,
        ]);
    }

    //update time shedule
    public function timeSheduleUpdate(Request $request)
    {
        $masterdokumen = MasterDokumen::findOrFail($request->id); // Correct method to fetch the document by id
    
        if($request->file){
            $extension = $request->file('file')->extension();
            $docname = $request->nama . '_' . date('dmyHi') . '.' . $extension;
            $path = Storage::putFileAs('public/dokumen', $request->file('file'), $docname);
            $masterdokumen->file = $docname;
        }
    
        $masterdokumen->type = 'timeShedule';
        $masterdokumen->nama = $request->nama;
        $masterdokumen->tanggal = $request->tanggal;
        $masterdokumen->id_user_update = Auth::user()->id;
        $masterdokumen->save();
    
        Alert::success('success', 'Berhasil Update Input Data!');
        return redirect('timeShedule');
    }
    // destroy timeshedule
    public function timeSheduledestroy($data)
    {
        $id = Crypt::decryptString($data);
        // dd($id);
        MasterDokumen::where('id', $id)->delete();
        // dd($pegawai);

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect(route('timeShedule'));
    }
}
