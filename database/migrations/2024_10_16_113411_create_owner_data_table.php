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
        Schema::create('owner_data', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('assign_work_id');
            $table->json('owner_written_statment_images')->nullable();
            $table->json('owner_aadhaar_card_images')->nullable();
            $table->json('owner_voice')->nullable();
            $table->string('location')->nullable();
            $table->string('latitude_and_longitude')->nullable();
            $table->unsignedBigInteger('executive_id')->nullable();
            $table->timestamps();

            $table->foreign('assign_work_id')->references('id')->on('assign_work_data');
            $table->foreign('executive_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('owner_data');
    }
};
