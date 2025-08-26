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
            $table->json('garage_downloads')->nullable()->after('location');
            $table->integer('sp_case')->nullable()->after('garage_downloads');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('garage_data', function (Blueprint $table) {
            $table->dropColumn('garage_downloads');
            $table->dropColumn('sp_case');
        });
    }
};
