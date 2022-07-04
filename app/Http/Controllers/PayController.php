<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\DataMeteranUser;

class PayController extends Controller
{
    // $this->idopin();
    // $data=$this->idopin_history();
    // $data=$this->idopin_transaction('60150');
    public function bayar_tagihan(Request $request)
    {
        $id_tagihan = $request->id_tagihan;
        $nomor_meteran = $request->meteran;
        $id_user = $request->id_user;

        $data = [];
        $user = User::where('id', $id_user)->first();
        $tagihan = DataMeteranUser::where('id', $id_tagihan)->where('nomor_meteran', $nomor_meteran)->first();
        $fas = ['user' => $user, 'tagihan' => $tagihan];
        // dd($user,$tagihan);
        $JTP = 'Biaya Pembayaran dari tanggl Penetapan = ' . $tagihan->tgl_penetapan . ' hingga = ' . date('Y-m-d') . '.Dengan besaran perbandingan meteran sebesar ' . $tagihan->total_harus_dibayarkan . '.';
        $total_pembayaran = $tagihan->total_harus_dibayarkan;
        $data = $this->idopin($JTP, $total_pembayaran, $fas);
        return response()->json([
            'message' => 'Berhasil Ditampilkan',
            'data' => $data,
        ], 200);
    }

    public function nestedpay()
    {
        // dd($_GET);
        $data = $this->idopin_transaction($_GET['trx_id']);
        return response()->json([
            'message' => 'Berhasil Ditampilkan',
            'data' => $data,
            'nasted' => $_GET
        ], 200);
    }

    public function notpay()
    {
        // dd($_GET);
        if (empty($_GET['trx_id'])) {
            $data = 'Transaksi Gagal Ulangi pembayaran beberapa saat lagi ';
        } else {
            $data = $this->idopin_transaction($_GET['trx_id']);
        }
        return response()->json([
            'message' => 'Berhasil Ditampilkan',
            'data' => $data,
            'nasted' => $_GET
        ], 200);
    }

    public function newsTransaktion()
    {
        $data = $this->idopin_history();
        return response()->json([
            'message' => 'Berhasil Ditampilkan',
            'data' => $data,
        ], 200);
    }

