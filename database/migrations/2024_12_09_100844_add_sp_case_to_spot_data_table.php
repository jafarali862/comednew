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
        Schema::table('spot_data', function (Blueprint $table) {
            $table->json('spot_downloads')->nullable()->after('location');
            $table->integer('sp_case')->nullable()->after('spot_downloads');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('spot_data', function (Blueprint $table) {
            $table->dropColumn('spot_downloads');
            $table->dropColumn('sp_case');
        });
    }
};
