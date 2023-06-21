<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckListItemDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'message',
        'dt_start',
        'dt_end',
        'check_list_id',
    ];
}