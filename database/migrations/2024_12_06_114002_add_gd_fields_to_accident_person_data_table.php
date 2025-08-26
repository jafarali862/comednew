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
            // Adding the new fields
            $table->string('gd_no')->nullable()->after('injured_admited_hospital_details');
            $table->string('police_station')->nullable()->after('gd_no');
            $table->date('gd_date')->nullable()->after('police_station');
            $table->json('gd_pdf')->nullable()->after('gd_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn(['gd_no', 'police_station', 'gd_date', 'gd_pdf']);
        });
    }
};
