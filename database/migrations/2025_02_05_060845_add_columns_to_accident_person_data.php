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
            $table->text('nature_of_claim')->nullable()->after('claim_no');
            $table->text('concern_matters')->nullable()->after('nature_of_claim');
            $table->text('dist_from_police')->nullable()->after('concern_matters');
            $table->text('rel_informr_claimant')->nullable()->after('dist_from_police');
            $table->boolean('address_different')->default(false)->after('rel_informr_claimant');
            $table->decimal('annual_incom_injured', 15, 2)->nullable()->after('address_different');
            $table->text('esi_coverage_details')->nullable()->after('annual_incom_injured');
            $table->text('status_injures_decesed')->nullable()->after('esi_coverage_details');
            $table->text('compass')->nullable()->after('status_injures_decesed');
            $table->text('pension_details')->nullable()->after('compass');
            $table->boolean('injured_death_on_spot')->default(false)->after('pension_details');
            $table->text('pmr_no')->nullable()->after('injured_death_on_spot');
            $table->date('pmr_date')->nullable()->after('pmr_no');
            $table->text('hospital_name_pmr_carried')->nullable()->after('pmr_date');
            $table->boolean('injured_compromised')->default(false)->after('hospital_name_pmr_carried');
            $table->boolean('defense_fit_compromize')->default(false)->after('injured_compromised');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn([
                'nature_of_claim',
                'concern_matters',
                'dist_from_police',
                'rel_informr_claimant',
                'address_different',
                'annual_incom_injured',
                'esi_coverage_details',
                'status_injures_decesed',
                'compass',
                'pension_details',
                'injured_death_on_spot',
                'pmr_no',
                'pmr_date',
                'hospital_name_pmr_carried',
                'injured_compromised',
                'defense_fit_compromize',
            ]);
        });
    }
};
