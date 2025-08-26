<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SpotData extends Model
{
    use HasFactory;

    protected $fillable = [
                'assign_work_id',
                'spot_address',
                'spot_images',
                'spot_voice', 
                'location', 
                'latitude_and_longitude',
                'executive_id',
                'investigation_date',
                'investigation_submission_date',
                'op_no',
                'advocate_name',
                'court',
                'case_title',
                'case_claim',
                'cause_loss',
                'od_claim',
                'road_details',
                'investigation_bill_no',
                'investigation_report',
                'loss_minimization_sheet',
                'policy_copy',
                'driving_license_extract',
                'permit_copy',
                'fitness_certificate_copy',
                'rc_book',
                'insured_statement',
                'claimant_statement',
                'seizure_memo_copy',
                'arrest_memo_copy',
                'mvi_report',
                'age_proof',
                'income_proof',
                'occupation_proof',
                'family_photograph',
                'spot_panchnama_copy',
                'accident_site_map',
                'inquest_panchnama',
                'paper_cutting',
                'fir',
                'final_report_charge_sheet',
                'death_certificate',
                'post_mortem_report',
                'viscera_report',
                'od_status',
                'tp_vehicle_insurance_details',
                'tp_driving_license',
                'tp_insurer_confirmation',
                'notice_u_s_134c',
    ];
}
