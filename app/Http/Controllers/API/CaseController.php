<?php

namespace App\Http\Controllers\API;

use Carbon\Carbon;
use App\Models\SpotData;
use App\Models\OwnerData;
use App\Models\DriverData;
use App\Models\QuestionnaireSubmission;
use App\Models\GarageData;
use App\Models\InsuranceCompany;
use App\Models\InsuranceCase;
use Illuminate\Http\Request;
use App\Models\AssignWorkData;
use App\Models\ReAssignWorkData;
use App\Models\AccidentPersonData;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;


class CaseController extends Controller
{
    public function allCaseList(Request $request)
    {
        // $id = Auth::user()->id;

     
        // $cases = DB::table('case_assignments')
        //     ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
        //     ->leftJoin('assign_work_data', 'case_assignments.id', '=', 'assign_work_data.case_id')
        //     ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
        //     ->leftJoin('insurance_cases', 'insurance_customers.id', '=', 'insurance_cases.customer_id')
        //     ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')
        //     ->where(function ($query) use ($id) {
        //         $query->where('executive_driver', $id)
        //             ->orWhere('executive_garage', $id)
        //             ->orWhere('executive_spot', $id)
        //             ->orWhere('executive_meeting', $id)
        //             ->orWhere('executive_accident_person', $id);
        //     })
        //     ->select(
        //         'case_assignments.id',
        //         'case_assignments.date',
        //         'case_assignments.other',
        //         'insurance_cases.case_details',
        //         'insurance_cases.insurance_type',
        //         'case_assignments.type',
        //         'insurance_customers.name as customer_name',
        //         'insurance_customers.present_address as customer_place',
        //         'insurance_customers.phone',
        //         'insurance_companies.name as company_name',
        //                     'insurance_companies.questionnaires as company_questionnaires',

        //         'driver.name as driver_name',
        //         'assign_work_data.updated_at',
        //     )
        //     ->get();

        // if ($cases->isEmpty()) {
        //     return response()->json(['message' => 'No case data found.'], 200);
        // }

        // $result = [];
        // foreach ($cases as $case) {
  
        //     $assignData = DB::table('assign_work_data')->where('case_id', $case->id)->first();

        //     $garage_reassign_status = $assignData->garage_reassign_status ?? 0;
        //     $driver_reassign_status = $assignData->driver_reassign_status ?? 0;
        //     $spot_reassign_status = $assignData->spot_reassign_status ?? 0;
        //     $meeting_reassign_status = $assignData->owner_reassign_status ?? 0;
        //     $accident_reassign_status = $assignData->accident_person_reassign_status ?? 0;

        //     if ($driver_reassign_status != 1) {
        //         $result[] = $this->createCaseArray($case, 'driver');
        //     }
        //     if ($garage_reassign_status != 1) {
        //         $result[] = $this->createCaseArray($case, 'garage');
        //     }
        //     if ($spot_reassign_status != 1) {
        //         $result[] = $this->createCaseArray($case, 'spot');
        //     }
        //     if ($meeting_reassign_status != 1) {
        //         $result[] = $this->createCaseArray($case, 'meeting');
        //     }
        //     if ($accident_reassign_status != 1 && $case->type!='OD' ) {
        //         $result[] = $this->createCaseArray($case, 'accident');
        //     }
        // }

        // if (empty($result)) {
        //     return response()->json(['message' => 'No case data found.'], 200);
        // }

        // return response()->json($result, 200);


        $id = Auth::user()->id;

        $cases = DB::table('case_assignments')
        ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
        ->leftJoin('assign_work_data', 'case_assignments.id', '=', 'assign_work_data.case_id')
        ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
        ->leftJoin('insurance_cases', 'insurance_customers.id', '=', 'insurance_cases.customer_id')
        ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')

        ->leftJoin('users as garage', 'case_assignments.executive_garage', '=', 'garage.id')
        ->leftJoin('users as spot', 'case_assignments.executive_spot', '=', 'spot.id')
        ->leftJoin('users as meeting', 'case_assignments.executive_meeting', '=', 'meeting.id')
        ->leftJoin('users as accident', 'case_assignments.executive_accident_person', '=', 'accident.id')
     
           

        ->where(function ($query) use ($id) 
            {
            $query->where('executive_driver', $id)
                ->orWhere('executive_garage', $id)
                ->orWhere('executive_spot', $id)
                ->orWhere('executive_meeting', $id)
                ->orWhere('executive_accident_person', $id);
        })
        ->where('case_assignments.status', 1) // Add this line to filter status_new = 0
        ->select(
            'case_assignments.id',
            'assign_work_data.id as assign_work_data_id',
            'case_assignments.date',
            'case_assignments.other',
            'insurance_cases.case_details',
            'insurance_cases.insurance_type',
            'case_assignments.status',
            'case_assignments.type',
            'insurance_customers.name as customer_name',
            'insurance_customers.present_address as customer_place',
            'insurance_customers.phone',
            'insurance_companies.name as company_name',
            'insurance_companies.questionnaires as company_questionnaires',
            'driver.name as driver_name',
            'assign_work_data.updated_at',
            'case_assignments.executive_driver','case_assignments.executive_garage','case_assignments.executive_spot',
            'case_assignments.executive_meeting', 'case_assignments.executive_accident_person'
        )
        ->get();

        if ($cases->isEmpty()) 
        {
        return response()->json(['message' => 'No case data found.'], 200);
        }

        $result = [];

        foreach ($cases as $case) {
        $assignData = DB::table('assign_work_data')->where('case_id', $case->id)->first();

        $reassignStatus = [
            'garage'    => $assignData->garage_reassign_status ?? 0,
            'driver'    => $assignData->driver_reassign_status ?? 0,
            'spot'      => $assignData->spot_reassign_status ?? 0,
            'meeting'   => $assignData->owner_reassign_status ?? 0,
            'accident'  => $assignData->accident_person_reassign_status ?? 0,
        ];


        $executiveIds = [
        'driver'   => $case->executive_driver,
        'garage'   => $case->executive_garage,
        'spot'     => $case->executive_spot,
        'meeting'  => $case->executive_meeting,
        'accident' => $case->executive_accident_person,
        ];

        $works = [];

        foreach (['driver', 'garage', 'spot', 'meeting', 'accident'] as $work)
         {
            if ($reassignStatus[$work] != 1 && ($work != 'accident' || $case->type != 'OD')) {
                $questionnaire = [];

                $questionnaires = json_decode($case->company_questionnaires, true);
                if (!empty($questionnaires) && isset($questionnaires[$work]))
                 {
                   
                    foreach ($questionnaires[$work] as $fieldKey => $field)                 
                    {

                    if (isset($field['type']) && $field['type'] === 'file') 
                    {
                    if (isset($field['name']) && in_array($field['name'], [
                    'garage_gate_entry_images',
                    'garage_job_card_images',
                    'garage_vehicle_images'
                    ])
                    ) 
                    {

                    $field['multiple'] = true;
                    }
                    }

                    $questionnaire[$fieldKey] = $field;
                    }
                }

                $works[] = [
                    'work' => $work,
                    'case_work_id' => $work . $case->phone . $case->id . ($case->updated_at ?? 0),
                    'executive_id'   => $executiveIds[$work], // ✅ Include the executive ID dynamically

                    'questionnaire' => $questionnaire
                ];
            }
        }

        if (!empty($works)) 
        {
            $result[] = [
                'id'                => $case->id,
                'assign_id'         => $case->assign_work_data_id,
                'customer_name'     => $case->customer_name,
                'customer_place'    => $case->customer_place,
                'phone'             => $case->phone,
                'company_name'      => $case->company_name,
                'type'              => $case->type,
                'status'            => $case->status,
                'driver_name'       => $case->driver_name,
                'date'              => $case->date,
                'other'             => $case->other,
                'case_details'      => $case->case_details,
                'insurance_type'    => $case->insurance_type,
                'login_id'          =>Auth::user()->id,
                'works'             => $works
            ];
        }
        }
        return response()->json($result, 200);
    }

  
    // private function createCaseArray($case, $work)
    // {
    //     return [
    //         'id' => $case->id,
    //         'customer_name' => $case->customer_name,
    //         'customer_place' => $case->customer_place,
    //         'phone' => $case->phone,
    //         'company_name' => $case->company_name,
    //         'type' => $case->type,
    //         'driver_name' => $case->driver_name,
    //         'date' => $case->date,
    //         'other' => $case->other,
    //         'case_details' => $case->case_details,
    //         'insurance_type' => $case->insurance_type,
    //         'work' => $work,
    //         'case_work_id' => $work . $case->phone . $case->id . $case->updated_at ?? 0,
    //     ];
    // }


