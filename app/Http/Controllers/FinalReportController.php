<?php

namespace App\Http\Controllers;

use  PDF;
use Exception;
use App\Models\CompanyLogo;
use App\Models\FinalReport;
use App\Models\QuestionnaireSubmission;
use Illuminate\Http\Request;
use PhpParser\Node\Stmt\TryCatch;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Schema;
class FinalReportController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->input('search', '');
        $reports = FinalReport::leftJoin('accident_person_data', 'final_reports.ad_id', '=', 'accident_person_data.id')
            ->leftJoin('garage_data', 'final_reports.gd_id', '=', 'garage_data.id')
            ->leftJoin('driver_data', 'final_reports.dd_id', '=', 'driver_data.id')
            ->leftJoin('owner_data', 'final_reports.od_id', '=', 'owner_data.id')
            ->leftJoin('spot_data', 'final_reports.sd_id', '=', 'spot_data.id')
            ->leftJoin('case_assignments', 'final_reports.case_id', '=', 'case_assignments.id')
            ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
            ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
            ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')
            ->leftJoin('users as garage', 'case_assignments.executive_garage', '=', 'garage.id')
            ->leftJoin('users as spot', 'case_assignments.executive_spot', '=', 'spot.id')
            ->leftJoin('users as owner', 'case_assignments.executive_meeting', '=', 'owner.id')
            ->leftJoin('users as accident', 'case_assignments.executive_accident_person', '=', 'accident.id')
            ->when(!empty($search), function ($query) use ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('insurance_companies.name', 'like', '%' . $search . '%')
                        ->orWhere('insurance_customers.name', 'like', '%' . $search . '%')
                        ->orWhere('case_assignments.date', 'like', '%' . $search . '%')
                        ->orWhere('case_assignments.type', 'like', '%' . $search . '%');
                });
            })
            ->select(
                'insurance_companies.name as company_name',
                'insurance_customers.name as customer_name',
                'case_assignments.date as date',
                'case_assignments.type as type',
                'final_reports.id as report_id'
            )
            // ->orderBy('case_assignments.date', 'desc') 
            ->orderBy('case_assignments.id', 'desc') 
            ->paginate(10);

        return view('dashboard.final-report.index', ['reports' => $reports]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function createFinalPdfDownload(Request $request)
    {
        try {


            $reportId = $request->report_id;


            $finalReport = FinalReport::leftJoin('accident_person_data', 'final_reports.ad_id', '=', 'accident_person_data.id')
                            ->leftJoin('garage_data', 'final_reports.gd_id', '=', 'garage_data.id')
                            ->leftJoin('driver_data', 'final_reports.dd_id', '=', 'driver_data.id')
                            ->leftJoin('owner_data', 'final_reports.od_id', '=', 'owner_data.id')
                            ->leftJoin('spot_data', 'final_reports.sd_id', '=', 'spot_data.id')
                            ->leftJoin('case_assignments', 'final_reports.case_id', '=', 'case_assignments.id')
                            ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
                            ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
                            ->leftJoin('insurance_cases', 'insurance_cases.customer_id', '=', 'insurance_customers.id')
                            ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')
                            ->leftJoin('users as garage', 'case_assignments.executive_garage', '=', 'garage.id')
                            ->leftJoin('users as spot', 'case_assignments.executive_spot', '=', 'spot.id')
                            ->leftJoin('users as owner', 'case_assignments.executive_meeting', '=', 'owner.id')
                            ->leftJoin('users as accident', 'case_assignments.executive_accident_person', '=', 'accident.id')
                            ->where('final_reports.id', $reportId)
                            ->select('final_reports.*',
                            'final_reports.selected_images as final_images',
                 
                    // 'garage_data.garage_gate_entry as gate_entry',
                    // 'garage_data.created_at as gate_entry_date',
                    // 'garage_data.garage_job_card as job_card',
                    // 'garage_data.location as garage_location',
                    // 'garage_data.is_fitness_particular_collected as is_fitness_particular_collected',
                    // 'garage_data.is_permit_particular_collected as is_permit_particular_collected',
                    // 'garage_data.is_dl_particular_collected as is_dl_particular_collected',
                    // 'garage_data.is_any_motor_occurance as is_any_motor_occurance',
                    // 'garage_data.no_vehicle_involved_acident as no_vehicle_involved_acident',
                    // 'garage_data.damage_consist_with_accident as damage_consist_with_accident',
                    // 'garage_data.victim_occupant_or_pillion as victim_occupant_or_pillion',
                    // 'garage_data.victim_employee_insured as victim_employee_insured',
                    // 'garage_data.victim_owner_or_employee as victim_owner_or_employee',
                    // 'garage_data.victim_travel_on_load_body as victim_travel_on_load_body',
                    // 'garage_data.vehicle_involve_other_accident as vehicle_involve_other_accident',
                    // 'garage_data.gross_vehicle_weight as gross_vehicle_weight',
                    // 'garage_data.date_vehicle_reg as date_vehicle_reg',
                    // 'garage_data.vehicle_reg_validity as vehicle_reg_validity',
                    // 'garage_data.issuing_authority_vehicle as issuing_authority_vehicle',
                    // 'garage_data.fitness_validity_opposite_vehicle as fitness_validity_opposite_vehicle',
                    // 'garage_data.fitness_validity_vehicle as fitness_validity_vehicle',
                    // 'garage_data.permit_no_vehicle as permit_no_vehicle',
                    // 'garage_data.permit_no_opposit_vehicle as permit_no_opposit_vehicle',
                    // 'garage_data.issuing_authority__opposite_vehicle as issuing_authority__opposite_vehicle',
                    // 'garage_data.type_permit_vehicle as type_permit_vehicle',
                    // 'garage_data.type_permit_opposite_vehicle as type_permit_opposite_vehicle',
                    // 'garage_data.authorized_route_vehicle as authorized_route_vehicle',
                    // 'garage_data.authorized_route_opposit_vehicle as authorized_route_opposit_vehicle',
                    // 'garage_data.permit_validity_vehicle as permit_validity_vehicle',
                    // 'garage_data.permit_validity_opposite_vehicle as permit_validity_opposite_vehicle',
                    // 'garage_data.is_break_in',
                    // 'garage_data.break_in_ins_date',
                    // 'garage_data.odometer_readng_break_in',
                    // 'garage_data.is_any_discre_found_break_in',
                    // 'garage_data.is_accused_elgible_drive',
                    // 'garage_data.travel_from_to',
                    // 'garage_data.clue_aout_accident',
                    // 'garage_data.car_scrap_found_on_spot',
                    // 'garage_data.garage_name',
                    // 'garage_data.odometer_reading_service_hist',
                    // 'garage_data.tp_vehicle_details',
                    // 'garage_data.is_any_disc_in_garage_entry_job_crd',
                    // 'garage_data.investi_referal_reson_1',
                    // 'garage_data.referal_findings_1',
                    // 'garage_data.investi_referal_rason2',
                    // 'garage_data.referal_findings_2',


                    // 'driver_data.driver_name as driver_name',
                    // 'driver_data.vehical_type as vehicle_type',
                    // 'driver_data.rc_reg_date as driver_rc_date',
                    // 'driver_data.rc_exp_date as driver_rc_exp_date',
                    // 'driver_data.dl_exp_date as driver_lic_exp_date',
                    // 'driver_data.rider_version_accident as rider_version_accident',
                    // 'driver_data.dl_and_rto as dl_and_rto',
                    // 'driver_data.others as driver_others',
                    // 'driver_data.vehicle_authorized_drive',
                    // 'driver_data.location as driver_location',
                    // 'driver_data.seating_capacity',
                    // 'driver_data.opp_vehicle_insurer',
                    // 'driver_data.opp_vehicle_reg_no',
                    // 'driver_data.opp_vehicle_made_make',
                    // 'driver_data.opp_insured_name',
                    // 'driver_data.opp_insured_policy_no',
                    // 'driver_data.opp_party_insurance_start_date',
                    // 'driver_data.opp_party_insurance_end_date',
                    // 'driver_data.addres_opp_party',
                    // 'driver_data.opp_rc_transfered_to',
                    // 'driver_data.opp_rc_transfered_date',
                    // 'driver_data.owner_rc_transfered_to',
                    // 'driver_data.owner_rc_transfered_date',
                    // 'driver_data.opp_vehicle_eng_no',
                    // 'driver_data.opp_vehicle_chassis_no',
                    // 'driver_data.owner_permit_no',
                    // 'driver_data.opp_party_permit_no',
                    // 'driver_data.owner_authorized_state',
                    // 'driver_data.opp_vehicle_seating_capacity',
                    // 'driver_data.opp_party_authorized_state',
                    // 'driver_data.owner_permit_period_validity',
                    // 'driver_data.opp_party_permit_period_validity',
                    // 'driver_data.owner_permit_verified',
                    // 'driver_data.opp_party_permit_verified',
                    // 'driver_data.driver_age',
                    // 'driver_data.driver_dob',
                    // 'driver_data.badge_val_from',
                    // 'driver_data.badge_val_to',


                    // 'owner_data.location as owner_location',
                    // 'owner_data.insured_version_acc',
                    // 'owner_data.rc_owner_name',
                    // 'owner_data.vehicle_no',
                    // 'owner_data.made_make',
                    // 'owner_data.engine_no',
                    // 'owner_data.chass_no',
                    // 'owner_data.class_of_vehicle',
                    // 'owner_data.permit_details',
                    // 'owner_data.details_opp_vehicle as details_opp_vehicle',
                    // 'owner_data.owner_opp_vehicle as owner_opp_vehicle',
                    // 'owner_data.fitness_validity_from',
                    // 'owner_data.fitness_validity_to',
                    // 'owner_data.polution_validity_from',
                    // 'owner_data.polution_validity_to',
                    // 'owner_data.doa_in_policy',
                    // 'owner_data.policy_comper_tp_liability',
                    // 'owner_data.if_goodladen_details',
                    // 'owner_data.damage_goods_transport',
                    // 'owner_data.details_damage_vehicle',
                    // 'owner_data.insured_advocate',
                    // 'owner_data.accused_admited_offence',
                    // 'owner_data.type_license',
                    // 'owner_data.vehicle_auth_drive',
                    // 'owner_data.mismatch_vehicle_in_dl',
                    // 'owner_data.insured_advocate_num',
                    // 'owner_data.insured_occupation',
                    // 'owner_data.all_liability_covered as all_liability_covered',
                    // 'owner_data.is_close_proximity as is_close_proximity',
                    // 'owner_data.rc_owner_insurer_same as rc_owner_insurer_same',
                    // 'owner_data.victim_is_employee as victim_is_employee',
                    // 'owner_data.reg_valid_doa as reg_valid_doa',
                    // 'owner_data.fitness_valid_doa as fitness_valid_doa',
                    // 'owner_data.valid_permit_doa as valid_permit_doa',
                    // 'owner_data.any_violation_route_permit as any_violation_route_permit',
                    // 'owner_data.opp_party_insurer_name as opp_party_insurer_name',
                    // 'owner_data.opp_party_policy_no as opp_party_policy_no',
                    // 'owner_data.is_opp_party_liabile as is_opp_party_liabile',
                    // 'owner_data.opp_party_period_insurance as opp_party_period_insurance',
                    // 'owner_data.opp_part_class_vehicle as opp_part_class_vehicle',
                    // 'owner_data.opp_party_rc_owner as opp_party_rc_owner',
                    // 'owner_data.opp_engine_no as opp_engine_no',
                    // 'owner_data.opp_chassis_no as opp_chassis_no',
                    // 'owner_data.cc_vehicle as cc_vehicle',
                    // 'owner_data.opp_party_cc_vehicle as opp_party_cc_vehicle',
                    // 'owner_data.address_mobile_accused as address_mobile_accused',
                    // 'owner_data.accused_dl_vaild_doa as accused_dl_vaild_doa',
                    // 'owner_data.rel_accused_insured as rel_accused_insured',
                    // 'owner_data.opp_driver_dl_valid as opp_driver_dl_valid',
                    // 'owner_data.accused_accident_before as accused_accident_before',
                    // 'owner_data.dl_no_owner as dl_no_owner',
                    // 'owner_data.dl_no_opp_vehicle as dl_no_opp_vehicle',
                    // 'owner_data.opp_party_class_vehicle_auth_drive as opp_party_class_vehicle_auth_drive',
                    // 'owner_data.accused_first_issue_nt as accused_first_issue_nt',
                    // 'owner_data.opp_party_first_issue_nt as opp_party_first_issue_nt',
                    // 'owner_data.nt_validity__accused as nt_validity__accused',
                    // 'owner_data.nt_validity_opp_party as nt_validity_opp_party',
                    // 'owner_data.badge_no_accused as badge_no_accused',
                    // 'owner_data.badge_no_opp_party as badge_no_opp_party',
                    // 'owner_data.accused_tv_first_issue as accused_tv_first_issue',
                    // 'owner_data.opp_party_tv_first_issue as opp_party_tv_first_issue',
                    // 'owner_data.accused_transport_validity as accused_transport_validity',
                    // 'owner_data.opp_party_transport_validity as opp_party_transport_validity',
                    // 'owner_data.interact_no as interact_no',
                    // 'owner_data.accident_hapn_nat_hoilday as accident_hapn_nat_hoilday',
                    // 'owner_data.date_claim_intimated as date_claim_intimated',
                    // 'owner_data.reason_late_intimation as reason_late_intimation',
                    // 'owner_data.insured_profession as insured_profession',
                    // 'owner_data.is_neg_area_address as is_neg_area_address',
                    // 'owner_data.pan_no_owner as pan_no_owner',
                    // 'owner_data.aadhar_no_owner as aadhar_no_owner',
                    // 'owner_data.hyp_details as hyp_details',
                    // 'owner_data.vehicle_damages as vehicle_damages',
                    // 'owner_data.comercl_vehicle_details as comercl_vehicle_details',
                    // 'owner_data.material_loss_accidnt as material_loss_accidnt',
                    // 'owner_data.material_quantity as material_quantity',
                    // 'owner_data.is_load_recept_available as is_load_recept_available',
                    // 'owner_data.fitness_details as fitness_details',
                    // 'owner_data.area_covered as area_covered',
                    // 'owner_data.prev_insurer as prev_insurer',
                    // 'owner_data.prev_policy_no as prev_policy_no',
                    // 'owner_data.policy_detl as policy_detl',
                    // 'owner_data.any_clain_in_prev_policy as any_clain_in_prev_policy',
                    // 'owner_data.is_prev_claim_photo_available as is_prev_claim_photo_available',
                    // 'owner_data.social_status',


                    // 'spot_data.spot_address',
                    // 'spot_data.location as spot_location',
                    // 'spot_data.road_details',
                    // 'spot_data.investigation_date',
                    // 'spot_data.investigation_submission_date',
                    // 'spot_data.op_no',
                    // 'spot_data.advocate_name',
                    // 'spot_data.court',
                    // 'spot_data.case_title',
                    // 'spot_data.case_claim',
                    // 'spot_data.cause_loss',
                    // 'spot_data.od_claim',
                    // 'spot_data.investigation_bill_no',
                    // 'spot_data.investigation_report',
                    // 'spot_data.loss_minimization_sheet',
                    // 'spot_data.policy_copy',
                    // 'spot_data.driving_license_extract',
                    // 'spot_data.permit_copy',
                    // 'spot_data.fitness_certificate_copy',
                    // 'spot_data.rc_book',
                    // 'spot_data.insured_statement',
                    // 'spot_data.claimant_statement',
                    // 'spot_data.seizure_memo_copy',
                    // 'spot_data.arrest_memo_copy',
                    // 'spot_data.mvi_report',
                    // 'spot_data.age_proof',
                    // 'spot_data.income_proof',
                    // 'spot_data.occupation_proof',
                    // 'spot_data.family_photograph',
                    // 'spot_data.spot_panchnama_copy',
                    // 'spot_data.accident_site_map',
                    // 'spot_data.inquest_panchnama',
                    // 'spot_data.paper_cutting',
                    // 'spot_data.fir',
                    // 'spot_data.final_report_charge_sheet',
                    // 'spot_data.death_certificate',
                    // 'spot_data.post_mortem_report',
                    // 'spot_data.viscera_report',
                    // 'spot_data.od_status',
                    // 'spot_data.tp_vehicle_insurance_details',
                    // 'spot_data.tp_driving_license',
                    // 'spot_data.tp_insurer_confirmation',
                    // 'spot_data.notice_u_s_134c',


                    // 'accident_person_data.fir_vers_accdnt',
                    // 'accident_person_data.claiment_vers_aaccdnt',
                    // 'accident_person_data.chrgesheet_con as chargesheet_conclusion',
                    // 'accident_person_data.age_injured_person as age_injured_person',
                    // 'accident_person_data.profession_injured',
                    // 'accident_person_data.diff_in_rider_ver_injured',
                    // 'accident_person_data.name_address_hospital as name_address_hospital',
                    // 'accident_person_data.distance_from_site_hospital as distance_from_site_hospital',
                    // 'accident_person_data.details_big_hospital_near_site as details_big_hospital_near_site',
                    // 'accident_person_data.zebra_cross_on_site as zebra_cross',
                    // 'accident_person_data.injury_record_details as injury_record_details',
                    // 'accident_person_data.name_witness as name_witness',
                    // 'accident_person_data.name_informer as name_informer',
                    // 'accident_person_data.vehicle_no_fir',
                    // 'accident_person_data.name_accused as name_accused',
                    // 'accident_person_data.injured_name as injured_Person_name',
                    // 'accident_person_data.injured_phone as injured_phone',
                    // 'accident_person_data.injured_address as injured_address',
                    // 'accident_person_data.injured_pedstrian_or_traveller as pedstrian_or_traveller',
                    // 'accident_person_data.injured_hospital_report',
                    // 'accident_person_data.injured_admited_hospital_details as injured_admited_hospital_details',
                    // 'accident_person_data.gd_no as gd_no',
                    // 'accident_person_data.police_station as police_station',
                    // 'accident_person_data.gd_date as gd_date',
                    // 'accident_person_data.location as accident_location',
                    // 'accident_person_data.accident_date_time as accident_date_time',
                    // 'accident_person_data.accident_description as accident_description',
                    // 'accident_person_data.relation_insured_and_claiment',
                    // 'accident_person_data.no_occupants',
                    // 'accident_person_data.complnt_rel_injured',
                    // 'accident_person_data.descrition_accused',
                    // 'accident_person_data.accused_identifed',
                    // 'accident_person_data.district',
                    // 'accident_person_data.state',
                    // 'accident_person_data.fir_no',
                    // 'accident_person_data.section',
                    // 'accident_person_data.date_time_fir',
                    // 'accident_person_data.delay_in_fir',
                    // 'accident_person_data.gist_fir',
                    // 'accident_person_data.court_where_chargesheet_filled',
                    // 'accident_person_data.date_chargesheet',
                    // 'accident_person_data.section_chargesheet',
                    // 'accident_person_data.who_charged_with',
                    // 'accident_person_data.gist_chargesheet',
                    // 'accident_person_data.petty_case_charged',
                    // 'accident_person_data.status_criminal_case',
                    // 'accident_person_data.accident_genuine',
                    // 'accident_person_data.opnion_disablement',
                    // 'accident_person_data.opnion_injured',
                    // 'accident_person_data.accident_cause_more_vehicle',
                    // 'accident_person_data.opnion_dl_validity',
                    // 'accident_person_data.dl_extract_obtained',
                    // 'accident_person_data.injured_established_fir',
                    // 'accident_person_data.insured_vehicle_establ_fir',
                    // 'accident_person_data.comment_defence_evidence',
                    // 'accident_person_data.wound_certificate',
                    // 'accident_person_data.helment_details',
                    // 'accident_person_data.verification_medical_report',
                    // 'accident_person_data.discussion_family_neighbour',
                    // 'accident_person_data.role_injured',
                    // 'accident_person_data.discussion_injured',
                    // 'accident_person_data.discussion_employeer_injured',
                    // 'accident_person_data.discussion_rider',
                    // 'accident_person_data.discussion_financial',
                    // 'accident_person_data.fact_findings',
                    // 'accident_person_data.conclusion',
                    // 'accident_person_data.name_complainant',
                    // 'accident_person_data.name_address_hospital',
                    // 'accident_person_data.name_add_num_employeer',
                    // 'accident_person_data.edu_injured',
                    // 'accident_person_data.gap_sequencial_event',
                    // 'accident_person_data.date_time_hospital_addmission',
                    // 'accident_person_data.doc_name_and_first_aid',
                    // 'accident_person_data.record_found_first_aid_hospital',
                    // 'accident_person_data.fir_named_or_not',
                    // 'accident_person_data.absence_chargesheet',
                    // 'accident_person_data.damage_per_od_claim',
                    // 'accident_person_data.date_discharge',
                    // 'accident_person_data.period_absence_from_work',
                    // 'accident_person_data.permanent_disablity',
                    // 'accident_person_data.present_condition_injury',
                    // 'accident_person_data.amount_medical_expenceses',
                    // 'accident_person_data.status_rembur_med_expense_employeer',
                    // 'accident_person_data.other_information',
                    // 'accident_person_data.date_panachanama',
                    // 'accident_person_data.opnion_from_panchayath',
                    // 'accident_person_data.date_of_death_date_pm',
                    // 'accident_person_data.cause_death_per_pmr',
                    // 'accident_person_data.co_injured_name_address',
                    // 'accident_person_data.co_injured_income',
                    // 'accident_person_data.co_injured_age',
                    // 'accident_person_data.co_injured_occupation',
                    // 'accident_person_data.co_injured_relation_injured',
                    // 'accident_person_data.co_injured_depend_or_not',
                    // 'accident_person_data.hit_run_police_reach_conclusion',
                    // 'accident_person_data.gaps_police_investigation',
                    // 'accident_person_data.case_suspect_nexus',
                    // 'accident_person_data.tp_property_damage',
                    // 'accident_person_data.policy_details',
                    // 'accident_person_data.insured_vehicle_paper_valid_accident_time',
                    // 'accident_person_data.criminal_court_status_case',
                    // 'accident_person_data.case_diary_findings',
                    // 'accident_person_data.about_accident',
                    // 'accident_person_data.owner_verification',
                    // 'accident_person_data.rider_verification',
                    // 'accident_person_data.details_dl_validity',
                    // 'accident_person_data.tpv_details_dl_validity',
                    // 'accident_person_data.injured_marital_status',
                    // 'accident_person_data.co_injured_marital_status',
                    // 'accident_person_data.claim_no',
                    // 'accident_person_data.nature_of_claim',
                    // 'accident_person_data.concern_matters',
                    // 'accident_person_data.dist_from_police',
                    // 'accident_person_data.rel_informr_claimant',
                    // 'accident_person_data.address_different',
                    // 'accident_person_data.annual_incom_injured',
                    // 'accident_person_data.esi_coverage_details',
                    // 'accident_person_data.status_injures_decesed',
                    // 'accident_person_data.compass',
                    // 'accident_person_data.pension_details',
                    // 'accident_person_data.injured_death_on_spot',
                    // 'accident_person_data.pmr_no',
                    // 'accident_person_data.pmr_date',
                    // 'accident_person_data.hospital_name_pmr_carried',
                    // 'accident_person_data.injured_compromised',
                    // 'accident_person_data.defense_fit_compromize',
                    // 'accident_person_data.wound_certi_coment',
                    // 'accident_person_data.no_injured',
                    // 'accident_person_data.no_dead',
                    // 'accident_person_data.no_tppd',
                    // 'accident_person_data.comperhensive',
                    // 'accident_person_data.dob_injured',
                    // 'accident_person_data.aadhar_no_injured',
                    // 'accident_person_data.pan_no',
                    // 'accident_person_data.period_leave_avail',
                    // 'accident_person_data.source_income',
                    // 'accident_person_data.month_incom',
                    // 'accident_person_data.wound_certificate_short_disc',
                    // 'accident_person_data.injured_exami_date_on_woundcerti',
                    // 'accident_person_data.injury_place_on_wound_certi',
                    // 'accident_person_data.person_name_who_brought_injured',
                    // 'accident_person_data.hospitalised_from_date',
                    // 'accident_person_data.hospitalised_to_date',
                    // 'accident_person_data.ip_days',
                    // 'accident_person_data.verified_treament_records',
                    // 'accident_person_data.details_postmortam_report',
                    // 'accident_person_data.legal_heirs_name',
                    // 'accident_person_data.heirs_age',
                    // 'accident_person_data.heirs_rel_deseased',
                    // 'accident_person_data.marital_status_heirs',
                    // 'accident_person_data.heirs_residing_address',
                    // 'accident_person_data.heirs_occupation',
                    // 'accident_person_data.heirs_employer_address',
                    // 'accident_person_data.latitude_and_longitude as accident_cordinate',

                        'insurance_companies.name as insurance_com_name',
                        'insurance_companies.contact_person as insurance_com_contact_person',
                        'insurance_companies.email as insurance_com_email',
                        'insurance_companies.phone as insurance_com_phone',
                        'insurance_companies.address as insurance_com_address',
                        'insurance_companies.template',
                        'insurance_customers.name as customer_name',
                        'insurance_customers.father_name as customer_father_name',
                        'insurance_customers.phone as customer_phone',
                        'insurance_customers.emergency_contact_number as customer_emergancy_contact_no',
                        'insurance_customers.email as customer_email',
                        'insurance_customers.present_address as customer_present_address',
                        'insurance_customers.permanent_address as customer_premanent_address',
                        'insurance_customers.policy_no as customer_policy_no',
                        'insurance_customers.policy_start as customer_policy_start',
                        'insurance_customers.policy_end as customer_policy_end',
                        'insurance_customers.insurance_type as customer_insurance_type',
                        'insurance_customers.crime_number',
                        'insurance_customers.police_station',
                        'case_assignments.date as case_assign_date', 
                        'driver.name as driver_executive',
                        'garage.name as garage_executive',
                        'spot.name as spot_executive',
                        'owner.name as owner_executive',
                        'accident.name as accident_executive',
                        'insurance_cases.created_at as date_of_allotement',
                        'final_reports.created_at as date_of_submitted',
                )
                ->first();


                $questions      = DB::table('questions')->where('data_category','garage_data')->get();

                $questions_2    = DB::table('questions')->where('data_category','spot_data')->get();
                $questions_3    = DB::table('questions')->where('data_category','driver_data')->get();
                $questions_4    = DB::table('questions')->where('data_category','owner_data')->get();
                $questions_5    = DB::table('questions')->where('data_category','accident_person_data')->get();

    // Filter questions whose column_name exists in final_reports table
            $validQuestions = $questions->filter(function ($question) 
            {
            return Schema::hasColumn('final_reports', $question->column_name);
            });

            $validQuestions_2 = $questions_2->filter(function ($question2) 
            {
            return Schema::hasColumn('final_reports', $question2->column_name);
            });

             $validQuestions_3 = $questions_3->filter(function ($question3) 
            {
            return Schema::hasColumn('final_reports', $question3->column_name);
            });


            $validQuestions_4 = $questions_4->filter(function ($question4) 
            {
            return Schema::hasColumn('final_reports', $question4->column_name);
            });
           
            $validQuestions_5 = $questions_5->filter(function ($question5) 
            {
            return Schema::hasColumn('final_reports', $question5->column_name);
            });



            $templateNo = $finalReport->template;

            switch ($templateNo) {
                case 1:
                    $pdf = PDF::loadView('dashboard.pdf.pdf1', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 2:
                    $pdf = PDF::loadView('dashboard.pdf.pdf2', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 3:
                    $pdf = PDF::loadView('dashboard.pdf.pdf3', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 4:
                    $pdf = PDF::loadView('dashboard.pdf.pdf4', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 5:
                    $pdf = PDF::loadView('dashboard.pdf.pdf5', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 6:
                    $pdf = PDF::loadView('dashboard.pdf.pdf6', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 7:
                    $pdf = PDF::loadView('dashboard.pdf.pdf7', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                case 8:
                    $pdf = PDF::loadView('dashboard.pdf.pdf8', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
                    break;
                default:
                    // return response()->json(['error' => 'Invalid template number'], 400);
                    $pdf = PDF::loadView('dashboard.pdf.pdf', compact('finalReport','validQuestions','validQuestions_2','validQuestions_3','validQuestions_4','validQuestions_5'));
            }


            return response()->stream(function () use ($pdf) {
                echo $pdf->output();
            }, 200, [
                "Content-Type" => "application/pdf",
                "Content-Disposition" => "attachment; filename=insurance.pdf",
            ]);
        } 
        catch (Exception $e) {
            Log::error('Error finding in pdf: ' . $e->getMessage());
        }
    }


    // public function preview($reportId)
    // {
    //     $filePath = storage_path("app/reports/report_{$reportId}.pdf");

    //     if (!file_exists($filePath)) {
    //         abort(404, 'Report not found');
    //     }

    //     return response()->file($filePath, [
    //         'Content-Type' => 'application/pdf',
    //         'Content-Disposition' => 'inline; filename="report_'.$reportId.'.pdf"',
    //     ]);
    // }


    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }



public function testList(Request $request)
{
    $search = $request->input('search', '');

    $rawSubmissions = \App\Models\QuestionnaireSubmission::when(!empty($search), function ($query) use ($search) {
        $query->where('case_id', 'like', '%' . $search . '%')
              ->orWhere('full_data', 'like', '%' . $search . '%');
    })->orderBy('created_at', 'desc')->get();

    $flatWorks = [];

    foreach ($rawSubmissions as $submission) {
        $data = json_decode($submission->full_data, true);

        if (!empty($data['works']) && is_array($data['works'])) {
            foreach ($data['works'] as $work) {
                $flatWorks[] = [
                    'case_id' => $submission->case_id,
                    'work' => $work['work'] ?? '-',
                    'questionnaire' => $work['questionnaire'] ?? [],
                ];
            }
        }
    }

    // Paginate manually
    $page = $request->input('page', 1);
    $perPage = 10;
    $offset = ($page - 1) * $perPage;

    $paginatedWorks = new LengthAwarePaginator(
        array_slice($flatWorks, $offset, $perPage),
        count($flatWorks),
        $perPage,
        $page,
        ['path' => $request->url(), 'query' => $request->query()]
    );

    return view('dashboard.company.test', [
        'submissions' => $paginatedWorks,
        'search' => $search
    ]);
}

   


}
