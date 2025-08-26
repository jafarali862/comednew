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
            $table->json('ration_card')->nullable()->after('owner_voice');
            $table->json('driving_lic')->nullable()->after('ration_card');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('owner_data', function (Blueprint $table) {
            $table->dropColumn(['ration_card', 'driving_lic']);
        });
    }
};
