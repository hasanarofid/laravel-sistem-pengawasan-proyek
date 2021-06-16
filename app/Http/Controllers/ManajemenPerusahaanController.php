<?php

namespace App\Http\Controllers;

use App\Models\Perusahaan;
use Brotzka\DotenvEditor\DotenvEditor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Storage;
use RealRashid\SweetAlert\Facades\Alert;

class ManajemenPerusahaanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //'
        $perusahaan = Perusahaan::orderBy('id')->first();

        return view('admin.perusahaan.edit', [
            'perusahaan' => $perusahaan,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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

        $this->validate($request, [
            'nama' => 'required',
            'alamat' => 'required',
            'kota' => 'required',
            'no_telp' => 'required',
            'email' => 'required',
            'password' => 'required',
            'path_logo' => 'required|mimes:jpeg,png,jpg,gif,svg|file|max:5000'
        ]);

        $extension = $request->file('path_logo')->extension();
        $imgname = 'logo_' . date('dmyHi') . '.' . $extension;
        $path = Storage::putFileAs('public/images', $request->file('path_logo'), $imgname);
        $env = new DotenvEditor();

        $env->changeEnv([
            'MAIL_USERNAME'   => $request->email,
            'MAIL_PASSWORD'   => $request->password,
        ]);

        $perusahaan = Perusahaan::create([
            'nama' => $request->nama,
            'alamat' => $request->alamat,
            'kota' => $request->kota,
            'no_telp' => $request->no_telp,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'path_logo' => $imgname,
        ]);


        Alert::success('success', ' Berhasil Input Data Perusahaan !');
        return redirect('superAdmin');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        // dd('here');
        $id = Crypt::decryptString($data);

        $env = new DotenvEditor();


        if ($request->hasFile('path_logo')) {

            $perusahaan = Perusahaan::find($id);
            $extension = $request->file('path_logo')->extension();
            $imgname = 'logo_' . date('dmyHi') . '.' . $extension;

            // dd($request->logo_lama);
            $path = Storage::putFileAs('public/images', $request->file('path_logo'), $imgname);
            $delete = Storage::delete('public/images/' . $request->logo_lama);


            if ($request->password === null) {
                $perusahaan->nama = $request->nama;
                $perusahaan->alamat = $request->alamat;
                $perusahaan->kota = $request->kota;
                $perusahaan->no_telp = $request->no_telp;
                $perusahaan->path_logo = $imgname;
                $perusahaan->update();
            } else {
                $perusahaan->nama = $request->nama;
                $perusahaan->email = $request->email;
                $perusahaan->alamat = $request->alamat;
                $perusahaan->kota = $request->kota;
                $perusahaan->no_telp = $request->no_telp;
                $perusahaan->password = bcrypt($request->password);
                $perusahaan->path_logo = $imgname;
                $perusahaan->update();

                $env->changeEnv([
                    'MAIL_USERNAME'   => $request->email,
                    'MAIL_PASSWORD'   => $request->password,
                ]);
            }

            Alert::success('success', ' Berhasil Update Informasi Perusahaan !');
            return redirect(route('perusahaan.index'));
        } else {
            $perusahaan = Perusahaan::find($id);

            if ($request->password === null) {
                $perusahaan->nama = $request->nama;
                $perusahaan->alamat = $request->alamat;
                $perusahaan->kota = $request->kota;
                $perusahaan->no_telp = $request->no_telp;
                $perusahaan->save();
            } else {
                $perusahaan->nama = $request->nama;
                $perusahaan->email = $request->email;
                $perusahaan->alamat = $request->alamat;
                $perusahaan->kota = $request->kota;
                $perusahaan->no_telp = $request->no_telp;
                $perusahaan->password = bcrypt($request->password);
                $perusahaan->save();

                $env->changeEnv([
                    'MAIL_USERNAME'   => $request->email,
                    'MAIL_PASSWORD'   => $request->password,
                ]);
            }

            Alert::success('success', ' Berhasil Update Informasi Perusahaan !');
            return redirect(route('perusahaan.index'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
