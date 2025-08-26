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
            $table->json('tow_vehical_report')->nullable()->after('garage_voice');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('garage_data', function (Blueprint $table) {
            $table->dropColumn('tow_vehical_report');
        });
    }
};