    private function createCaseArray($case, $work,$questionnaire = [])
    {
        return [
            'id' => $case->id,
            'customer_name' => $case->customer_name,
            'customer_place' => $case->customer_place,
            'phone' => $case->phone,
            'company_name' => $case->company_name,
            'type' => $case->type,
            'driver_name' => $case->driver_name,
            'date' => $case->date,
            'other' => $case->other,
            'case_details' => $case->case_details,
            'insurance_type' => $case->insurance_type,
            'work' => $work,
            'case_work_id' => $work . $case->phone . $case->id . $case->updated_at ?? 0,
            'questionnaire' => $questionnaire

        ];
    }

    public function garageStore(Request $request, $case_id)
    {
        $request->validate([
            'garage_gate_entry' => 'nullable|string',
            'garage_gate_entry_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'garage_job_card' => 'nullable|string',
            'garage_job_card_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'vehicle_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'garage_voice.*' => 'nullable',
            'location' => 'nullable|string',
            'latitude_and_longitude' => 'nullable|string',
            'tow_vehical_report.*'=>'nullable|image|mimes:jpeg,png,jpg,gif'
        ]);

        $folderMapping = [
            'garage_gate_entry_images' => 'garage_gate_entry',
            'garage_job_card_images' => 'garage_job_card',
            'vehicle_images' => 'vehicle',
            'garage_voice' => 'voice',
            'tow_vehical_report'=>'tow_vehicle'
        ];

        $paths = [];

        foreach ($request->allFiles() as $key => $files) 
        {
            if (is_array($files)) 
            {
            foreach ($files as $file) 
            {
            if ($file->isValid()) 
            {
            $folder = $folderMapping[$key] ?? 'default';
            $paths[$key][] = $file->store($folder, 'public');
            } 

            else 
            {
            \Log::error("File upload failed for: $key");
            }
            }
        }
        }

        $assignWorkData = AssignWorkData::firstOrCreate(
            ['case_id' => $case_id],
            ['garage_re_assign_count' => 0]
        );

        $assignWorkData->garage_re_assign_count++;
        $assignWorkData->garage_reassign_status = 1; 
        $assignWorkData->save();

        $garageData = new GarageData([
            'assign_work_id' => $assignWorkData->id,
            'garage_gate_entry' => $request->garage_gate_entry,
            'garage_job_card' => $request->garage_job_card,
            'garage_gate_entry_images' => !empty($paths['garage_gate_entry_images']) ? json_encode($paths['garage_gate_entry_images']) : null,
            'garage_job_card_images' => !empty($paths['garage_job_card_images']) ? json_encode($paths['garage_job_card_images']) : null,
            'vehicle_images' => !empty($paths['vehicle_images']) ? json_encode($paths['vehicle_images']) : null,
            'garage_voice' => !empty($paths['garage_voice']) ? json_encode($paths['garage_voice']) : null,
            'tow_vehical_report' => !empty($paths['tow_vehical_report']) ? json_encode($paths['tow_vehical_report']) : null,
            'location' => $request->location,
            'latitude_and_longitude' => $request->latitude_and_longitude,
            'executive_id' => auth()->id(), 
        ]);

        $garageData->save();

        return response()->json([
            'message' => 'Data updated successfully in assign_work_data and new row created in garage_data',
            'current_data' => $assignWorkData,
        ], 200);
    }


    public function driverStore(Request $request, $case_id)
    {
       
        $validator = Validator::make($request->all(), [
            'driver_image.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'driver_name' => 'nullable|string',
            'driving_licence_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'rc_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'driver_aadhaar_card_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'driver_voice.*' => 'nullable',
            'location' => 'nullable|string',
            'latitude_and_longitude' => 'nullable|string',
            'co_passenger_dl.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'co_passenger_aadhar.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'vehical_type'=>'nullable|string',
            'vehicle_permit.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'rc_reg_date'=>'nullable',
            'rc_exp_date'=>'nullable',
            'dl_exp_date'=>'nullable',
            'driver_ration_card.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
            'assets_pic.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'rider_version_accident'=>'nullable|string',
            'dl_and_rto'=>'nullable|string',
            'others'=>'nullable|string',
            'vehicle_authorized_drive'=>'nullable',
            'seating_capacity'=>'nullable'
        ]);
        

        $folderMapping = [
            'driver_image' => 'driver',
            'driving_licence_images' => 'driving_licence',
            'rc_images' => 'rc',
            'driver_aadhaar_card_images' => 'driver_aadhaar',
            'driver_voice' => 'voice',
            'co_passenger_dl'=>'co_passenger_dl',
            'co_passenger_aadhar'=>'co_passernger_aadhar',
            'vehicle_permit'=>'vehicle_permit',
            'driver_ration_card'=>'driver_ration_card',
            'video_call'=>'video_call',
            'assets_pic'=>'assets'
        ];
        

        $paths = [];
        foreach ($request->allFiles() as $key => $files) {

            if (is_array($files)) {
                foreach ($files as $file) {
                    if ($file->isValid()) {
                        $folder = $folderMapping[$key] ?? 'default';
                        $paths[$key][] = $file->store($folder, 'public');
                    } else {
                        \Log::error("File upload failed for: $key");
                    }
                }
            }
        }

        $assignWorkData = AssignWorkData::firstOrCreate(
            ['case_id' => $case_id],
            ['driver_re_assign_count' => 0]
        );

        $assignWorkData->driver_re_assign_count++;
        $assignWorkData->driver_reassign_status = 1;
        $assignWorkData->save();

        $rcRegDate = \Carbon\Carbon::parse($request->rc_reg_date)->format('Y-m-d');
        $rcExpDate = \Carbon\Carbon::parse($request->rc_exp_date)->format('Y-m-d');
        $dlExpDate = \Carbon\Carbon::parse($request->dl_exp_date)->format('Y-m-d');

        $driverData = new DriverData([
            'assign_work_id' => $assignWorkData->id,
            'driver_image' => !empty($paths['driver_image']) ? json_encode($paths['driver_image']) : null,
            'driving_licence_images' => !empty($paths['driving_licence_images']) ? json_encode($paths['driving_licence_images']) : null,
            'rc_images' => !empty($paths['rc_images']) ? json_encode($paths['rc_images']) : null,
            'driver_aadhaar_card_images' => !empty($paths['driver_aadhaar_card_images']) ? json_encode($paths['driver_aadhaar_card_images']) : null,
            'driver_voice' => !empty($paths['driver_voice']) ? json_encode($paths['driver_voice']) : null,
            'co_passenger_dl' => !empty($paths['co_passenger_dl']) ? json_encode($paths['co_passenger_dl']) : null,
            'co_passenger_aadhar' => !empty($paths['co_passenger_aadhar']) ? json_encode($paths['co_passenger_aadhar']) : null,
            'vehicle_permit' => !empty($paths['vehicle_permit']) ? json_encode($paths['vehicle_permit']) : null,
            'ration_card' => !empty($paths['driver_ration_card']) ? json_encode($paths['driver_ration_card']) : null,
            'video_call' => !empty($paths['video_call']) ? json_encode($paths['video_call']) : null,
            'assets_pic' => !empty($paths['assets_pic']) ? json_encode($paths['assets_pic']) : null,
            'vehical_type'=>$request->vehical_type,
            'rc_reg_date'=>$rcRegDate,
            'rc_exp_date'=>$rcExpDate,
            'dl_exp_date'=>$dlExpDate,
            'location' =>$request->location,
            'latitude_and_longitude' => $request->latitude_and_longitude,
            'executive_id' => auth()->id(),
            'driver_name' => $request->driver_name,
            'driver_name' => $request->driver_name,
            'rider_version_accident'=>$request->rider_version_accident,
            'dl_and_rto'=>$request->dl_and_rto,
            'others'=>$request->others,
            'vehicle_authorized_drive'=>$request->vehicle_authorized_drive,
            'seating_capacity'=>$request->seating_capacity
        ]);

        $driverData->save();

        return response()->json([
            'message' => $assignWorkData->wasRecentlyCreated
                ? 'New entry created in assign_work_data and driver_data'
                : 'Data updated successfully in assign_work_data and new row created in driver_data',
            'current_data' => $assignWorkData,
        ], 200);
    }




