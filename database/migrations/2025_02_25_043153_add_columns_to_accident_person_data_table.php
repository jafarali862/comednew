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
            $table->text('wound_certi_coment')->nullable()->after('latitude_and_longitude');
            $table->integer('no_injured')->nullable()->after('wound_certi_coment');
            $table->integer('no_dead')->nullable()->after('no_injured');
            $table->integer('no_tppd')->nullable()->after('no_dead');
            $table->text('comperhensive')->nullable()->after('no_tppd');
            $table->date('dob_injured')->nullable()->after('comperhensive');
            $table->text('aadhar_no_injured')->nullable()->after('dob_injured');
            $table->text('pan_no')->nullable()->after('aadhar_no_injured');
            $table->integer('period_leave_avail')->nullable()->after('pan_no');
            $table->text('source_income')->nullable()->after('period_leave_avail');
            $table->decimal('month_incom')->nullable()->after('source_income');
            $table->text('wound_certificate_short_disc')->nullable()->after('month_incom');
            $table->date('injured_exami_date_on_woundcerti')->nullable()->after('wound_certificate_short_disc');
            $table->text('injury_place_on_wound_certi')->nullable()->after('injured_exami_date_on_woundcerti');
            $table->text('person_name_who_brought_injured')->nullable()->after('injury_place_on_wound_certi');
            $table->date('hospitalised_from_date')->nullable()->after('person_name_who_brought_injured');
            $table->date('hospitalised_to_date')->nullable()->after('hospitalised_from_date');
            $table->integer('ip_days')->nullable()->after('hospitalised_to_date');
            $table->text('verified_treament_records')->nullable()->after('ip_days');
            $table->text('details_postmortam_report')->nullable()->after('verified_treament_records');
            $table->text('legal_heirs_name')->nullable()->after('details_postmortam_report');
            $table->integer('heirs_age')->nullable()->after('legal_heirs_name');
            $table->text('heirs_rel_deseased')->nullable()->after('heirs_age');
            $table->text('marital_status_heirs')->nullable()->after('heirs_rel_deseased');
            $table->text('heirs_residing_address')->nullable()->after('marital_status_heirs');
            $table->text('heirs_occupation')->nullable()->after('heirs_residing_address');
            $table->text('heirs_employer_address')->nullable()->after('heirs_occupation');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn([
                'wound_certi_coment',
                'no_injured',
                'no_dead',
                'no_tppd',
                'comperhensive',
                'dob_injured',
                'aadhar_no_injured',
                'pan_no',
                'period_leave_avail',
                'source_income',
                'month_incom',
                'wound_certificate_short_disc',
                'injured_exami_date_on_woundcerti',
                'injury_place_on_wound_certi',
                'person_name_who_brought_injured',
                'hospitalised_from_date',
                'hospitalised_to_date',
                'ip_days',
                'verified_treament_records',
                'details_postmortam_report',
                'legal_heirs_name',
                'heirs_age',
                'heirs_rel_deseased',
                'marital_status_heirs',
                'heirs_residing_address',
                'heirs_occupation',
                'heirs_employer_address',
            ]);
        });
    }
};
