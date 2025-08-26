<?php
namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\QuestionnaireSubmission; // your model
use Illuminate\Support\Str;

class InsertDummyQuestionnaireSubmissions extends Command
{
    protected $signature = 'dummy:insert-submissions {count=1000}';
    protected $description = 'Insert dummy questionnaire submissions with JSON data';

    public function handle()
    {

     $count = (int) $this->argument('count');
     $works = [];

    for ($i = 1; $i <= $count; $i++)
    {
        $works[] = [
            "work" => "driver",
            "case_work_id" => "driver" . \Illuminate\Support\Str::random(12),
            "questionnaire" => [
                "owner_permit_verified" => [
                    "name" => "owner_permit_verified",
                    "data" => rand(0, 1)
                ],
                "audiophoto_proof" => [
                    "name" => "audiophoto_proof",
                    "data" => "/path/to/audio_" . $i . ".aac"
                ],
                "driver_full_name" => [
                    "name" => "driver_full_name",
                    "data" => "DriverName" . $i
                ]
            ]
        ];
    }

    $finalData = [
        "id" => 123,
        "works" => $works
    ];

    \App\Models\QuestionnaireSubmission::create([
        'case_id' => 123,
        'full_data' => json_encode($finalData), 
    ]);

    $this->info("Inserted 1 row with $count works into questionnaire_submissions.");
    }


}