    public function spotStore(Request $request, $case_id)
    {
        $request->validate([
            'spot_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'spot_address' => 'nullable|string',
            'spot_voice.*' => 'nullable',
            'location' => 'nullable|string',
            'latitude_and_longitude' => 'nullable|string',
            'investigation_date'=> 'nullable',
            'investigation_submission_date'=> 'nullable',
            'op_no'=> 'nullable',
            'advocate_name'=> 'nullable',
            'court'=> 'nullable',
            'case_title'=> 'nullable',
            'case_claim'=> 'nullable',
            'cause_loss'=> 'nullable',
            'od_claim'=> 'nullable',
            'road_details'=>'nullable'
        ]);

        $folderMapping = [
            'spot_images' => 'spot',
            'spot_voice' => 'voice',
        ];

        $paths = [];
        foreach ($request->allFiles() as $key => $files) {
            if (is_array($files)) {
                foreach ($files as $file) {
                    if ($file->isValid()) {
                        $folder = $folderMapping[$key] ?? 'default';
                        $paths[$key][] = $file->store($folder, 'public');
                    } else {
                        \Log::error("File upload failed for: $key");
                    }
                }
            }
        }

        $assignWorkData = AssignWorkData::firstOrCreate(
            ['case_id' => $case_id],
            ['spot_re_assign_count' => 0]
        );

        $updateData = [
            'spot_reassign_status' => 1,
        ];

        foreach ($updateData as $column => $value) {
            if (!empty($value)) {
                $assignWorkData->$column = $value;
            }
        }

        $assignWorkData->spot_re_assign_count++;
        $assignWorkData->save();

        if($request->investigation_date && $request->investigation_submission_date ){
            $investigation_date = Carbon::createFromFormat('d-m-Y', $request->investigation_date)->format('Y-m-d');
            $investigation_submission_date = Carbon::createFromFormat('d-m-Y', $request->investigation_submission_date)->format('Y-m-d');
        }else{
            $investigation_date=NULL;
            $investigation_submission_date=NULL;
        }

        $spotData = [
            'assign_work_id' => $assignWorkData->id,
            'spot_address' => $request->spot_address,
            'spot_images' => !empty($paths['spot_images']) ? json_encode($paths['spot_images']) : null,
            'spot_voice' => !empty($paths['spot_voice']) ? json_encode($paths['spot_voice']) : null,
            'location' => $request->location,
            'latitude_and_longitude' => $request->latitude_and_longitude,
            'executive_id' => auth()->id(),
            'investigation_date'=> $investigation_date,
            'investigation_submission_date'=> $investigation_submission_date,
            'op_no'=> $request->op_no,
            'advocate_name'=> $request->advocate_name,
            'court'=> $request->court,
            'case_title'=> $request->case_title,
            'case_claim'=> $request->case_claim,
            'cause_loss'=> $request->cause_loss,
            'od_claim'=> $request->od_claim,
            'road_details'=>$request->road_details 
        ];

        SpotData::create(array_filter($spotData));

        return response()->json([
            'message' => $assignWorkData->wasRecentlyCreated
                ? 'New entry created in assign_work_data and spot_data'
                : 'Data updated successfully in assign_work_data and new row created in spot_data',
            'current_data' => $assignWorkData,
        ], 200);
    }


    public function ownerStore(Request $request, $case_id)
    {
        $request->validate([
            'owner_written_statment_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'owner_aadhaar_card_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'owner_voice.*' => 'nullable',
            'location' => 'nullable|string',
            'latitude_and_longitude' => 'nullable|string',
            'owner_ration_card.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'driving_lic.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'insured_version_acc'=>'nullable|string',
            'insured_occupation'=>'nullable|string',
            'rc_owner_name'=>'nullable|string',
            'vehicle_no'=>'nullable|string',
            'made_make'=>'nullable|string',
            'engine_no'=>'nullable|string',
            'chass_no'=>'nullable|string',
            'class_of_vehicle'=>'nullable|string',
            'permit_details'=>'nullable|string',
            'details_opp_vehicle'=>'nullable|string',
            'owner_opp_vehicle'=>'nullable|string',
            'fitness_validity_from'=>'nullable',
            'fitness_validity_to'=>'nullable',
            'polution_validity_from'=>'nullable',
            'polution_validity_to'=>'nullable',
            'doa_in_policy'=>'nullable',
            'policy_comper_tp_liability'=>'nullable',
            'if_goodladen_details'=>'nullable',
            'damage_goods_transport'=>'nullable',
            'details_damage_vehicle'=>'nullable'
        ]);

        $folderMapping = [
            'owner_written_statment_images' => 'written_statement',
            'owner_aadhaar_card_images' => 'owner_aadhaar',
            'owner_voice' => 'voice',
            'owner_ration_card'=>'owner_ration',
            'driving_lic'=>'owner_dl'
        ];

        $paths = [];
        foreach ($request->allFiles() as $key => $files) 
        {
        if (is_array($files)) 
        {
        foreach ($files as $file) 
        {
        if ($file->isValid()) {
        $folder = $folderMapping[$key] ?? 'default';
        $paths[$key][] = $file->store($folder, 'public');
        } 
        else 
        {
        \Log::error("File upload failed for: $key");
        }
        }
        }
        }

        $assignWorkData = AssignWorkData::firstOrCreate(
            ['case_id' => $case_id],
            ['owner_re_assign_count' => 0]
        );

        $assignWorkData->owner_re_assign_count++;
        $assignWorkData->owner_reassign_status = 1;
        $assignWorkData->save();

        if($request->fitness_validity_from && $request->fitness_validity_to && $request->polution_validity_from && $request->polution_validity_to)
        {
            $fitness_validity_from = Carbon::createFromFormat('d-m-Y', $request->fitness_validity_from)->format('Y-m-d');
            $fitness_validity_to = Carbon::createFromFormat('d-m-Y', $request->fitness_validity_to)->format('Y-m-d');
            $polution_validity_from = Carbon::createFromFormat('d-m-Y', $request->polution_validity_from)->format('Y-m-d');
            $polution_validity_to = Carbon::createFromFormat('d-m-Y', $request->polution_validity_to)->format('Y-m-d');
        }
        else
        {
            $fitness_validity_from=NULL;
            $fitness_validity_to=NULL;
            $polution_validity_from=NULL;
            $polution_validity_to=NULL;
        }

        $ownerData = [
            'assign_work_id' => $assignWorkData->id,
            'owner_written_statment_images' => !empty($paths['owner_written_statment_images']) ? json_encode($paths['owner_written_statment_images']) : null,
            'owner_aadhaar_card_images' => !empty($paths['owner_aadhaar_card_images']) ? json_encode($paths['owner_aadhaar_card_images']) : null,
            'owner_voice' => !empty($paths['owner_voice']) ? json_encode($paths['owner_voice']) : null,
            'ration_card' => !empty($paths['owner_ration_card']) ? json_encode($paths['owner_ration_card']) : null,
            'driving_lic' => !empty($paths['driving_lic']) ? json_encode($paths['driving_lic']) : null,
            'location' => $request->location,
            'latitude_and_longitude' => $request->latitude_and_longitude,
            'executive_id' => auth()->id(),
            'insured_version_acc'=>$request->insured_version_acc,
            'insured_occupation'=>$request->insured_occupation,
            'rc_owner_name'=>$request->rc_owner_name,
            'vehicle_no'=>$request->vehicle_no,
            'made_make'=>$request->made_make,
            'engine_no'=>$request->engine_no,
            'chass_no'=>$request->chass_no,
            'class_of_vehicle'=>$request->class_of_vehicle,
            'permit_details'=>$request->permit_details,
            'details_opp_vehicle'=>$request->details_opp_vehicle,
            'owner_opp_vehicle'=>$request->owner_opp_vehicle,
            'fitness_validity_from'=>$fitness_validity_from,
            'fitness_validity_to'=>$fitness_validity_to,
            'polution_validity_from'=>$polution_validity_from,
            'polution_validity_to'=>$polution_validity_to,
            'doa_in_policy'=>$request->doa_in_policy,
            'policy_comper_tp_liability'=>$request->policy_comper_tp_liability,
            'if_goodladen_details'=>$request->if_goodladen_details,
            'damage_goods_transport'=>$request->damage_goods_transport,
            'details_damage_vehicle'=>$request->details_damage_vehicle 
        ];

        OwnerData::create(array_filter($ownerData));

        

        return response()->json([
            'message' => $assignWorkData->wasRecentlyCreated
                ? 'New entry created in assign_work_data and owner_data'
                : 'Data updated successfully in assign_work_data and new row created in owner_data',
            'current_data' => $assignWorkData,
        ], 200);
    }



