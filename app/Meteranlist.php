<?php

namespace App;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Meteranlist extends Model
{
    use HasFactory;
    protected $table = 'meteranlist';     

    protected $fillable = [
        'user_id',
        'alamat_meteran',
        'meteran_no',
    ];
}
