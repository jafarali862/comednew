<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->text('name_add_num_employeer')->nullable()->after('name_complainant');
            $table->string('edu_injured')->nullable()->after('name_add_num_employeer');
            $table->text('gap_sequencial_event')->nullable()->after('edu_injured');
            $table->string('date_time_hospital_addmission')->nullable()->after('gap_sequencial_event');
            $table->text('doc_name_and_first_aid')->nullable()->after('date_time_hospital_addmission');
            $table->text('record_found_first_aid_hospital')->nullable()->after('doc_name_and_first_aid');
            $table->string('fir_named_or_not')->nullable()->after('record_found_first_aid_hospital');
            $table->text('absence_chargesheet')->nullable()->after('fir_named_or_not');
            $table->text('damage_per_od_claim')->nullable()->after('absence_chargesheet');
            $table->string('date_discharge')->nullable()->after('damage_per_od_claim');
            $table->string('period_absence_from_work')->nullable()->after('date_discharge');
            $table->text('permanent_disablity')->nullable()->after('period_absence_from_work');
            $table->text('present_condition_injury')->nullable()->after('permanent_disablity');
            $table->text('amount_medical_expenceses')->nullable()->after('present_condition_injury');
            $table->text('status_rembur_med_expense_employeer')->nullable()->after('amount_medical_expenceses');
            $table->text('other_information')->nullable()->after('status_rembur_med_expense_employeer');
            $table->text('date_panachanama')->nullable()->after('other_information');
            $table->text('opnion_from_panchayath')->nullable()->after('date_panachanama');
            $table->string('date_of_death_date_pm')->nullable()->after('opnion_from_panchayath');
            $table->text('cause_death_per_pmr')->nullable()->after('date_of_death_date_pm');
            $table->text('co_injured_name_address')->nullable()->after('cause_death_per_pmr');
            $table->text('co_injured_income')->nullable()->after('co_injured_name_address');
            $table->text('co_injured_age')->nullable()->after('co_injured_income');
            $table->text('co_injured_occupation')->nullable()->after('co_injured_age');
            $table->text('co_injured_relation_injured')->nullable()->after('co_injured_occupation');
            $table->text('co_injured_depend_or_not')->nullable()->after('co_injured_relation_injured');
            $table->text('hit_run_police_reach_conclusion')->nullable()->after('co_injured_depend_or_not');
            $table->text('gaps_police_investigation')->nullable()->after('hit_run_police_reach_conclusion');
            $table->text('case_suspect_nexus')->nullable()->after('gaps_police_investigation');
            $table->text('tp_property_damage')->nullable()->after('case_suspect_nexus');
            $table->text('policy_details')->nullable()->after('tp_property_damage');
            $table->text('insured_vehicle_paper_valid_accident_time')->nullable()->after('policy_details');
            $table->text('criminal_court_status_case')->nullable()->after('insured_vehicle_paper_valid_accident_time');
            $table->text('case_diary_findings')->nullable()->after('criminal_court_status_case');
            $table->text('about_accident')->nullable()->after('case_diary_findings');
            $table->text('owner_verification')->nullable()->after('about_accident');
            $table->text('rider_verification')->nullable()->after('owner_verification');
            $table->text('details_dl_validity')->nullable()->after('rider_verification');
            $table->text('tpv_details_dl_validity')->nullable()->after('details_dl_validity');
            $table->string('claim_no')->nullable()->after('tpv_details_dl_validity');
            $table->string('injured_marital_status')->nullable()->after('claim_no');
            $table->string('co_injured_marital_status')->nullable()->after('injured_marital_status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn([
                'name_add_num_employeer',
                'edu_injured',
                'gap_sequencial_event',
                'date_time_hospital_addmission',
                'doc_name_and_first_aid',
                'record_found_first_aid_hospital',
                'fir_named_or_not',
                'absence_chargesheet',
                'damage_per_od_claim',
                'date_discharge',
                'period_absence_from_work',
                'permanent_disablity',
                'present_condition_injury',
                'amount_medical_expenceses',
                'status_rembur_med_expense_employeer',
                'other_information',
                'date_panachanama',
                'opnion_from_panchayath',
                'date_of_death_date_pm',
                'cause_death_per_pmr',
                'co_injured_name_address',
                'co_injured_income',
                'co_injured_age',
                'co_injured_occupation',
                'co_injured_relation_injured',
                'co_injured_depend_or_not',
                'hit_run_police_reach_conclusion',
                'gaps_police_investigation',
                'case_suspect_nexus',
                'tp_property_damage',
                'policy_details',
                'insured_vehicle_paper_valid_accident_time',
                'criminal_court_status_case',
                'case_diary_findings',
                'about_accident',
                'owner_verification',
                'rider_verification',
                'details_dl_validity',
                'tpv_details_dl_validity',
                'claim_no',
                'injured_marital_status',
                'co_injured_marital_status'
            ]);
        });
    }
};