    public function accidentPersonStore(Request $request, $case_id)
    {
       Validator::make($request->all(), [
            'accident_person_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'accident_person_written_statment_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'accident_person_aadhaar_card_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            'accident_person_voice.*' => 'nullable',
            'location' => 'nullable|string',
            'latitude_and_longitude' => 'nullable|string',
            'medical_report.*'=>'nullable|mimes:pdf,zip',
            'hospital_report.*'=>'nullable|mimes:pdf,zip',
            'accident_person_ration_card.*'=>'nullable|image|mimes:jpeg,png,jpg,gif',
            'fir_vers_accdnt'=> 'nullable|string',
            'claiment_vers_aaccdnt'=> 'nullable|string',
            'chrgesheet_con'=> 'nullable|string',
            'relation_insured_and_claiment'=> 'nullable|string',
            'age_injured_person'=> 'nullable|string',
            'profession_injured'=> 'nullable|string',
            'diff_in_rider_ver_injured'=> 'nullable|string',
            'name_address_hospital'=> 'nullable|string',
            'distance_from_site_hospital'=> 'nullable|string',
            'details_big_hospital_near_site'=> 'nullable|string',
            'zebra_cross_on_site'=> 'nullable',
            'injury_record_details'=> 'nullable|string',
            'name_witness'=> 'nullable|string',
            'name_informer'=> 'nullable|string',
            'vehicle_no_fir'=> 'nullable',
            'name_accused'=> 'nullable|string',
            'injured_name'=> 'nullable|string',
            'injured_phone'=> 'nullable|string',
            'injured_address'=> 'nullable|string',
            'injured_pedstrian_or_traveller'=> 'nullable|string',
            'injured_hospital_report'=> 'nullable|string',
            'injured_admited_hospital_details'=> 'nullable|string',
            'gd_no'=> 'nullable|string',
            'police_station'=> 'nullable|string',
            'gd_date'=> 'nullable',
            'gd_pdf.*'=>'nullable|mimes:pdf,zip',
            'accident_date_time'=>'nullable',
            'accident_description'=>'nullable',
            'no_occupants'=>'nullable',
            'complnt_rel_injured'=>'nullable',
            'descrition_accused'=>'nullable',
            'accused_identifed'=>'nullable',
        ]);


        $folderMapping = [
            'accident_person_images' => 'accident_person',
            'accident_person_written_statment_images' => 'written_statement',
            'accident_person_aadhaar_card_images' => 'accident_person_aadhaar',
            'accident_person_voice' => 'voice',
            'medical_report'=>'medical',
            'hospital_report'=>'hospital',
            'accident_person_ration_card'=>'accident_pers_ration',
            'gd_pdf'=> 'gd_pdf'
        ];

        $paths = [];
        foreach ($request->allFiles() as $key => $files) {
            if (is_array($files)) {
               
                foreach ($files as $file) {
                    if ($file->isValid()) {
                        $folder = $folderMapping[$key] ?? 'default';
                        $paths[$key][] = $file->store($folder, 'public');
                    } else {
                        \Log::error("File upload failed for: $key");
                    }
                }
            }
        }

        $assignWorkData = AssignWorkData::firstOrCreate(
            ['case_id' => $case_id],
            ['accident_person_re_assign_count' => 0]
        );

        $assignWorkData->accident_person_re_assign_count++;
        $assignWorkData->accident_person_reassign_status = 1;
        $assignWorkData->save();

        $gd_date = \Carbon\Carbon::parse($request->gd_date)->format('Y-m-d');

        $accidentPersonData = [
            'assign_work_id' => $assignWorkData->id,
            'accident_person_images' => !empty($paths['accident_person_images']) ? json_encode($paths['accident_person_images']) : null,
            'accident_person_written_statment_images' => !empty($paths['accident_person_written_statment_images']) ? json_encode($paths['accident_person_written_statment_images']) : null,
            'accident_person_aadhaar_card_images' => !empty($paths['accident_person_aadhaar_card_images']) ? json_encode($paths['accident_person_aadhaar_card_images']) : null,
            'accident_person_voice' => !empty($paths['accident_person_voice']) ? json_encode($paths['accident_person_voice']) : null,
            'medical_report' => !empty($paths['medical_report']) ? json_encode($paths['medical_report']) : null,
            'hospital_report' => !empty($paths['hospital_report']) ? json_encode($paths['hospital_report']) : null,
            'ration_card' => !empty($paths['accident_person_ration_card']) ? json_encode($paths['accident_person_ration_card']) : null,
            'gd_pdf' => !empty($paths['gd_pdf']) ? json_encode($paths['gd_pdf']) : null,
            'location' => $request->location,
            'latitude_and_longitude' => $request->latitude_and_longitude,
            'executive_id' => auth()->id(),
            'fir_vers_accdnt'=> $request->fir_vers_accdnt,
            'claiment_vers_aaccdnt'=> $request->claiment_vers_aaccdnt,
            'chrgesheet_con'=> $request->chrgesheet_con,
            'relation_insured_and_claiment'=> $request->relation_insured_and_claiment,
            'age_injured_person'=> $request->age_injured_person,
            'profession_injured'=> $request->profession_injured,
            'diff_in_rider_ver_injured'=> $request->diff_in_rider_ver_injured,
            'name_address_hospital'=> $request->name_address_hospital,
            'distance_from_site_hospital'=> $request->distance_from_site_hospital,
            'details_big_hospital_near_site'=> $request->details_big_hospital_near_site,
            'zebra_cross_on_site'=> $request->zebra_cross_on_site,
            'injury_record_details'=> $request->injury_record_details,
            'name_witness'=> $request->name_witness,
            'name_informer'=> $request->name_informer,
            'vehicle_no_fir'=> $request->vehicle_no_fir,
            'name_accused'=> $request->name_accused,
            'injured_name'=> $request->injured_name,
            'injured_phone'=> $request->injured_phone,
            'injured_address'=> $request->injured_address,
            'injured_pedstrian_or_traveller'=> $request->injured_pedstrian_or_traveller,
            'injured_hospital_report'=> $request->injured_hospital_report,
            'injured_admited_hospital_details'=> $request->injured_admited_hospital_details,
            'gd_no'=>$request->gd_no,
            'police_station'=>$request->police_station,
            'gd_date'=>$gd_date,
            'accident_date_time'=>$request->accident_date_time,
            'accident_description'=>$request->accident_description,
            'no_occupants'=>$request->no_occupants,
            'complnt_rel_injured'=>$request->complnt_rel_injured,
            'descrition_accused'=>$request->descrition_accused,
            'accused_identifed'=>$request->accused_identifed,
            
        ];
        

        AccidentPersonData::create(array_filter($accidentPersonData));

        return response()->json([
            'message' => $assignWorkData->wasRecentlyCreated
                ? 'New entry created in assign_work_data and accident_person_data'
                : 'Data updated successfully in assign_work_data and new row created in accident_person_data',
            'current_data' => $assignWorkData,
        ], 200);
    }



//     public function saveQuestionnaireAnswers(Request $request)
// {
//     $items = $request->all();

//     foreach ($items as $item) {
//         $caseId = $item['case_id'];
//         $work = $item['work'];
//         $data = $item['data'];

//         $tableMap = [
//             'garage' => 'garage_data',
//             'spot' => 'spot_data',
//             'driver' => 'driver_data',
//             'meeting' => 'owner_data',
//             'accident' => 'accident_person_data',
//         ];

//         $tableName = $tableMap[$work] ?? null;

//         if (!$tableName) {
//             continue;
//         }

//         $exists = DB::table($tableName)->where('case_id', $caseId)->exists();

//         if ($exists) 
//         {
//             DB::table($tableName)->where('case_id', $caseId)->update($data);
//         } 
//         else 
//         {
//             $insertData = array_merge(['case_id' => $caseId], $data);
//             DB::table($tableName)->insert($insertData);
//         }
//     }

//     return response()->json(['status' => 'success']);
// }



//     public function storequestion(Request $request)
//     {
//     $data = $request->all();

//     if (!isset($data['id']) || !isset($data['works']) || !is_array($data['works'])) 
//     {
//     return response()->json(['error' => 'Invalid data'], 422);
//     }

//     $submission = new \App\Models\QuestionnaireSubmission();
//     $submission->case_id = $data['id'];
//     $submission->full_data = json_encode($data);
//     $submission->save();

//     foreach ($data['works'] as $work) 
//     {
//         $workType = $work['work'] ?? null;
//         $caseWorkId = $work['case_work_id'] ?? null;
//         $questionnaire = $work['questionnaire'] ?? [];

//         if (!$workType || !is_array($questionnaire)) 
//         {
//         continue;
//         }

//         $record = ['case_work_id' => $caseWorkId];

//         foreach ($questionnaire as $field) {
//             if (isset($field['name']) && isset($field['data'])) {
//                 $record[$field['name']] = is_array($field['data']) 
//                     ? json_encode($field['data']) 
//                     : $field['data'];
//             }
//         }

//         $modelMap = [
//             'driver' => \App\Models\Driver::class,
//             'garage' => \App\Models\Garage::class,
//             'spot' => \App\Models\Spot::class,
//             'meeting' => \App\Models\Meeting::class,
//             'accident' => \App\Models\Accident::class,

//         ];

//         if (array_key_exists($workType, $modelMap)) {
//             $modelClass = $modelMap[$workType];
//             $modelClass::create($record);
//         }
//     }

//     return response()->json([
//         'status' => 'success',
//         'message' => 'Data saved successfully',
//         'submission_id' => $submission->id
//     ]);
// }


