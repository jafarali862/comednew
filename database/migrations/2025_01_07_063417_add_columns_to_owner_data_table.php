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
            $table->date('fitness_validity_from')->nullable()->after('owner_opp_vehicle');
            $table->date('fitness_validity_to')->nullable()->after('fitness_validity_from');
            $table->date('polution_validity_from')->nullable()->after('fitness_validity_to');
            $table->date('polution_validity_to')->nullable()->after('polution_validity_from');
            $table->string('doa_in_policy')->nullable()->after('polution_validity_to');
            $table->string('policy_comper_tp_liability')->nullable()->after('doa_in_policy');
            $table->string('if_goodladen_details')->nullable()->after('policy_comper_tp_liability');
            $table->string('damage_goods_transport')->nullable()->after('if_goodladen_details');
            $table->string('details_damage_vehicle')->nullable()->after('damage_goods_transport');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('owner_data', function (Blueprint $table) {
            $table->dropColumn([
                'fitness_validity_from',
                'fitness_validity_to',
                'polution_validity_from',
                'polution_validity_to',
                'doa_in_policy',
                'policy_comper_tp_liability',
                'if_goodladen_details',
                'damage_goods_transport',
                'details_damage_vehicle'
           ]);
        });
    }
};
