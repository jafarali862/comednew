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
            $table->string('interact_no')->nullable()->after('opp_party_transport_validity');
            $table->string('accident_hapn_nat_hoilday')->nullable()->after('interact_no');
            $table->date('date_claim_intimated')->nullable()->after('accident_hapn_nat_hoilday');
            $table->text('reason_late_intimation')->nullable()->after('date_claim_intimated');
            $table->string('insured_profession')->nullable()->after('reason_late_intimation');
            $table->boolean('is_neg_area_address')->default(0)->after('insured_profession');
            $table->string('pan_no_owner')->nullable()->after('is_neg_area_address');
            $table->string('aadhar_no_owner')->nullable()->after('pan_no_owner');
            $table->text('hyp_details')->nullable()->after('aadhar_no_owner');
            $table->text('vehicle_damages')->nullable()->after('hyp_details');
            $table->text('comercl_vehicle_details')->nullable()->after('vehicle_damages');
            $table->text('material_loss_accidnt')->nullable()->after('comercl_vehicle_details');
            $table->decimal('material_quantity', 10, 2)->nullable()->after('material_loss_accidnt');
            $table->boolean('is_load_recept_available')->default(0)->after('material_quantity');
            $table->text('fitness_details')->nullable()->after('is_load_recept_available');
            $table->string('area_covered')->nullable()->after('fitness_details');
            $table->string('prev_insurer')->nullable()->after('area_covered');
            $table->string('prev_policy_no')->nullable()->after('prev_insurer');
            $table->text('policy_detl')->nullable()->after('prev_policy_no');
            $table->boolean('any_clain_in_prev_policy')->default(0)->after('policy_detl');
            $table->boolean('is_prev_claim_photo_available')->default(0)->after('any_clain_in_prev_policy');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('owner_data', function (Blueprint $table) {
            $table->dropColumn([
                'interact_no',
                'accident_hapn_nat_hoilday',
                'date_claim_intimated',
                'reason_late_intimation',
                'insured_profession',
                'is_neg_area_address',
                'pan_no_owner',
                'aadhar_no_owner',
                'hyp_details',
                'vehicle_damages',
                'comercl_vehicle_details',
                'material_loss_accidnt',
                'material_quantity',
                'is_load_recept_available',
                'fitness_details',
                'area_covered',
                'prev_insurer',
                'prev_policy_no',
                'policy_detl',
                'any_clain_in_prev_policy',
                'is_prev_claim_photo_available',
            ]);
        });
    }
};
