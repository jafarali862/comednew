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
        Schema::table('spot_data', function (Blueprint $table) {
            $table->string('investigation_bill_no')->nullable()->after('sp_case');
            $table->string('investigation_report')->nullable()->after('investigation_bill_no');
            $table->string('loss_minimization_sheet')->nullable()->after('investigation_report');
            $table->string('policy_copy')->nullable()->after('loss_minimization_sheet');
            $table->string('driving_license_extract')->nullable()->after('policy_copy');
            $table->string('permit_copy')->nullable()->after('driving_license_extract');
            $table->string('fitness_certificate_copy')->nullable()->after('permit_copy');
            $table->string('rc_book')->nullable()->after('fitness_certificate_copy');
            $table->string('insured_statement')->nullable()->after('rc_book');
            $table->string('claimant_statement')->nullable()->after('insured_statement');
            $table->string('seizure_memo_copy')->nullable()->after('claimant_statement');
            $table->string('arrest_memo_copy')->nullable()->after('seizure_memo_copy');
            $table->string('mvi_report')->nullable()->after('arrest_memo_copy');
            $table->string('age_proof')->nullable()->after('mvi_report');
            $table->string('income_proof')->nullable()->after('age_proof');
            $table->string('occupation_proof')->nullable()->after('income_proof');
            $table->string('family_photograph')->nullable()->after('occupation_proof');
            $table->string('spot_panchnama_copy')->nullable()->after('family_photograph');
            $table->string('accident_site_map')->nullable()->after('spot_panchnama_copy');
            $table->string('inquest_panchnama')->nullable()->after('accident_site_map');
            $table->string('paper_cutting')->nullable()->after('inquest_panchnama');
            $table->string('fir')->nullable()->after('paper_cutting');
            $table->string('final_report_charge_sheet')->nullable()->after('fir');
            $table->string('death_certificate')->nullable()->after('final_report_charge_sheet');
            $table->string('post_mortem_report')->nullable()->after('death_certificate');
            $table->string('viscera_report')->nullable()->after('post_mortem_report');
            $table->string('od_status')->nullable()->after('viscera_report');
            $table->string('tp_vehicle_insurance_details')->nullable()->after('od_status');
            $table->string('tp_driving_license')->nullable()->after('tp_vehicle_insurance_details');
            $table->string('tp_insurer_confirmation')->nullable()->after('tp_driving_license');
            $table->string('notice_u_s_134c')->nullable()->after('tp_insurer_confirmation');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('spot_data', function (Blueprint $table) {
            $table->dropColumn([
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
            ]);
        });
    }
};