    // public function storequestion(Request $request)
    // {
    // if (!Auth::check()) 
    // {
    // return response()->json(['error' => 'Unauthorized'], 401);
    // }

    // $userId = Auth::user()->id;

    // $data = $request->all();

    // if (!isset($data['id']) || !isset($data['works'])) 
    // {
    // return response()->json(['error' => 'Invalid data'], 422);
    // }

    // $submission = new QuestionnaireSubmission();
    // $submission->case_id    = $data['id'];
    // $submission->user_id    = $userId; 
    // $submission->full_data  = json_encode($data);
    // $submission->save();

    //  \DB::table('case_assignments')
    //     ->where('id', $submission->case_id)
    //     ->update(['status' => 2]);
        
    // return response()->json(['status' => 'success', 'id' => $submission->id]);
    // }



public function storequestion(Request $request)
{
    if (!Auth::check()) 
    {
    return response()->json(['error' => 'Unauthorized'], 401);
    }

    $userId = Auth::user()->id;
    $data = $request->all();

    if (!isset($data['id']) || !isset($data['works'])) 
    {
    return response()->json(['error' => 'Invalid data'], 422);
    }

    $submission = new QuestionnaireSubmission();
    $submission->case_id   = $data['id'];
    // $submission->user_id   = $userId;
    $submission->full_data = json_encode($data);
    $submission->save();

    DB::table('case_assignments')
        ->where('id', $submission->case_id)
        ->update(['status' => 2]);

  $workToTableMap = [
    'driver'   => 'driver_data',
    'garage'   => 'garage_data',
    'meeting'  => 'owner_data',
    'spot'     => 'spot_data',
    'accident' => 'accident_person_data',
];

foreach ($data['works'] as $workItem) {
    if (!isset($workItem['work'], $workItem['questionnaire'])) {
        continue;
    }

    $workType = $workItem['work'];
    $questionnaire = $workItem['questionnaire'];
    $assignWorkId = $data['assign_id'];
    $executiveId = $workItem['executive_id'] ?? null;
    $table = $workToTableMap[$workType] ?? ($workType . '_data');

    $insertData = [
        'assign_work_id' => $assignWorkId,
        'executive_id'   => $executiveId,
        'created_at'     => now(),
        'updated_at'     => now(),
    ];

    // Process questionnaire fields (supports both flat and indexed array)
    foreach ($questionnaire as $field) {
        if (isset($field['name']) && array_key_exists('data', $field)) {
            $insertData[$field['name']] = is_array($field['data'])
                ? json_encode($field['data'])
                : $field['data'];
        }
    }

    if (Schema::hasTable($table)) {
        DB::table($table)->insert($insertData); // main table

        // Also insert into _old table
        $oldTable = $table . '_old';
        if (Schema::hasTable($oldTable)) {
            DB::table($oldTable)->insert($insertData);
        }
    }
}


   return response()->json(['status' => 'success', 'id' => $submission->id]);
}





    // public function storequestion(Request $request)
    // {
    //     $data = $request->all();

