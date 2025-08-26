<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssignWorkData extends Model
{
    use HasFactory;
    protected $fillable = [
        "case_id",
        "garage_gate_entry",
        "garage_gate_entry_images",
        "garage_job_card",
        "garage_job_card_images",
        "vehicle_images",
        "garage_voice",
        "garage_reassign_status",
        "garage_re_assign_count",
        "driver_image",
        "driver_name",
        "driving_licence_images",
        "rc_images",
        "driver_aadhaar_card_images",
        "driver_voice",
        "driver_reassign_status",
        "driver_re_assign_count",
        "spot_images",
        "spot_address",
        "spot_voice",
        "spot_reassign_status",
        "spot_re_assign_count",
        "owner_written_statment_images",
        "owner_aadhaar_card_images",
        "owner_voice",
        "owner_reassign_status",
        "owner_re_assign_count",
        "accident_person_images",
        "accident_person_aadhaar_card_images",
        "accident_person_written_statment_images",
        "accident_person_voice",
        "accident_person_reassign_status",
        "accident_person_re_assign_count",
    ];

    public function garageData()
    {
        return $this->hasMany(GarageData::class, 'assign_work_id');
    }

    public function driverData()
    {
        return $this->hasMany(DriverData::class, 'assign_work_id');
    }

    public function spotData()
    {
        return $this->hasMany(SpotData::class, 'assign_work_id');
    }

    public function ownerData()
    {
        return $this->hasMany(OwnerData::class, 'assign_work_id');
    }

    public function accidentPersonData()
    {
        return $this->hasMany(AccidentPersonData::class, 'assign_work_id');
    }
}
