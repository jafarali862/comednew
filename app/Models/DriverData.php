<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DriverData extends Model
{
    use HasFactory;

    protected $fillable = [
        'assign_work_id',
        'driver_name',
        'driver_image',
        'driving_licence_images',
        'rc_images',
        'driver_aadhaar_card_images',
        'driver_voice',
        'co_passenger_dl',
        'co_passenger_aadhar',
        'location',
        'latitude_and_longitude',
        'executive_id',
        'vehical_type',
        'vehicle_permit',
        'rc_reg_date',
        'rc_exp_date',
        'dl_exp_date',
        'ration_card',
        'video_call',
        'assets_pic',
        'rider_version_accident',
        'dl_and_rto',
        'others',
        'vehicle_authorized_drive',
        'seating_capacity',
        'opp_vehicle_insurer',
        'opp_vehicle_reg_no',
        'opp_vehicle_made_make',
        'opp_insured_name',
        'opp_insured_policy_no',
        'opp_party_insurance_start_date',
        'opp_party_insurance_end_date',
        'addres_opp_party',
        'opp_rc_transfered_to',
        'opp_rc_transfered_date',
        'owner_rc_transfered_to',
        'owner_rc_transfered_date',
        'opp_vehicle_seating_capacity',
        'opp_vehicle_eng_no',
        'opp_vehicle_chassis_no',
        'owner_permit_no',
        'opp_party_permit_no',
        'owner_authorized_state',
        'opp_party_authorized_state',
        'owner_permit_period_validity',
        'opp_party_permit_period_validity',
        'owner_permit_verified',
        'opp_party_permit_verified',
        'badge_val_from',
        'badge_val_to',
        'driver_age',
        'driver_dob'
    ];
}