    //     if (!isset($data['id']) || !isset($data['works'])) 
    //     {
    //     return response()->json(['error' => 'Invalid data'], 422);
    //     }

    //     $submission             = new QuestionnaireSubmission();
    //     $submission->case_id    = $data['id'];
    //      $submission->user    = $data['id'];
    //     $submission->full_data  = json_encode($data);
    //     $submission->save();

    //     return response()->json(['status' => 'success', 'id' => $submission->id]);
    // }

    public function store(Request $request)
    {
        $data = $request->all();

        $caseId = $data['case_id'] ?? null;

        unset($data['case_id']);

        if (count($data) !== 1) 
        {
        return response()->json(['error' => 'Please provide exactly one table data per request.'], 400);
        }

        $table = array_key_first($data);
        $columns = $data[$table];

        if (!Schema::hasTable($table)) 
        {
        return response()->json(['error' => "Table '$table' does not exist."], 400);
        }

        $tableColumns = Schema::getColumnListing($table);

        if ($caseId !== null) 
        {
        $keyName = 'case_id';

        if (in_array($keyName, $tableColumns)) 
        {
        $columns[$keyName] = $caseId;
        }

        else 
        {
        return response()->json(['error' => "Column '$keyName' does not exist in table '$table'."], 400);
        }
        }

        foreach ($columns as $col => $val) 
        {
        if (!in_array($col, $tableColumns)) 
        {
        return response()->json(['error' => "Column '$col' does not exist in table '$table'."], 400);
        }
        }

        try 
        {
        $id = DB::table($table)->insertGetId($columns);

        return response()->json([
        'message' => "Data inserted successfully into table '$table'.",
        'inserted_id' => $id
        ], 201);
        } 

        catch (\Exception $e) 
        {
        return response()->json([
        'error' => 'Insert failed: ' . $e->getMessage()
        ], 500);
        }
    }


    public function store233(Request $request)
    {
        $data = $request->all();

        if (count($data) !== 1) 
        {
            return response()->json(['error' => 'Please provide exactly one table data per request.'], 400);
        }

        $table = array_key_first($data);
        $columns = $data[$table];

        if (!Schema::hasTable($table)) 
        {
            return response()->json(['error' => "Table '$table' does not exist."], 400);
        }

        $tableColumns = Schema::getColumnListing($table);
        foreach ($columns as $col => $val) 
        {
            if (!in_array($col, $tableColumns)) 
            {
                return response()->json(['error' => "Column '$col' does not exist in table '$table'."], 400);
            }
        }

        try 
        {
            $id = DB::table($table)->insertGetId($columns);

            return response()->json([
                'message' => "Data inserted successfully into table '$table'.",
                'inserted_id' => $id
            ], 201);
        } 
        catch (\Exception $e) {
            return response()->json([
                'error' => 'Insert failed: ' . $e->getMessage()
            ], 500);
        }
    
}



    public function getAssignedWorks(Request $request)
    {

        Validator::make($request->all(), [
            'assign_id'=>'required',
        ]);

         $assignWorkData=AssignWorkData::leftJoin('accident_person_data','assign_work_data.id','=','accident_person_data.assign_work_id')
                                        ->leftJoin('driver_data','driver_data.assign_work_id','=','assign_work_data.id')
                                        ->leftJoin('garage_data','garage_data.assign_work_id','=','assign_work_data.id')
                                        ->leftJoin('owner_data','owner_data.assign_work_id','=','assign_work_data.id')
                                        ->leftJoin('spot_data','spot_data.assign_work_id','=','assign_work_data.id')
                                        ->leftJoin('users as au','au.id','=','accident_person_data.executive_id')
                                        ->leftJoin('users as du','du.id','=','driver_data.executive_id')
                                        ->leftJoin('users as gu','gu.id','=','garage_data.executive_id')
                                        ->leftJoin('users as ou','ou.id','=','owner_data.executive_id')
                                        ->leftJoin('users as su','su.id','=','spot_data.executive_id')
                                        ->where('assign_work_data.case_id',$request->assign_id)
                                        ->select('accident_person_data.*','accident_person_data.ration_card as accident_ration_card',
                                                'driver_data.*','driver_data.ration_card as driver_ration_card','garage_data.*','owner_data.*',
                                                'owner_data.ration_card as owner_ration_card','spot_data.*','au.name as au_name','du.name as du_name',
                                                'gu.name as gu_name','ou.name as ou_name','su.name as su_name'
                                                )->distinct()
                                                ->get();

         return response()->json(['assignedWorkData'=>$assignWorkData],200);                               
    }

    public function specialCaseList()
    {
        $id = Auth::user()->id;

        $cases = DB::table('case_assignments')
                ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
                ->leftJoin('assign_work_data', 'case_assignments.id', '=', 'assign_work_data.case_id')
                ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
                ->leftJoin('insurance_cases', 'insurance_customers.id', '=', 'insurance_cases.customer_id')
                ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')
                ->where(function ($query) use ($id) {
                    $query->where('executive_driver', $id)
                        ->orWhere('executive_garage', $id)
                        ->orWhere('executive_spot', $id)
                        ->orWhere('executive_meeting', $id)
                        ->orWhere('executive_accident_person', $id);
                })
                ->leftJoin('accident_person_data as apd', function($join) {
                    $join->on('assign_work_data.id', '=', 'apd.assign_work_id')
                        ->where('apd.sp_case', '=', 1);
                })
                ->leftJoin('driver_data as dd', function($join) {
                    $join->on('assign_work_data.id', '=', 'dd.assign_work_id')
                        ->where('dd.sp_case', '=', 1);
                })
                ->leftJoin('garage_data as gd', function($join) {
                    $join->on('assign_work_data.id', '=', 'gd.assign_work_id')
                        ->where('gd.sp_case', '=', 1);
                })
                ->leftJoin('owner_data as od', function($join) {
                    $join->on('assign_work_data.id', '=', 'od.assign_work_id')
                        ->where('od.sp_case', '=', 1);
                })
                ->leftJoin('spot_data as sd', function($join) {
                    $join->on('assign_work_data.id', '=', 'sd.assign_work_id')
                        ->where('sd.sp_case', '=', 1);
                })
                
               
                ->select(
                    'case_assignments.id',
                    'case_assignments.other',
                    'insurance_cases.case_details',
                    'insurance_cases.insurance_type',
                    'insurance_customers.name as customer_name',
                    'insurance_customers.present_address as customer_place',
                    'insurance_customers.phone',
                    'insurance_companies.name as company_name',
                    'apd.id as apd_section_id',
                    'dd.id as dd_section_id',
                    'gd.id as gd_section_id',
                    'od.id as od_section_id',
                    'sd.id as sd_section_id',
                    'case_assignments.date as date',
                )
                ->get();
                $result=[];

                foreach($cases as $case){
                    if(!is_null($case->apd_section_id) || !is_null($case->dd_section_id) || !is_null($case->gd_section_id) || !is_null($case->od_section_id) ||  !is_null($case->sd_section_id))
                    {
                        $result[]=
                                    [
                                        'id' => $case->id,
                                        'other' => $case->other,
                                        'case_details' => $case->case_details,
                                        'insurance_type' => $case->insurance_type,
                                        'customer_name' => $case->customer_name,
                                        'customer_place' => $case->customer_place,
                                        'phone' => $case->phone,
                                        'company_name' => $case->company_name,
                                        'apd_section_id' => $case->apd_section_id,
                                        'dd_section_id' => $case->dd_section_id,
                                        'gd_section_id' => $case->gd_section_id,
                                        'od_section_id' => $case->od_section_id,
                                        'sd_section_id' => $case->sd_section_id,
                                        'work_id'=>$case->apd_section_id .$case->dd_section_id .$case->gd_section_id . $case->od_section_id . $case->sd_section_id.$case->id,
                                        'case_date' => $case->date,
                                    ];
                    }
                }
                

        if ($cases->isEmpty()) {
            return response()->json(['message' => 'No case data found.'], 200);
        }else{
            return response()->json(['data' => $result], 200);
        }

    } 


