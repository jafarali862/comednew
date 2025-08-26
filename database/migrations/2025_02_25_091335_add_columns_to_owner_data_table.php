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
        Schema::table('owner_data', function (Blueprint $table) {
            $table->string('all_liability_covered')->nullable()->after('insured_advocate_num');
            $table->boolean('is_close_proximity')->nullable()->after('all_liability_covered');
            $table->boolean('rc_owner_insurer_same')->nullable()->after('is_close_proximity');
            $table->boolean('victim_is_employee')->nullable()->after('rc_owner_insurer_same');
            $table->boolean('reg_valid_doa')->nullable()->after('victim_is_employee');
            $table->boolean('fitness_valid_doa')->nullable()->after('reg_valid_doa');
            $table->boolean('valid_permit_doa')->nullable()->after('fitness_valid_doa');
            $table->boolean('any_violation_route_permit')->nullable()->after('valid_permit_doa');
            $table->string('opp_party_insurer_name')->nullable()->after('any_violation_route_permit');
            $table->string('opp_party_policy_no')->nullable()->after('opp_party_insurer_name');
            $table->boolean('is_opp_party_liabile')->default(false)->after('opp_party_policy_no');
            $table->date('opp_party_period_insurance')->nullable()->after('is_opp_party_liabile');
            $table->string('opp_part_class_vehicle')->nullable()->after('opp_party_period_insurance');
            $table->string('opp_party_rc_owner')->nullable()->after('opp_part_class_vehicle');
            $table->string('opp_engine_no')->nullable()->after('opp_party_rc_owner');
            $table->string('opp_chassis_no')->nullable()->after('opp_engine_no');
            $table->integer('cc_vehicle')->nullable()->after('opp_chassis_no');
            $table->integer('opp_party_cc_vehicle')->nullable()->after('cc_vehicle');
            $table->string('address_mobile_accused')->nullable()->after('opp_party_cc_vehicle');
            $table->boolean('accused_dl_vaild_doa')->nullable()->after('address_mobile_accused');
            $table->text('rel_accused_insured')->nullable()->after('accused_dl_vaild_doa');
            $table->boolean('opp_driver_dl_valid')->nullable()->after('rel_accused_insured');
            $table->boolean('accused_accident_before')->nullable()->after('opp_driver_dl_valid');
            $table->string('dl_no_owner')->nullable()->after('accused_accident_before');
            $table->string('dl_no_opp_vehicle')->nullable()->after('dl_no_owner');
            $table->string('opp_party_class_vehicle_auth_drive')->nullable()->after('dl_no_opp_vehicle');
            $table->date('accused_first_issue_nt')->nullable()->after('opp_party_class_vehicle_auth_drive');
            $table->date('opp_party_first_issue_nt')->nullable()->after('accused_first_issue_nt');
            $table->date('nt_validity__accused')->nullable()->after('opp_party_first_issue_nt');
            $table->date('nt_validity_opp_party')->nullable()->after('nt_validity__accused');
            $table->string('badge_no_accused')->nullable()->after('nt_validity_opp_party');
            $table->string('badge_no_opp_party')->nullable()->after('badge_no_accused');
            $table->date('accused_tv_first_issue')->nullable()->after('badge_no_opp_party');
            $table->date('opp_party_tv_first_issue')->nullable()->after('accused_tv_first_issue');
            $table->date('accused_transport_validity')->nullable()->after('opp_party_tv_first_issue');
            $table->date('opp_party_transport_validity')->nullable()->after('accused_transport_validity');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('owner_data', function (Blueprint $table) {
            $table->dropColumn([
                'all_liability_covered',
                'is_close_proximity',
                'rc_owner_insurer_same',
                'victim_is_employee',
                'reg_valid_doa',
                'fitness_valid_doa',
                'valid_permit_doa',
                'any_violation_route_permit',
                'opp_party_insurer_name',
                'opp_party_policy_no',
                'is_opp_party_liabile',
                'opp_party_period_insurance',
                'opp_part_class_vehicle',
                'opp_party_rc_owner',
                'opp_engine_no',
                'opp_chassis_no',
                'cc_vehicle',
                'opp_party_cc_vehicle',
                'address_mobile_accused',
                'accused_dl_vaild_doa',
                'rel_accused_insured',
                'opp_driver_dl_valid',
                'accused_accident_before',
                'dl_no_owner',
                'dl_no_opp_vehicle',
                'opp_party_class_vehicle_auth_drive',
                'accused_first_issue_nt',
                'opp_party_first_issue_nt',
                'nt_validity__accused',
                'nt_validity_opp_party',
                'badge_no_accused',
                'badge_no_opp_party',
                'accused_tv_first_issue',
                'opp_party_tv_first_issue',
                'accused_transport_validity',
                'opp_party_transport_validity',
            ]);
        });
    }
};
