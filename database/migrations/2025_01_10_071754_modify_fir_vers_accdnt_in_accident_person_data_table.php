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
            $table->text('fir_vers_accdnt')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->string('fir_vers_accdnt', 255)->change();
        });
    }
};
