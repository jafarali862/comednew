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
            $table->integer('no_occupants')->nullable()->after('location');
            $table->string('complnt_rel_injured')->nullable()->after('no_occupants');
            $table->string('descrition_accused')->nullable()->after('complnt_rel_injured');
            $table->string('accused_identifed')->nullable()->after('descrition_accused');
            $table->string('district')->nullable()->after('accused_identifed');
            $table->string('state')->nullable()->after('district');
            $table->string('fir_no')->nullable()->after('state');
            $table->string('section')->nullable()->after('fir_no');
            $table->string('date_time_fir')->nullable()->after('section');
            $table->string('delay_in_fir')->nullable()->after('date_time_fir');
            $table->string('gist_fir')->nullable()->after('delay_in_fir');
            $table->string('court_where_chargesheet_filled')->nullable()->after('gist_fir');
            $table->string('date_chargesheet')->nullable()->after('court_where_chargesheet_filled');
            $table->string('section_chargesheet')->nullable()->after('date_chargesheet');
            $table->string('who_charged_with')->nullable()->after('section_chargesheet');
            $table->string('gist_chargesheet')->nullable()->after('who_charged_with');
            $table->string('petty_case_charged')->nullable()->after('gist_chargesheet');
            $table->string('status_criminal_case')->nullable()->after('petty_case_charged');
            $table->string('accident_genuine')->nullable()->after('status_criminal_case');
            $table->string('opnion_disablement')->nullable()->after('accident_genuine');
            $table->string('opnion_injured')->nullable()->after('opnion_disablement');
            $table->string('accident_cause_more_vehicle')->nullable()->after('opnion_injured');
            $table->string('opnion_dl_validity')->nullable()->after('opnion_disablement');
            $table->string('dl_extract_obtained')->nullable()->after('opnion_dl_validity');
            $table->string('injured_established_fir')->nullable()->after('dl_extract_obtained');
            $table->string('insured_vehicle_establ_fir')->nullable()->after('injured_established_fir');
            $table->string('comment_defence_evidence')->nullable()->after('insured_vehicle_establ_fir');
            $table->string('wound_certificate')->nullable()->after('comment_defence_evidence');
            $table->string('helment_details')->nullable()->after('wound_certificate');
            $table->string('verification_medical_report')->nullable()->after('helment_details');
            $table->string('discussion_family_neighbour')->nullable()->after('verification_medical_report');
            $table->string('role_injured')->nullable()->after('discussion_family_neighbour');
            $table->string('discussion_injured')->nullable()->after('role_injured');
            $table->string('discussion_employeer_injured')->nullable()->after('discussion_injured');
            $table->string('discussion_rider')->nullable()->after('discussion_employeer_injured');
            $table->string('discussion_financial')->nullable()->after('discussion_rider');
            $table->string('fact_findings')->nullable()->after('discussion_financial');
            $table->string('conclusion')->nullable()->after('fact_findings');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn('no_occupants');
            $table->dropColumn('complnt_rel_injured');
            $table->dropColumn('descrition_accused');
            $table->dropColumn('accused_identifed');
            $table->dropColumn('district');
            $table->dropColumn('state');
            $table->dropColumn('fir_no');
            $table->dropColumn('section');
            $table->dropColumn('date_time_fir');
            $table->dropColumn('delay_in_fir');
            $table->dropColumn('gist_fir');
            $table->dropColumn('court_where_chargesheet_filled');
            $table->dropColumn('date_chargesheet');
            $table->dropColumn('section_chargesheet');
            $table->dropColumn('who_charged_with');
            $table->dropColumn('gist_chargesheet');
            $table->dropColumn('petty_case_charged');
            $table->dropColumn('status_criminal_case');
            $table->dropColumn('accident_genuine');
            $table->dropColumn('opnion_disablement');
            $table->dropColumn('opnion_injured');
            $table->dropColumn('accident_cause_more_vehicle');
            $table->dropColumn('opnion_dl_validity');
            $table->dropColumn('dl_extract_obtained');
            $table->dropColumn('injured_established_fir');
            $table->dropColumn('insured_vehicle_establ_fir');
            $table->dropColumn('comment_defence_evidence');
            $table->dropColumn('wound_certificate');
            $table->dropColumn('helment_details');
            $table->dropColumn('verification_medical_report');
            $table->dropColumn('discussion_family_neighbour');
            $table->dropColumn('role_injured');
            $table->dropColumn('discussion_injured');
            $table->dropColumn('discussion_employeer_injured');
            $table->dropColumn('discussion_rider');
            $table->dropColumn('discussion_financial');
            $table->dropColumn('fact_findings');
            $table->dropColumn('conclusion');
        });
    }
};
