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
        Schema::table('driver_data', function (Blueprint $table) {
            $table->json('driver_downloads')->nullable()->after('others');
            $table->integer('sp_case')->nullable()->after('driver_downloads');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('driver_data', function (Blueprint $table) {
            $table->dropColumn('driver_downloads');
            $table->dropColumn('sp_case');
        });
    }
};
