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
        Schema::create('re_assign_work_data', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('assign_work_id');
            $table->json('garage_gate_entry_images')->nullable();
            $table->json('garage_job_card_images')->nullable();
            $table->json('vehicle_images')->nullable();
            $table->json('garage_voice')->nullable();
            $table->json('driver_image')->nullable();
            $table->json('driving_licence_images')->nullable();
            $table->json('rc_images')->nullable();
            $table->json('driver_aadhaar_card_images')->nullable();
            $table->json('driver_voice')->nullable();
            $table->json('spot_images')->nullable();
            $table->json('spot_voice')->nullable();
            $table->json('owner_written_statment_images')->nullable();
            $table->json('owner_aadhaar_card_images')->nullable();
            $table->json('owner_voice')->nullable();
            $table->json('accident_person_images')->nullable();
            $table->json('accident_person_aadhaar_card_images')->nullable();
            $table->json('accident_person_written_statment_images')->nullable();
            $table->json('accident_person_voice')->nullable();
            $table->timestamps();

            $table->foreign('assign_work_id')->references('id')->on('assign_work_data');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('re_assign_work_data');
    }
};
