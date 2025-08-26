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
            $table->json('medical_report')->nullable()->after('accident_person_voice');
            $table->json('hospital_report')->nullable()->after('medical_report');
            $table->json('ration_card')->nullable()->after('hospital_report');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn('medical_report');
            $table->dropColumn('hospital_report');
            $table->dropColumn('ration_card');
        });
    }
};
