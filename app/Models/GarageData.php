<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GarageData extends Model
{
    use HasFactory;

    protected $fillable = [
        'assign_work_id',
        'garage_gate_entry',
        'garage_job_card',
        'garage_gate_entry_images',
        'garage_job_card_images',
        'vehicle_images',
        'garage_voice',
        'location',
        'latitude_and_longitude',
        'executive_id',
        'tow_vehical_report',
        'is_fitness_particular_collected',
        'is_permit_particular_collected',
        'is_dl_particular_collected',
        'is_any_motor_occurance',
        'no_vehicle_involved_acident',
        'damage_consist_with_accident',
        'victim_occupant_or_pillion',
        'victim_employee_insured',
        'victim_owner_or_employee',
        'victim_travel_on_load_body',
        'vehicle_involve_other_accident',
        'gross_vehicle_weight',
        'date_vehicle_reg',
        'vehicle_reg_validity',
        'issuing_authority_vehicle',
        'fitness_validity_opposite_vehicle',
        'fitness_validity_vehicle',
        'permit_no_vehicle',
        'permit_no_opposit_vehicle',
        'issuing_authority__opposite_vehicle',
        'type_permit_vehicle',
        'type_permit_opposite_vehicle',
        'authorized_route_vehicle',
        'authorized_route_opposit_vehicle',
        'permit_validity_vehicle',
        'permit_validity_opposite_vehicle',
        'is_break_in',
        'break_in_ins_date',
        'odometer_readng_break_in',
        'is_any_discre_found_break_in',
        'is_accused_elgible_drive',
        'travel_from_to',
        'clue_aout_accident',
        'car_scrap_found_on_spot',
        'garage_name',
        'odometer_reading_service_hist',
        'tp_vehicle_details',
        'is_any_disc_in_garage_entry_job_crd',
        'investi_referal_reson_1',
        'referal_findings_1',
        'investi_referal_rason2',
        'referal_findings_2'
    ];
}
