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
            $table->boolean('is_fitness_particular_collected')->default(false)->after('garage_downloads');
            $table->boolean('is_permit_particular_collected')->default(false)->after('is_fitness_particular_collected');
            $table->boolean('is_dl_particular_collected')->default(false)->after('is_permit_particular_collected');
            $table->boolean('is_any_motor_occurance')->default(false)->after('is_dl_particular_collected');
            $table->integer('no_vehicle_involved_acident')->nullable()->after('is_any_motor_occurance');
            $table->text('damage_consist_with_accident')->nullable()->after('no_vehicle_involved_acident');
            $table->string('victim_occupant_or_pillion')->nullable()->after('damage_consist_with_accident');
            $table->string('victim_employee_insured')->nullable()->after('victim_occupant_or_pillion');
            $table->string('victim_owner_or_employee')->nullable()->after('victim_employee_insured');
            $table->string('victim_travel_on_load_body')->nullable()->after('victim_owner_or_employee');
            $table->boolean('vehicle_involve_other_accident')->default(false)->after('victim_travel_on_load_body');
            $table->decimal('gross_vehicle_weight', 10, 2)->nullable()->after('vehicle_involve_other_accident');
            $table->date('date_vehicle_reg')->nullable()->after('gross_vehicle_weight');
            $table->date('vehicle_reg_validity')->nullable()->after('date_vehicle_reg');
            $table->string('issuing_authority_vehicle', 255)->nullable()->after('vehicle_reg_validity');
            $table->date('fitness_validity_opposite_vehicle')->nullable()->after('issuing_authority_vehicle');
            $table->date('fitness_validity_vehicle')->nullable()->after('fitness_validity_opposite_vehicle');
            $table->string('permit_no_vehicle', 255)->nullable()->after('fitness_validity_vehicle');
            $table->string('permit_no_opposit_vehicle', 255)->nullable()->after('permit_no_vehicle');
            $table->string('issuing_authority__opposite_vehicle', 255)->nullable()->after('permit_no_opposit_vehicle');
            $table->string('type_permit_vehicle', 255)->nullable()->after('issuing_authority__opposite_vehicle');
            $table->string('type_permit_opposite_vehicle', 255)->nullable()->after('type_permit_vehicle');
            $table->string('authorized_route_vehicle', 255)->nullable()->after('type_permit_opposite_vehicle');
            $table->string('authorized_route_opposit_vehicle', 255)->nullable()->after('authorized_route_vehicle');
            $table->date('permit_validity_vehicle')->nullable()->after('authorized_route_opposit_vehicle');
            $table->date('permit_validity_opposite_vehicle')->nullable()->after('permit_validity_vehicle');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('garage_data', function (Blueprint $table) {
            $table->dropColumn([
                'is_fitness_particular_collected',
                'is_permit_particular_collected',
                'is_dl_particular_collected',
                'is_any_motor_occurance',
                'no_vehicle_involved_acident',
                'damage_consist_with_accident',
                'victim_occupant_or_pillion',
                'victim_employee_insured',
                'victim_owner_or_employee',
                'victim_travel_on_load_body',
                'vehicle_involve_other_accident',
                'gross_vehicle_weight',
                'date_vehicle_reg',
                'vehicle_reg_validity',
                'issuing_authority_vehicle',
                'fitness_validity_opposite_vehicle',
                'fitness_validity_vehicle',
                'permit_no_vehicle',
                'permit_no_opposit_vehicle',
                'issuing_authority__opposite_vehicle',
                'type_permit_vehicle',
                'type_permit_opposite_vehicle',
                'authorized_route_vehicle',
                'authorized_route_opposit_vehicle',
                'permit_validity_vehicle',
                'permit_validity_opposite_vehicle'
            ]);
        });
    }
};
