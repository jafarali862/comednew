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
            $table->json('accident_downloads')->nullable()->after('gd_pdf');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->dropColumn('accident_downloads');
        });
    }
};
