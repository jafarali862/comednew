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
        Schema::table('garage_data', function (Blueprint $table) {
            $table->boolean('is_break_in')->nullable();
            $table->date('break_in_ins_date')->nullable();
            $table->integer('odometer_readng_break_in')->nullable();
            $table->boolean('is_any_discre_found_break_in')->nullable();
            $table->boolean('is_accused_elgible_drive')->nullable();
            $table->string('travel_from_to')->nullable();
            $table->text('clue_aout_accident')->nullable();
            $table->boolean('car_scrap_found_on_spot')->nullable();
            $table->string('garage_name')->nullable();
            $table->text('odometer_reading_service_hist')->nullable();
            $table->text('tp_vehicle_details')->nullable();
            $table->boolean('is_any_disc_in_garage_entry_job_crd')->nullable();
            $table->text('investi_referal_reson_1')->nullable();
            $table->text('referal_findings_1')->nullable();
            $table->text('investi_referal_rason2')->nullable();
            $table->text('referal_findings_2')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('garage_data', function (Blueprint $table) {
            $table->dropColumn([
                'is_break_in',
                'break_in_ins_date',
                'odometer_readng_break_in',
                'is_any_discre_found_break_in',
                'is_accused_elgible_drive',
                'travel_from_to',
                'clue_aout_accident',
                'car_scrap_found_on_spot',
                'garage_name',
                'odometer_reading_service_hist',
                'tp_vehicle_details',
                'is_any_disc_in_garage_entry_job_crd',
                'investi_referal_reson_1',
                'referal_findings_1',
                'investi_referal_rason2',
                'referal_findings_2'
            ]);
        });
    }
};