     public function getSpotFormConfig($id)
    {
        // $spot = DB::table('spot_data')->where('id', $id)->first();

        // if (!$spot) {
        //     return response()->json(['status' => 'error', 'message' => 'Spot data not found'], 404);
        // }

        // $formFields = [
        //     [
        //         'name' => 'spot_address',
        //         'label' => 'Spot Address',
        //         'type' => 'text',
        //         'required' => true,
        //         // 'value' => $spot->spot_address,
        //     ],
        //     [
        //         'name' => 'investigation_date',
        //         'label' => 'Date of entrustment of the Investigation',
        //         'type' => 'date',
        //         'required' => true,
        //         // 'value' => $spot->investigation_date,
        //     ],
        //     [
        //         'name' => 'investigation_submission_date',
        //         'label' => 'Date of submission of the Investigation Report',
        //         'type' => 'date',
        //         'required' => true,
        //         // 'value' => $spot->investigation_submission_date,
        //     ],
        //     [
        //         'name' => 'op_no',
        //         'label' => 'OP (MV) No.',
        //         'type' => 'text',
        //         'required' => false,
        //         // 'value' => $spot->op_no,
        //     ],
        //     [
        //         'name' => 'advocate_name',
        //         'label' => 'Advocate Name',
        //         'type' => 'text',
        //         'required' => false,
        //         // 'value' => $spot->advocate_name,
        //     ],
        //     [
        //         'name' => 'court',
        //         'label' => 'Court',
        //         'type' => 'text',
        //         'required' => false,
        //         // 'value' => $spot->court,
        //     ],
        //     [
        //         'name' => 'case_title',
        //         'label' => 'Case Title',
        //         'type' => 'text',
        //         'required' => false,
        //         // 'value' => $spot->case_title,
        //     ],
        //     [
        //         'name' => 'case_claim',
        //         'label' => 'Case/Claim Filed Under Section',
        //         'type' => 'text',
        //         'required' => false,
        //         // 'value' => $spot->case_claim,
        //     ],
        //     [
        //         'name' => 'cause_loss',
        //         'label' => 'Cause of Loss (e.g., Death/Injury,TPPD)',
        //         'type' => 'text',
        //         'required' => false,
        //         // 'value' => $spot->cause_loss,
        //     ],

        //      [
        //         'name' => 'od_claim',
        //         'label' => 'OD Claim, if any, made. If so,details (Ascertained from Insured)',
        //         'type' => 'text',
        //         'required' => false,
            
        //      ],
        //         [
        //         'name' => 'road_details',
        //         'label' => 'Road Details',
        //         'type' => 'text',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'investigation_bill_no',
        //         'label' => 'Investigation Bill',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'investigation_report',
        //         'label' => 'Investigation Report',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'loss_minimization_sheet',
        //         'label' => 'Loss Minimization Sheet',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'policy_copy',
        //         'label' => 'Policy Copy',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //        [
        //         'name' => 'driving_license_extract',
        //         'label' => 'Driving License Extract',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'permit_copy',
        //         'label' => 'Permit Copy',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //        [
        //         'name' => 'fitness_certificate_copy',
        //         'label' => 'Fitness Certificate Copy',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'rc_book',
        //         'label' => 'R.C. Book',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'insured_statement',
        //         'label' => 'Insured Statement',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'claimant_statement',
        //         'label' => 'Claimant Statement',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'seizure_memo_copy',
        //         'label' => 'Seizure Memo Copy',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'arrest_memo_copy',
        //         'label' => 'Arrest Memo Copy',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'mvi_report',
        //         'label' => 'MVI Report',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //        [
        //         'name' => 'age_proof',
        //         'label' => 'Age Proof',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //        [
        //         'name' => 'income_proof',
        //         'label' => 'Income Proof',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //        [
        //         'name' => 'occupation_proof',
        //         'label' => 'Occupation Proof',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //        [
        //         'name' => 'family_photograph',
        //         'label' => 'Photograph (Family or Nominees/Legal Heir)',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'spot_panchnama_copy',
        //         'label' => 'Spot Panchnama Copy',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

             
        //       [
        //         'name' => 'fir',
        //         'label' => 'F.I.R',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'final_report_charge_sheet',
        //         'label' => 'Final Report/Charge Sheet',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'death_certificate',
        //         'label' => 'Death Certificate',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //        [
        //         'name' => 'post_mortem_report',
        //         'label' => 'Post Mortem Report',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'viscera_report',
        //         'label' => 'Viscera Report (if preserved)',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //        [
        //         'name' => 'od_status',
        //         'label' => 'O.D. Status',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'tp_vehicle_insurance_details',
        //         'label' => 'T.P. Vehicle Insurance Details',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //        [
        //         'name' => 'tp_driving_license',
        //         'label' => 'T.P. Driving License',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //         [
        //         'name' => 'accident_site_map',
        //         'label' => 'Accident Site Map',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //       [
        //         'name' => 'inquest_panchnama',
        //         'label' => 'Inquest Panchnama',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //      [
        //         'name' => 'paper_cutting',
        //         'label' => 'Paper Cutting',
        //         'type' => 'select',
        //         'required' => false,
        //      ],
        //         [
        //         'name' => 'tp_insurer_confirmation',
        //         'label' => 'T.P. Insurer Confirmation (No claim T.P./OD)',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //       [
        //         'name' => 'notice_u_s_134c',
        //         'label' => 'Notice U/s 134(c)',
        //         'type' => 'select',
        //         'required' => false,
        //      ],

        //     [
        //         "name"=> "spot_images",
        //         "label"=> "Spot Images",
        //         "type"=>"file",
        //         "required"=>false,
        //         "multiple"=> true,
        //         "accept"=> "image/*",
        //     ],

        //     [
        //         "name"=> "spot_voice",
        //         "label"=> "Spot Voice",
        //         "type"=>"file",
        //         "required"=>false,
        //         "multiple"=> true,
        //         "accept"=> "audio/*",
        //     ],

        // ];

        // return response()->json([
        //     'status' => 'success',
        //      'name' => 'spot_data',
        //     'data' => $formFields
        // ]);

        $spot = DB::table('spot_data')->where('id', $id)->first();

        if (!$spot) {
        return response()->json(['status' => 'error', 'message' => 'Spot data not found'], 404);
        }

        // Get all columns in the table
        $columns = Schema::getColumnListing('spot_data');

        // Define required fields
        $requiredFields = ['spot_images', 'spot_voice'];

        // Define select-type fields and their options
        $selectFields = [

        'investigation_bill_no' => ['Yes', 'No'],
        'investigation_report' => ['Yes', 'No'],
        'loss_minimization_sheet' => ['Yes', 'No'],
        'policy_copy' => ['Yes', 'No'],
        'driving_license_extract' => ['Yes', 'No'],
        'permit_copy' => ['Yes', 'No'],
        'fitness_certificate_copy' => ['Yes', 'No'],
        'rc_book' => ['Yes', 'No'],
        'insured_statement' => ['Yes', 'No'],
        'claimant_statement' => ['Yes', 'No'],
        'seizure_memo_copy' => ['Yes', 'No'],
        'arrest_memo_copy' => ['Yes', 'No'],
        'mvi_report' => ['Yes', 'No'],
        'age_proof' => ['Yes', 'No'],
        'income_proof' => ['Yes', 'No'],
        'occupation_proof' => ['Yes', 'No'],
        'family_photograph' => ['Yes', 'No'],
        'spot_panchnama_copy' => ['Yes', 'No'],
        'accident_site_map' => ['Yes', 'No'],
        'inquest_panchnama' => ['Yes', 'No'],
        'paper_cutting' => ['Yes', 'No'],
        'fir' => ['Yes', 'No'],
        'final_report_charge_sheet' => ['Yes', 'No'],
        'death_certificate' => ['Yes', 'No'],
        'post_mortem_report' => ['Yes', 'No'],
        'viscera_report' => ['Yes', 'No'],
        'od_status' => ['Yes', 'No'],
        'tp_vehicle_insurance_details' => ['Yes', 'No'],
        'tp_driving_license' => ['Yes', 'No'],
        'tp_insurer_confirmation' => ['Yes', 'No'],
        'notice_u_s_134c' => ['Yes', 'No'],
        ];

        $fileFields = ['spot_images', 'spot_voice'];

        // Define fields to exclude from form
        $excludeFields = ['id','executive_id','assign_work_id','location','spot_downloads','created_at', 'updated_at'];

        $formFields = [];

        foreach ($columns as $column) 
        {
        if (in_array($column, $excludeFields)) 
        continue; // Skip excluded fields

        // Determine input type
        if (array_key_exists($column, $selectFields)) 
        {
        $type = 'select';
        } 
        elseif (in_array($column, $fileFields)) 
        {
        $type = 'file';
        } 
        elseif (Str::contains($column, 'date')) {
        $type = 'date';
        } 
        else 
        {
        $type = 'text';
        }

        $field = [
            'name' => $column,
            'label' => Str::title(str_replace('_', ' ', $column)),
            'type' => $type,
            'required' => in_array($column, $requiredFields),
        ];

        // Add value if not a file field
        if (!in_array($column, $fileFields)) 
        {
            // $field['value'] = $spot->$column;
        }

        // Add select options if needed
        if ($type === 'select') 
        {
        $field['options'] = array_map(fn($opt) => ['label' => $opt, 'value' => $opt], $selectFields[$column]);
        }

        // Add multiple flag for file inputs
        if ($type === 'file') 
        {
        $field['multiple'] = true;
        }

        $formFields[] = $field;
        }

        return response()->json([
        'status' => 'success',
        'name' => 'spot_data',
        'data' => $formFields
        ]);

    }
    
