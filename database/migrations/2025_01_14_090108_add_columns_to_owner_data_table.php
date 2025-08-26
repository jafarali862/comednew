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
            $table->string('insured_advocate')->nullable()->after('details_damage_vehicle');
            $table->string('accused_admited_offence')->nullable()->after('insured_advocate');
            $table->string('type_license')->nullable()->after('accused_admited_offence');
            $table->string('vehicle_auth_drive')->nullable()->after('type_license');
            $table->string('mismatch_vehicle_in_dl')->nullable()->after('vehicle_auth_drive');
            $table->string('insured_advocate_num')->nullable()->after('mismatch_vehicle_in_dl');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('owner_data', function (Blueprint $table) {
            $table->dropColumn([ 'insured_advocate', 'accused_admited_offence','type_license','vehicle_auth_drive','mismatch_vehicle_in_dl','insured_advocate_num']);
        });
    }
};
