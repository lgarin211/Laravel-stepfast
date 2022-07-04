<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\DataMeteranUser;
use App\Meteranlist;

class Tagihan extends Controller
{
    public function index()
    {
        return response()->json([
            'message' => 'Request Tidak Tepat'
        ], 200);
    }

    public function call_tagihan(Request $request)
    {
        $userid=$request->user_id;
        $meteranku = Meteranlist::where('user_id', $userid)->orderByDesc('id');
        $fas=$meteranku->count();
        if (empty($fas)) {
            return response()->json([
                'message' => 'Akun Belum Memiliki Meteran, Daftarkan Meteran Anda'
            ], 201);
            die;
        }
        $meteranku = $meteranku->get();
        return response()->json([
            'message' => 'Data Meteran',
            'data' => $meteranku,
        ], 200);
    }

    public function tagihan(Request $request,$meteran)
    {
        // $meteran = 'a23123';
        $tagihanku = DataMeteranUser::where('nomor_meteran', $meteran)->orderByDesc('id');
        if (empty($tagihanku->count())) {
            return response()->json([
                'message' => 'Data NOMOR METERAN Tidak Ditemukan Meliki NOMOR METERAN tagihan'
            ], 201);
            die;
        }
        $tagihanku = $tagihanku->get();
        $mytagihan = [];
        $total_pembayaran = 0;
        foreach ($tagihanku as $key => $tagihan) {
            $datapin = $this->hitung_tagihan($tagihan->id);
            if ($datapin->tgl_pembayaran != null) {
                $mytagihan['lunas'][] = $datapin;
            } else {
                $mytagihan['tungkan'][] = $datapin;
                $total_pembayaran += $datapin->total_harus_dibayarkan;
            }
        }
        // dd($mytagihan);
        return response()->json([
            'message' => 'Data Tagihan',
            'data' => $mytagihan,
            'tunggakan' => $total_pembayaran
        ], 200);
    }

    public function hitung_tagihan($id)
    {
        $tagihan = DataMeteranUser::where('id', $id)->first();
        $seligih_meteran = $tagihan->meteran_akhir - $tagihan->meteran_awal;
        $penetapan = DB::table('rumus_meteran')->first();
        $tagihan->biyaya_denda = 0;
        $tagihan->biyaya_meteran = $seligih_meteran * $penetapan->harga_per_qubik;
        $tagihan->total_harus_dibayarkan = $tagihan->biyaya_meteran + $tagihan->biyaya_denda;

        DataMeteranUser::where('id', $tagihan->id)->update([
            'biyaya_meteran' => $tagihan->biyaya_meteran,
            'biyaya_denda' => $tagihan->biyaya_denda,
            'total_harus_dibayarkan' => $tagihan->total_harus_dibayarkan
        ]);

        return $tagihan;
    }
}