    public function idopin($JTP, $total_pembayaran, $blass)
    {
        // dd($blass);
        $produk = [$JTP];
        $quantity = [1];
        $priceone = [$total_pembayaran];

        $va           = '0000001221723861'; //get on iPaymu dashboard
        $secret       = 'SANDBOXEF649FC8-F90F-4E29-9C47-B33167239B9A-20220326121000'; //get on iPaymu dashboard
        $url          = 'https://sandbox.ipaymu.com/api/v2/payment'; //url
        $method       = 'POST'; //method
        $body['product']    = $produk;
        $body['qty']        = $quantity;
        $body['price']      = $priceone;
        $body['buyerName']  = $blass['user']->name;
        $body['buyerEmail']  = $blass['user']->email;
        $body['buyerPhone']  = '081221723861';
        // $body['buyerEmail']  = $blass['user']->email;
        $body['returnUrl']  = url('pay/done?user_id=' . $blass['user']->id . '&meteran_id=' . $blass['tagihan']->id);
        $body['cancelUrl']  = url('pay/notyet?user_id=' . $blass['user']->id . '&meteran_id=' . $blass['tagihan']->id);
        $body['notifyUrl']  = url('struck?id=1');
        // dd($body);
        $jsonBody     = json_encode($body, JSON_UNESCAPED_SLASHES);
        $requestBody  = strtolower(hash('sha256', $jsonBody));
        $stringToSign = strtoupper($method) . ':' . $va . ':' . $requestBody . ':' . $secret;
        $signature    = hash_hmac('sha256', $stringToSign, $secret);
        $timestamp    = Date('YmdHis');
        $ch = curl_init($url);
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
            'va: ' . $va,
            'signature: ' . $signature,
            'timestamp: ' . $timestamp
        );

        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_POST, count($body));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonBody);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $err = curl_error($ch);
        $ret = curl_exec($ch);
        curl_close($ch);
        if ($err) {
            $data['error_response'] = $err;
        } else {
            $ret = json_decode($ret);
            if ($ret->Status == 200) {
                $data['success_response'] = $ret->Data;
            } else {
                $data['error_response'] = $ret;
            }
        }
        return $data;
    }

    public function idopin_history()
    {
        $data = [];
        $va           = '0000001221723861'; //get on iPaymu dashboard
        $secret       = 'SANDBOXEF649FC8-F90F-4E29-9C47-B33167239B9A-20220326121000'; //get on iPaymu dashboard
        $url          = 'https://sandbox.ipaymu.com/api/v2/history'; //url
        $method       = 'POST'; //method

        $body['account']  = $va;

        $jsonBody     = json_encode($body, JSON_UNESCAPED_SLASHES);
        $requestBody  = strtolower(hash('sha256', $jsonBody));
        $stringToSign = strtoupper($method) . ':' . $va . ':' . $requestBody . ':' . $secret;
        $signature    = hash_hmac('sha256', $stringToSign, $secret);
        $timestamp    = Date('YmdHis');
        $ch = curl_init($url);
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
            'va: ' . $va,
            'signature: ' . $signature,
            'timestamp: ' . $timestamp
        );

        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_POST, count($body));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonBody);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $err = curl_error($ch);
        $ret = curl_exec($ch);
        curl_close($ch);
        if ($err) {
            $data['error_response'] = $err;
        } else {
            $ret = json_decode($ret);
            if ($ret->Status == 200) {
                $data['success_response'] = $ret->Data->Transaction;
            } else {
                $data['error_response'] = $ret;
            }
        }

        return $data['success_response'];
    }

    public function idopin_balance()
    {
        $data = [];
        $va           = '0000001221723861'; //get on iPaymu dashboard
        $secret       = 'SANDBOXEF649FC8-F90F-4E29-9C47-B33167239B9A-20220326121000'; //get on iPaymu dashboard
        $url          = 'https://sandbox.ipaymu.com/api/v2/balance'; //url
        $method       = 'POST'; //method
        $body['account']    = $va;
        $jsonBody     = json_encode($body, JSON_UNESCAPED_SLASHES);
        $requestBody  = strtolower(hash('sha256', $jsonBody));
        $stringToSign = strtoupper($method) . ':' . $va . ':' . $requestBody . ':' . $secret;
        $signature    = hash_hmac('sha256', $stringToSign, $secret);
        $timestamp    = Date('YmdHis');
        $ch = curl_init($url);
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
            'va: ' . $va,
            'signature: ' . $signature,
            'timestamp: ' . $timestamp
        );

        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_POST, count($body));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonBody);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $err = curl_error($ch);
        $ret = curl_exec($ch);
        curl_close($ch);

        if ($err) {
            $data['error_response'] = $err;
        } else {
            $ret = json_decode($ret);
            if ($ret->Status == 200) {
                $data['success_response'] = $ret->Data;
            } else {
                $data['error_response'] = $ret;
            }
        }
        // dd($data);
        return $data;
    }

    public function idopin_transaction($trx_id)
    {
        $va           = '0000001221723861'; //get on iPaymu dashboard
        $secret       = 'SANDBOXEF649FC8-F90F-4E29-9C47-B33167239B9A-20220326121000'; //get on iPaymu dashboard
        $url          = 'https://sandbox.ipaymu.com/api/v2/transaction'; //url
        $method       = 'POST'; //method
        $body['transactionId'] = $trx_id;
        $jsonBody     = json_encode($body, JSON_UNESCAPED_SLASHES);
        $requestBody  = strtolower(hash('sha256', $jsonBody));
        $stringToSign = strtoupper($method) . ':' . $va . ':' . $requestBody . ':' . $secret;
        $signature    = hash_hmac('sha256', $stringToSign, $secret);
        $timestamp    = Date('YmdHis');
        $ch = curl_init($url);
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
            'va: ' . $va,
            'signature: ' . $signature,
            'timestamp: ' . $timestamp
        );

        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_POST, count($body));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonBody);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        $err = curl_error($ch);
        $ret = curl_exec($ch);
        curl_close($ch);
        if ($err) {
            $data['error_response'] = $err;
        } else {
            $ret = json_decode($ret);
            if ($ret->Status == 200) {
                $data['success_response'] = $ret->Data;
            } else {
                $data['error_response'] = $ret;
            }
        }
        return $data;
    }
}
