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
            $table->string('insured_version_acc')->nullable()->after('latitude_and_longitude');
            $table->string('insured_occupation')->nullable()->after('insured_version_acc');
            $table->string('rc_owner_name')->nullable()->after('insured_occupation');
            $table->string('vehicle_no')->nullable()->after('rc_owner_name');
            $table->string('made_make')->nullable()->after('vehicle_no');
            $table->string('engine_no')->nullable()->after('made_make');
            $table->string('chass_no')->nullable()->after('engine_no');
            $table->string('class_of_vehicle')->nullable()->after('chass_no');
            $table->string('permit_details')->nullable()->after('class_of_vehicle');
            $table->string('details_opp_vehicle')->nullable()->after('permit_details');
            $table->string('owner_opp_vehicle')->nullable()->after('details_opp_vehicle');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('owner_data', function (Blueprint $table) {
            $table->dropColumn('insured_version_acc');
            $table->dropColumn('insured_occupation');
            $table->dropColumn('rc_owner_name');
            $table->dropColumn('vehicle_no');
            $table->dropColumn('made_make');
            $table->dropColumn('engine_no');
            $table->dropColumn('chass_no');
            $table->dropColumn('class_of_vehicle');
            $table->dropColumn('permit_details');
            $table->dropColumn('details_opp_vehicle');
            $table->dropColumn('owner_opp_vehicle');
        });
    }
};
