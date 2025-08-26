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
        Schema::table('driver_data', function (Blueprint $table) {
            $table->string('opp_vehicle_insurer')->nullable()->after('location');
            $table->string('opp_vehicle_reg_no')->nullable()->after('opp_vehicle_insurer');
            $table->string('opp_vehicle_made_make')->nullable()->after('opp_vehicle_reg_no');
            $table->string('opp_insured_name')->nullable()->after('opp_vehicle_made_make');
            $table->string('opp_insured_policy_no')->nullable()->after('opp_insured_name');
            $table->date('opp_party_insurance_start_date')->nullable()->after('opp_insured_policy_no');
            $table->date('opp_party_insurance_end_date')->nullable()->after('opp_party_insurance_start_date');
            $table->string('addres_opp_party')->nullable()->after('opp_party_insurance_end_date');
            $table->string('opp_rc_transfered_to')->nullable()->after('addres_opp_party');
            $table->date('opp_rc_transfered_date')->nullable()->after('opp_rc_transfered_to');
            $table->string('owner_rc_transfered_to')->nullable()->after('opp_rc_transfered_date');
            $table->date('owner_rc_transfered_date')->nullable()->after('owner_rc_transfered_to');
            $table->string('opp_vehicle_seating_capacity')->nullable()->after('owner_rc_transfered_date');
            $table->string('opp_vehicle_eng_no')->nullable()->after('opp_vehicle_seating_capacity');
            $table->string('opp_vehicle_chassis_no')->nullable()->after('opp_vehicle_eng_no');
            $table->string('owner_permit_no')->nullable()->after('opp_vehicle_chassis_no');
            $table->string('opp_party_permit_no')->nullable()->after('owner_permit_no');
            $table->string('owner_authorized_state')->nullable()->after('opp_party_permit_no');
            $table->string('opp_party_authorized_state')->nullable()->after('owner_authorized_state');
            $table->integer('owner_permit_period_validity')->nullable()->after('opp_party_authorized_state');
            $table->integer('opp_party_permit_period_validity')->nullable()->after('owner_permit_period_validity');
            $table->boolean('owner_permit_verified')->nullable()->after('opp_party_permit_period_validity');
            $table->boolean('opp_party_permit_verified')->nullable()->after('owner_permit_verified');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('driver_data', function (Blueprint $table) {
            $table->dropColumn([
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
            ]);
        });
    }
};
