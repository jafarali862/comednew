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
            $table->text('chrgesheet_con')->nullable()->change();
            $table->text('diff_in_rider_ver_injured')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->string('chrgesheet_con', 255)->change();
            $table->string('diff_in_rider_ver_injured', 255)->change();
        });
    }
};
