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
            $table->json('co_passenger_dl')->nullable()->after('driver_voice');
            $table->json('co_passenger_aadhar')->nullable()->after('co_passenger_dl');
            $table->string('vehical_type')->nullable()->after('co_passenger_aadhar');
            $table->json('vehicle_permit')->nullable()->after('vehical_type');
            $table->date('rc_reg_date')->nullable()->after('vehicle_permit');
            $table->date('rc_exp_date')->nullable()->after('rc_reg_date');
            $table->date('dl_exp_date')->nullable()->after('rc_exp_date');
            $table->json('ration_card')->nullable()->after('dl_exp_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('driver_data', function (Blueprint $table) {
            $table->dropColumn('co_passenger_dl');
            $table->dropColumn('co_passenger_aadhar');
            $table->dropColumn('vehical_type');
            $table->dropColumn('vehicle_permit');
            $table->dropColumn('rc_reg_date');
            $table->dropColumn('rc_exp_date');
            $table->dropColumn('dl_exp_date');
            $table->dropColumn('ration_card');
        });
    }
};
