<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FinalReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'ad_id', 'gd_id', 'dd_id', 'od_id', 'sd_id', 'case_id', 'selected_images',
    ];
}
