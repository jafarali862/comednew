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
            $table->date('investigation_date')->after('location')->nullable();
            $table->date('investigation_submission_date')->after('investigation_date')->nullable();
            $table->string('op_no')->after('investigation_submission_date')->nullable();
            $table->string('advocate_name')->after('op_no')->nullable();
            $table->string('court')->after('advocate_name')->nullable();
            $table->string('case_title')->after('court')->nullable();
            $table->string('case_claim')->after('case_title')->nullable();
            $table->string('cause_loss')->after('case_claim')->nullable();
            $table->string('od_claim')->after('cause_loss')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('spot_data', function (Blueprint $table) {
            $table->dropColumn([
                'investigation_date',
                'investigation_submission_date',
                'op_no',
                'advocate_name',
                'court',
                'case_title',
                'case_claim',
                'cause_loss',
                'od_claim',
            ]);
        });
    }
};
