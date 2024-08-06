<?php

namespace App\Http\Controllers;

use App\Models\LaporanHarian;
use App\Models\Pegawai;
use App\Models\Perusahaan;
use Exception;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Storage;
use RealRashid\SweetAlert\Facades\Alert;
use PDF;
class LaporanHarianController extends Controller
{
    // function __construct()
    // {
    //     $this->middleware('permission:dashboard-admin', ['all']);
    // }

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $laporan = LaporanHarian::all();
        return view('admin.laporanharian.index', compact('laporan'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        return view('admin.laporanharian.create', []);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
       // Validate the incoming request data
    $request->validate([
        'txtTanggal' => 'required|date',
        'txtBarang' => 'required|string|max:255',
        'txtKegiatan' => 'required|string',
        'txtJumlah' => 'required|integer',
        'txtAlat' => 'required|string',
        'fileupload' => 'required|file|mimes:jpeg,png,jpg,gif,svg,pdf,doc,docx|max:5000',
    ]);

    // Get the file extension
    $extension = $request->file('fileupload')->extension();

    // Create a unique file name
    $docname = $request->txtBarang . '_' . date('dmyHi') . '.' . $extension;

    // Store the file in the specified path with the unique name
    $path = Storage::putFileAs('public/images', $request->file('fileupload'), $docname);

    // Generate a unique ID for the laporan
    $id = IdGenerator::generate([
        'table' => 'laporan_harian_t',
        'field' => 'id', // the name of the column where the ID is stored
        'length' => 8,
        'prefix' => date('ym'),
    ]);


    // Create the laporan record in the database
    $laporan = LaporanHarian::create([
        'id' => $id,
        'tanggal' => $request->txtTanggal,
        'barang' => $request->txtBarang,
        'kegiatan' => $request->txtKegiatan,
        'jumlah_pekerjaan' => $request->txtJumlah,
        'alat_digunakan' => $request->txtAlat,
        'id_user' => Auth::user()->id,
        'dokumentasi' => $docname,
        'keterangan' => $request->txtStatus,
    ]);

    // Return a success response or redirect
        Alert::success('success', ' Berhasil Input Data !');
        return redirect('laporanHarian');
    }

   
    public function edit($data)
    {
        //
        $id = Crypt::decryptString($data);
        $laporan = LaporanHarian::find($id);
        

        return view('admin.laporanharian.edit', [
            'id' => $data,
            'laporan' => $laporan,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $data)
    {
        //
        $id = Crypt::decryptString($data);
        if ($request->hasFile('dokumentasi')) {
            // var_dump($request->all());die;
            $extension = $request->file('dokumentasi')->extension();
            $imgname = $request->txtBarang . '_' . date('dmyHi') . '.' . $extension;
            $this->validate($request, [
                'tanggal' => 'required|date',
                'barang' => 'required|string|max:255',
                'kegiatan' => 'required|string',
                'jumlah_pekerjaan' => 'required|integer',
                'alat_digunakan' => 'required|string',
                'dokumentasi' => 'required|file|mimes:jpeg,png,jpg,gif,svg,pdf,doc,docx|max:5000',
            ]);



            $laporan = LaporanHarian::find($id);
            $path = Storage::putFileAs('public/images', $request->file('dokumentasi'), $imgname);

            $input = $request->all();
            $laporan = LaporanHarian::find($id);
            $laporan->update($input);

            Alert::success('success', ' Berhasil Update Data !');
            return redirect(route('laporanHarian.index'));
        } else {

            $this->validate($request, [
                'tanggal' => 'required|date',
                'barang' => 'required|string|max:255',
                'kegiatan' => 'required|string',
                'jumlah_pekerjaan' => 'required|integer',
                'alat_digunakan' => 'required|string',
                'dokumentasi' => 'required|file|mimes:jpeg,png,jpg,gif,svg,pdf,doc,docx|max:5000',
            ]);

            $input = $request->all();
            $laporan = LaporanHarian::find($id);
            $laporan->update($input);

            Alert::success('success', ' Berhasil Update Data !');
            return redirect(route('laporanHarian.index'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($data)
    {
        $id = Crypt::decryptString($data);
        LaporanHarian::where('id', $id)->delete();
        // dd($pegawai);

        Alert::success('success', ' Berhasil Hapus Data !');
        return redirect(route('laporanHarian.index'));
    }

    public function show($data)
    {
        
        //

        $id = Crypt::decryptString($data);
        $suratPeringatan = LaporanHarian::find($id);
      
        function numberToRomanRepresentation($number)
        {
            $map = array('M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1);
            $returnValue = '';
            while ($number > 0) {
                foreach ($map as $roman => $int) {
                    if ($number >= $int) {
                        $number -= $int;
                        $returnValue .= $roman;
                        break;
                    }
                }
            }
            return $returnValue;
        }


        $pegawai = Pegawai::find(Auth::user()->id);
        $barang = $suratPeringatan->barang;
        $kegiatan = $suratPeringatan->kegiatan;
        $jumlah_pekerjaan = $suratPeringatan->jumlah_pekerjaan;
        $alat_digunakan = $suratPeringatan->alat_digunakan;


         $bulan = numberToRomanRepresentation(date('m', strtotime($suratPeringatan->tanggal)));
        $tahun = date('Y', strtotime($suratPeringatan->tanggal));
        $lastIncreament = substr($suratPeringatan->id, -3);
        $id_surat = str_pad($lastIncreament, 3, 0, STR_PAD_LEFT);
        $perusahaan = Perusahaan::orderBy('id', 'desc')->first();

        $data = [
            'pegawai' => $pegawai,
            'barang' => $barang,
            'kegiatan' => $kegiatan,
            'jumlah_pekerjaan' => $jumlah_pekerjaan,
            'alat_digunakan' => $alat_digunakan,
            'tanggal' => date('Y-m-d', strtotime($suratPeringatan->tanggal)),
            'bulan' => $bulan,
            'tahun' => $tahun,
            'id_surat' => $id_surat,
            'perusahaan' => $perusahaan,

        ];

   
            $pdf = PDF::loadView('admin.laporanharian.surat_pdf', $data)->setPaper('a4', 'potrait');;
   

        return $pdf->stream('pdf_file.pdf', array('Attachment' => 0));
    }
}
