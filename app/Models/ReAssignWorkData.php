<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReAssignWorkData extends Model
{
    use HasFactory;

    protected $fillable = [
        'assign_work_id',
        'garage_gate_entry_images',
        'garage_job_card_images',
        'vehicle_images',
        'garage_voice',
        'driver_image',
        'driving_licence_images',
        'rc_images',
        'driver_aadhaar_card_images',
        'driver_voice',
        'spot_images',
        'spot_voice',
        'owner_written_statment_images',
        'owner_aadhaar_card_images',
        'owner_voice',
        'accident_person_images',
        'accident_person_aadhaar_card_images',
        'accident_person_written_statment_images',
        'accident_person_voice',
    ];
}
