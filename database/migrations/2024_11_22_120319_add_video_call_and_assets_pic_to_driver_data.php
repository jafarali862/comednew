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
            $table->json('video_call')->nullable()->after('ration_card');  
            $table->json('assets_pic')->nullable()->after('video_call');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('driver_data', function (Blueprint $table) {
            $table->dropColumn('video_call');
            $table->dropColumn('assets_pic');
        });
    }
};
