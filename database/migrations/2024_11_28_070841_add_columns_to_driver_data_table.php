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
            $table->string('rider_version_accident')->nullable()->after('assets_pic');
            $table->string('dl_and_rto')->nullable()->after('rider_version_accident');
            $table->string('others')->nullable()->after('dl_and_rto');
            $table->boolean('vehicle_authorized_drive')->nullable()->after('others'); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('driver_data', function (Blueprint $table) {
            $table->dropColumn('rider_version_accident');
            $table->dropColumn('dl_and_rto');
            $table->dropColumn('others');
            $table->dropColumn('vehicle_authorized_drive');
        });
    }
};
