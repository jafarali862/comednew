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
        Schema::create('final_reports', function (Blueprint $table) {
            $table->id();  
            $table->unsignedBigInteger('ad_id')->nullable();  
            $table->unsignedBigInteger('gd_id')->nullable();  
            $table->unsignedBigInteger('dd_id')->nullable();  
            $table->unsignedBigInteger('od_id')->nullable();  
            $table->unsignedBigInteger('sd_id')->nullable(); 
            $table->unsignedBigInteger('case_id')->nullable(); 
            $table->json('selected_images')->nullable(); 
            $table->timestamps();

            $table->foreign('ad_id')->references('id')->on('accident_person_data')->onDelete('cascade');
            $table->foreign('gd_id')->references('id')->on('garage_data')->onDelete('cascade');
            $table->foreign('dd_id')->references('id')->on('driver_data')->onDelete('cascade');
            $table->foreign('od_id')->references('id')->on('owner_data')->onDelete('cascade');
            $table->foreign('sd_id')->references('id')->on('spot_data')->onDelete('cascade');
            $table->foreign('case_id')->references('id')->on('case_assignments')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('final_reports');
    }
};