    public function getGarageFormConfig($id)
    {

     $spot = DB::table('garage_data')->where('id', $id)->first();

        if(!$spot) 
        {
        return response()->json(['status' => 'error', 'message' => 'Garage data not found'], 404);
        }

        $columns = Schema::getColumnListing('garage_data');

        $requiredFields = ['spot_images', 'spot_voice'];
        $selectFields = [

        'investigation_bill_no' => ['Yes', 'No'],
        'investigation_report' => ['Yes', 'No'],
        'loss_minimization_sheet' => ['Yes', 'No'],
        'policy_copy' => ['Yes', 'No'],
        'driving_license_extract' => ['Yes', 'No'],
        'permit_copy' => ['Yes', 'No'],
        'fitness_certificate_copy' => ['Yes', 'No'],
        'rc_book' => ['Yes', 'No'],
        'insured_statement' => ['Yes', 'No'],
        'claimant_statement' => ['Yes', 'No'],
        'seizure_memo_copy' => ['Yes', 'No'],
        'arrest_memo_copy' => ['Yes', 'No'],
        'mvi_report' => ['Yes', 'No'],
        'age_proof' => ['Yes', 'No'],
        'income_proof' => ['Yes', 'No'],
        'occupation_proof' => ['Yes', 'No'],
        'family_photograph' => ['Yes', 'No'],
        'spot_panchnama_copy' => ['Yes', 'No'],
        'accident_site_map' => ['Yes', 'No'],
        'inquest_panchnama' => ['Yes', 'No'],
        'paper_cutting' => ['Yes', 'No'],
        'fir' => ['Yes', 'No'],
        'final_report_charge_sheet' => ['Yes', 'No'],
        'death_certificate' => ['Yes', 'No'],
        'post_mortem_report' => ['Yes', 'No'],
        'viscera_report' => ['Yes', 'No'],
        'od_status' => ['Yes', 'No'],
        'tp_vehicle_insurance_details' => ['Yes', 'No'],
        'tp_driving_license' => ['Yes', 'No'],
        'tp_insurer_confirmation' => ['Yes', 'No'],
        'notice_u_s_134c' => ['Yes', 'No'],
        ];

        $fileFields = ['spot_images', 'spot_voice'];

        $excludeFields = ['id','executive_id','assign_work_id','location','spot_downloads','created_at', 'updated_at'];

        $formFields = [];

        foreach ($columns as $column) {
        if (in_array($column, $excludeFields)) continue; // Skip excluded fields

        // Determine input type
        if (array_key_exists($column, $selectFields)) {
            $type = 'select';
        } elseif (in_array($column, $fileFields)) {
            $type = 'file';
        } elseif (Str::contains($column, 'date')) {
            $type = 'date';
        } else {
            $type = 'text';
        }

        $field = [
            'name' => $column,
            'label' => Str::title(str_replace('_', ' ', $column)),
            'type' => $type,
            'required' => in_array($column, $requiredFields),
        ];

        if (!in_array($column, $fileFields)) {
            // $field['value'] = $spot->$column;
        }

        // Add select options if needed
        if ($type === 'select') {
            $field['options'] = array_map(fn($opt) => ['label' => $opt, 'value' => $opt], $selectFields[$column]);
        }

        // Add multiple flag for file inputs
        if ($type === 'file') {
            $field['multiple'] = true;
        }

        $formFields[] = $field;
        }

        return response()->json([
        'status' => 'success',
        'name' => 'spot_data',
        'data' => $formFields
        ]);

    }

public function getQuestionnaire($id)
{
    // $company = InsuranceCompany::find($id);

    // if(!$company) 
    // {
    // return response()->json([
    //     'status' => 'error',
    //     'message' => 'Insurance company not found.'
    // ], 404);
    // }

    // $selectedTabs = json_decode($company->selected_tabs, true) ?? [];
    // $questionnaireDataFlat = json_decode($company->questionnaires, true) ?? [];

    // $groupedQuestionnaire = [];

    // foreach ($selectedTabs as $tab) {
    // foreach ($questionnaireDataFlat as $key => $question) 
    // {
    //     if (Str::startsWith($key, $tab)) 
    //     {
    //         $groupedQuestionnaire[$tab][$key] = $question;
    //     }
    // }
    // }

    // return response()->json([
    // 'status' => 'success',
    // 'company_id' => $company->id,
    // 'selected_tabs' => $selectedTabs,
    // 'questionnaire' => $groupedQuestionnaire,
    // ]);

    $company = InsuranceCompany::find($id);

    if (!$company) {
        return response()->json([
            'status' => 'error',
            'message' => 'Insurance company not found.'
        ], 404);
    }

    $selectedTabs = json_decode($company->selected_tabs, true) ?? [];
    $questionnaireData = json_decode($company->questionnaires, true) ?? [];

    // Just keep it as-is, since it's already grouped by $tab => $fields
    $groupedQuestionnaire = $questionnaireData;

    // Get related case IDs
    $caseIds = InsuranceCase::where('company_id', $company->id)->pluck('id');

    return response()->json([
        // 'status' => 'success',
        // 'company_id' => $company->id,
        // 'case_ids' => $caseIds,
        // 'selected_tabs' => $selectedTabs,
        'questionnaire' => $groupedQuestionnaire,
    ]);
}


}
