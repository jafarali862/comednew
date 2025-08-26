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
            $table->text('conclusion')->nullable()->change();
            $table->text('fact_findings')->nullable()->change();
            $table->text('wound_certificate')->nullable()->change();
           
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('accident_person_data', function (Blueprint $table) {
            $table->string('conclusion', 255)->change();
            $table->string('fact_findings', 255)->change();
            $table->string('wound_certificate', 255)->change();
            
        });
    }
};
