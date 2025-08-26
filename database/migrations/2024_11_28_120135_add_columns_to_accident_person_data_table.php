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
            $table->string('fir_vers_accdnt')->nullable()->after('ration_card');
            $table->string('claiment_vers_aaccdnt')->nullable()->after('fir_vers_accdnt');
            $table->string('chrgesheet_con')->nullable()->after('claiment_vers_aaccdnt');
            $table->string('relation_insured_and_claiment')->nullable()->after('chrgesheet_con');
            $table->integer('age_injured_person')->nullable()->after('relation_insured_and_claiment');
            $table->string('profession_injured')->nullable()->after('age_injured_person');
            $table->string('diff_in_rider_ver_injured')->nullable()->after('profession_injured');
            $table->text('name_address_hospital')->nullable()->after('diff_in_rider_ver_injured');
            $table->string('distance_from_site_hospital')->nullable()->after('name_address_hospital');
            $table->text('details_big_hospital_near_site')->nullable()->after('distance_from_site_hospital');
            $table->boolean('zebra_cross_on_site')->nullable()->after('details_big_hospital_near_site');
            $table->text('injury_record_details')->nullable()->after('zebra_cross_on_site');
            $table->string('name_witness')->nullable()->after('injury_record_details');
            $table->string('name_informer')->nullable()->after('name_witness');
            $table->string('vehicle_no_fir')->nullable()->after('name_informer');
            $table->boolean('name_accused')->nullable()->after('vehicle_no_fir');
            $table->string('injured_name')->nullable()->after('name_accused');
            $table->string('injured_phone')->nullable()->after('injured_name');
            $table->text('injured_address')->nullable()->after('injured_phone');
            $table->string('injured_pedstrian_or_traveller')->nullable()->after('injured_address');
            $table->text('injured_hospital_report')->nullable()->after('injured_pedstrian_or_traveller');
            $table->text('injured_admited_hospital_details')->nullable()->after('injured_hospital_report');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn('fir_vers_accdnt');
            $table->dropColumn('claiment_vers_aaccdnt');
            $table->dropColumn('chrgesheet_con');
            $table->dropColumn('relation_insured_and_claiment');
            $table->dropColumn('age_injured_person');
            $table->dropColumn('profession_injured');
            $table->dropColumn('diff_in_rider_ver_injured');
            $table->dropColumn('name_address_hospital');
            $table->dropColumn('distance_from_site_hospital');
            $table->dropColumn('details_big_hospital_near_site');
            $table->dropColumn('zebra_cross_on_site');
            $table->dropColumn('injury_record_details');
            $table->dropColumn('name_witness');
            $table->dropColumn('name_informer');
            $table->dropColumn('vehicle_no_fir');
            $table->dropColumn('name_accused');
            $table->dropColumn('injured_name');
            $table->dropColumn('injured_phone');
            $table->dropColumn('injured_address');
            $table->dropColumn('injured_pedstrian_or_traveller');
            $table->dropColumn('injured_hospital_report');
            $table->dropColumn('injured_admited_hospital_details');
        });
    }
};
