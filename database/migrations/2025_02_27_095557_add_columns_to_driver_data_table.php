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
            $table->integer('driver_age')->nullable();
            $table->date('driver_dob')->nullable();
            $table->date('badge_val_from')->nullable();
            $table->date('badge_val_to')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('driver_data', function (Blueprint $table) {
            $table->dropColumn(['driver_age', 'driver_dob', 'badge_val_from', 'badge_val_to']);
        });
    }
};
