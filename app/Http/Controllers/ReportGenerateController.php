<?php

namespace App\Http\Controllers;
use PDF;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\AssignWorkData;
use App\Models\AccidentPersonData;
use App\Models\FinalReport;
use App\Models\Question;
use App\Models\GarageData;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Html\Editor\Fields\Select;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class ReportGenerateController extends Controller
{
    public function requestReport(Request $request)
    {
        $search = $request->input('search', '');
        $reports = DB::table('assign_work_data as awd')
                ->leftJoin('case_assignments as ca', 'awd.case_id', '=', 'ca.id')
                ->leftJoin('insurance_customers as ic', 'ca.customer_id', '=', 'ic.id')
                ->leftJoin('insurance_companies as icomp', 'ca.company_id', '=', 'icomp.id')
                ->when(!empty($search), function ($query) use ($search) 
                {
                    $query->where(function ($q) use ($search) {
                        $q->where('ic.name', 'like', '%' . $search . '%')
                        ->orWhere('icomp.name', 'like', '%' . $search . '%')
                        ->orWhere('ca.date', 'like', '%' . $search . '%')
                        ->orWhere('ca.type', 'like', '%' . $search . '%');;
                    });
                })
            ->select(
                'awd.id as report_id',
                'ca.id as case_assignment_id', 
                'ic.name as customer_name', 'ic.crime_number','ic.police_station',
                'icomp.name as company_name',
                'ca.date as date',
                'ca.type as type'
            )
            ->orderBy('ca.id', 'desc') 
            ->paginate(10);

        return view('dashboard.report.report-request', ['reports' => $reports]);
    }

    public function requestReportView($id, Request $request)
    {
        // Main report data
        $report = DB::table('assign_work_data as awd')
            ->leftJoin('case_assignments as ca', 'awd.case_id', '=', 'ca.id')
            ->leftJoin('insurance_customers as ic', 'ca.customer_id', '=', 'ic.id')
            ->leftJoin('insurance_companies as icomp', 'ca.company_id', '=', 'icomp.id')
            ->select('awd.*', 'ic.name as customer_name', 'icomp.name as company_name', 'ca.date as date', 'ca.type as type' ,'ca.id as case_id','ca.is_fake')
            ->where('awd.id', $id)
            ->first();

        // Retrieve related data with executive names
      
        $garageData = DB::table('garage_data as gd')
            ->leftJoin('users as u', 'gd.executive_id', '=', 'u.id')
            ->select('gd.*', 'u.name as executive_name')
            ->where('gd.assign_work_id', $id)
            ->get();

        $garageQuestions = Question::where('data_category', 'garage_data')->get();
        $driverQuestions = Question::where('data_category', 'driver_data')->get();
        $spotQuestions = Question::where('data_category', 'spot_data')->get();
        $ownerQuestions = Question::where('data_category', 'owner_data')->get();
        $accidentQuestions = Question::where('data_category', 'accident_person_data')->get();


        $driverData = DB::table('driver_data as dd')
            ->leftJoin('users as u', 'dd.executive_id', '=', 'u.id')
            ->select('dd.*', 'u.name as executive_name')
            ->where('dd.assign_work_id', $id)
            ->get();

        $spotData = DB::table('spot_data as sd')
            ->leftJoin('users as u', 'sd.executive_id', '=', 'u.id')
            ->select('sd.*', 'u.name as executive_name')
            ->where('sd.assign_work_id', $id)
            ->get();

        $ownerData = DB::table('owner_data as od')
            ->leftJoin('users as u', 'od.executive_id', '=', 'u.id')
            ->select('od.*', 'u.name as executive_name')
            ->where('od.assign_work_id', $id)
            ->get();

        $accidentPersonData = DB::table('accident_person_data as apd')
            ->leftJoin('users as u', 'apd.executive_id', '=', 'u.id')
            ->select('apd.*', 'u.name as executive_name')
            ->where('apd.assign_work_id', $id)
            ->get();

        $users = User::where('role', '!=', 1)->where('status', '!=', 0)->get();

         
           // dd($accidentPersonData);
        return view('dashboard.report.view')->with([
            'report' => $report,
            'garageData' => $garageData,
            'driverData' => $driverData,
            'spotData' => $spotData,
            'ownerData' => $ownerData,
            'accidentPersonData' => $accidentPersonData,
            'garageQuestions'=>$garageQuestions,
            'driverQuestions'=>$driverQuestions,
            'spotQuestions'=>$spotQuestions,
            'ownerQuestions'=>$ownerQuestions,
            'accidentQuestions'=>$accidentQuestions,
            'users'=>$users
          
        ]);
    }

    public function finalReportDownload($id)
    {

        $report = DB::table('assign_work_data as awd')
            ->leftJoin('case_assignments as ca', 'awd.case_id', '=', 'ca.id')
            ->leftJoin('insurance_customers as ic', 'ca.customer_id', '=', 'ic.id')
            ->leftJoin('insurance_companies as icomp', 'ca.company_id', '=', 'icomp.id')
            ->leftJoin('users as garage', 'ca.executive_garage', '=', 'garage.id')
            ->leftJoin('users as driver', 'ca.executive_driver', '=', 'driver.id')
            ->leftJoin('users as spot', 'ca.executive_spot', '=', 'spot.id')
            ->leftJoin('users as owner', 'ca.executive_meeting', '=', 'owner.id')
            ->leftJoin('users as accident_person', 'ca.executive_meeting', '=', 'accident_person.id')
            ->select('awd.*',
                'ic.name as customer_name',
                'icomp.name as company_name',
                'ca.date as date',
                'ca.type as type',
                'garage.name as garage_name',
                'driver.name as executive_driver_name',
                'spot.name as spot_name',
                'owner.name as owner_name',
                'accident_person.name as accident_person_name',
            )
            ->where('awd.id', $id)
            ->first();
        $pdf = PDF::loadView('dashboard.report.final-report', compact('report'));
        return $pdf->stream('final-report.pdf');
    }

    public function garageReAssign(Request $request)
    {
        // $request->validate(['id' => 'required',
        // ]);

        // DB::table('assign_work_data')->where('id', $request->id)->update([
        //     'garage_reassign_status' => 0,
        //     'updated_at' => Carbon::now(),
        // ]);


    // $request->validate([
    //     'id' => 'required|integer|exists:assign_work_data,id',
    //     'executive_id' => 'required|integer|exists:users,id',
    // ]);

    // $assignWorkId = $request->id;
    // $executiveId = $request->executive_id;

    // DB::beginTransaction();

    // try 
    // {
    //     DB::table('assign_work_data')->where('id', $assignWorkId)->update([
    //         'garage_reassign_status' => 0,
    //         'updated_at' => Carbon::now(),
    //     ]);

    //     DB::table('garage_data')->where('assign_work_id', $assignWorkId)->update([
    //         'executive_id' => $executiveId,
    //         'updated_at' => Carbon::now(),
    //     ]);

    //     DB::table('case_assignments')->where('id', $assignWorkId)->update([
    //         'executive_garage' => $executiveId,
    //         'updated_at' => Carbon::now(),
    //     ]);

    //     DB::commit();

    //     return back()->with('success', 'Garage reassigned successfully.');
    // } 

    // catch (\Exception $e) 
    // {
    //     DB::rollBack();
    //     return back()->withErrors(['error' => 'Failed to reassign. Error: ' . $e->getMessage()]);
    // }


    $request->validate([
        'id' => 'required|integer|exists:assign_work_data,id',
        'executive_id' => 'required|integer|exists:users,id',
    ]);

    $assignWorkId = $request->id;
    $executiveId = $request->executive_id;

    DB::beginTransaction();

    try 
    {
        $caseId = DB::table('assign_work_data')
                    ->where('id', $assignWorkId)
                    ->value('case_id');

        if (!$caseId) 
        {
        throw new \Exception("Case ID not found for assign_work_data ID {$assignWorkId}");
        }

        DB::table('assign_work_data')->where('id', $assignWorkId)->update([
            'garage_reassign_status' => 0,
            'updated_at' => Carbon::now(),
        ]);

        DB::table('garage_data')->where('assign_work_id', $assignWorkId)->update([
            'executive_id' => $executiveId,
            'updated_at' => Carbon::now(),
        ]);

        DB::table('case_assignments')->where('id', $caseId)->update([
            'executive_garage' => $executiveId,
            'updated_at' => Carbon::now(),
        ]);

        DB::commit();

        return back()->with('success', 'Garage reassigned successfully.');
    } 
    catch (\Exception $e) 
    {
        DB::rollBack();
        return back()->withErrors(['error' => 'Reassignment failed: ' . $e->getMessage()]);
    }

}


    // }

    public function driverReAssign(Request $request)
    {
        // $request->validate([
        //     'id' => 'required',
        // ]);

        // DB::table('assign_work_data')->where('id', $request->id)->update([
        //     'driver_reassign_status' => 0,
        //     'updated_at' => Carbon::now(),
        // ]);


            $request->validate([
            'id' => 'required|integer|exists:assign_work_data,id',
            'executive_id' => 'required|integer|exists:users,id',
        ]);

        $assignWorkId = $request->id;
        $executiveId = $request->executive_id;

        DB::beginTransaction();

        try 
        {
            $caseId = DB::table('assign_work_data')
                        ->where('id', $assignWorkId)
                        ->value('case_id');

            if (!$caseId) 
            {
            throw new \Exception("Case ID not found for assign_work_data ID {$assignWorkId}");
            }

            DB::table('assign_work_data')->where('id', $assignWorkId)->update([
                'driver_reassign_status' => 0,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('driver_data')->where('assign_work_id', $assignWorkId)->update([
                'executive_id' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('case_assignments')->where('id', $caseId)->update([
                'executive_driver' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::commit();

            return back()->with('success', 'Driver reassigned successfully.');
        } 
        catch (\Exception $e) 
        {
            DB::rollBack();
            return back()->withErrors(['error' => 'Reassignment failed: ' . $e->getMessage()]);
        }

    }

    public function spotReAssign(Request $request)
    {
        // $request->validate([
        //     'id' => 'required',
        // ]);

        // DB::table('assign_work_data')->where('id', $request->id)->update([
        //     'spot_reassign_status' => 0,
        //     'updated_at' => Carbon::now(),
        // ]);


        $request->validate([
        'id' => 'required|integer|exists:assign_work_data,id',
        'executive_id' => 'required|integer|exists:users,id',
        ]);

        $assignWorkId = $request->id;
        $executiveId = $request->executive_id;

        DB::beginTransaction();

        try 
        {
            $caseId = DB::table('assign_work_data')
                        ->where('id', $assignWorkId)
                        ->value('case_id');

            if (!$caseId) 
            {
            throw new \Exception("Case ID not found for assign_work_data ID {$assignWorkId}");
            }

            DB::table('assign_work_data')->where('id', $assignWorkId)->update([
                'spot_reassign_status' => 0,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('spot_data')->where('assign_work_id', $assignWorkId)->update([
                'executive_id' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('case_assignments')->where('id', $caseId)->update([
                'executive_spot' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::commit();

            return back()->with('success', 'Spot reassigned successfully.');
        } 
        catch (\Exception $e) 
        {
            DB::rollBack();
            return back()->withErrors(['error' => 'Reassignment failed: ' . $e->getMessage()]);
        }
    }

    public function ownerReAssign(Request $request)
    {

        // $request->validate([
        //     'id' => 'required',
        // ]);

        // DB::table('assign_work_data')->where('id', $request->id)->update([
        //     'owner_reassign_status' => 0,
        //     'updated_at' => Carbon::now(),
        // ]);

         $request->validate([
        'id' => 'required|integer|exists:assign_work_data,id',
        'executive_id' => 'required|integer|exists:users,id',
        ]);

        $assignWorkId = $request->id;
        $executiveId = $request->executive_id;

        DB::beginTransaction();

        try 
        {
            $caseId = DB::table('assign_work_data')
                        ->where('id', $assignWorkId)
                        ->value('case_id');

            if (!$caseId) 
            {
            throw new \Exception("Case ID not found for assign_work_data ID {$assignWorkId}");
            }

            DB::table('assign_work_data')->where('id', $assignWorkId)->update([
                'owner_reassign_status' => 0,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('owner_data')->where('assign_work_id', $assignWorkId)->update([
                'executive_id' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('case_assignments')->where('id', $caseId)->update([
                'executive_meeting' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::commit();

            return back()->with('success', 'Owner reassigned successfully.');
        } 
        catch (\Exception $e) 
        {
            DB::rollBack();
            return back()->withErrors(['error' => 'Reassignment failed: ' . $e->getMessage()]);
        }

    }

    public function accidentPersonReAssign(Request $request)
    {
        // $request->validate([
        //     'id' => 'required',
        //     'updated_at' => Carbon::now(),
        // ]);

        // DB::table('assign_work_data')->where('id', $request->id)->update([
        //     'accident_person_reassign_status' => 0,
        // ]);

          $request->validate([
        'id' => 'required|integer|exists:assign_work_data,id',
        'executive_id' => 'required|integer|exists:users,id',
        ]);

        $assignWorkId = $request->id;
        $executiveId = $request->executive_id;

        DB::beginTransaction();

        try 
        {
            $caseId = DB::table('assign_work_data')
                        ->where('id', $assignWorkId)
                        ->value('case_id');

            if (!$caseId) 
            {
            throw new \Exception("Case ID not found for assign_work_data ID {$assignWorkId}");
            }

            DB::table('assign_work_data')->where('id', $assignWorkId)->update([
                'accident_person_reassign_status' => 0,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('accident_person_data')->where('assign_work_id', $assignWorkId)->update([
                'executive_id' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::table('case_assignments')->where('id', $caseId)->update([
                'executive_accident_person' => $executiveId,
                'updated_at' => Carbon::now(),
            ]);

            DB::commit();

            return back()->with('success', 'Accident Persons reassigned successfully.');
        } 
        catch (\Exception $e) 
        {
            DB::rollBack();
            return back()->withErrors(['error' => 'Reassignment failed: ' . $e->getMessage()]);
        }
    }

    public function saveGarageSelected(Request $request)
    {

    // $request->validate([
    // 'case_id' => 'required|integer',
    // 'column_name' => 'required|string',
    // 'value' => 'required|string',
    // ]);

    // $caseId = $request->case_id;
    // $column = $request->column_name;
    // $value = $request->value;

    // $tables = ['final_reports_new', 'final_reports'];

    // foreach ($tables as $tableName) 
    // {
    // if (!Schema::hasTable($tableName)) 
    // {
    //     continue;
    // }

    // if (!Schema::hasColumn($tableName, $column)) 
    // {
    // Schema::table($tableName, function (Blueprint $table) use ($column) {
    //     $table->text($column)->nullable();
    // });
    // }

    // $existing = DB::table($tableName)->where('case_id', $caseId)->first();

    // if ($existing) 
    // {
    //     DB::table($tableName)
    //         ->where('case_id', $caseId)
    //         ->update([
    //             $column => $value,
    //             'updated_at' => now()
    //         ]);
    // } 
    // else 
    // {
    //     DB::table($tableName)
    //         ->insert([
    //             'case_id' => $caseId,
    //             $column => $value,
    //             'created_at' => now(),
    //             'updated_at' => now()
    //         ]);
    // }
    // }

    // return response()->json([
    // 'data' => [
    //     'status' => 200,
    //     'message' => 'Answer saved successfully in all relevant tables.'
    // ]
    // ], 200);


        $request->validate([
        'case_id' => 'required|integer',
        'column_name' => 'required|string',
        'value' => 'required|string',
        ]);

        $caseId = $request->case_id;
        $column = $request->column_name;
        $value = $request->value;

        // If the value should always be saved as a JSON array:
        $jsonValue = json_encode([$value]);

        $tables = ['final_reports_new', 'final_reports'];

        foreach ($tables as $tableName) {
        if (!Schema::hasTable($tableName)) {
            continue;
        }

        if (!Schema::hasColumn($tableName, $column)) {
            Schema::table($tableName, function (Blueprint $table) use ($column) {
                $table->json($column)->nullable(); // Use JSON type if possible
            });
        }

        $existing = DB::table($tableName)->where('case_id', $caseId)->first();

        if ($existing) {
            DB::table($tableName)
                ->where('case_id', $caseId)
                ->update([
                    $column => $jsonValue,
                    'updated_at' => now()
                ]);
        } else {
            DB::table($tableName)
                ->insert([
                    'case_id' => $caseId,
                    $column => $jsonValue,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
        }
        }

        return response()->json([
        'data' => [
            'status' => 200,
            'message' => 'Answer saved successfully in all relevant tables as JSON array.'
        ]
        ], 200);


    }

    //Garage
    public function saveGarageSelectedImages(Request $request)
    {
        $case_id=$request->case_id;

        $absoluteUrl = $request->selected_garage_images;

        $baseUrl = url('storage/');
        $relativePath = str_replace($baseUrl . '/', '', $absoluteUrl);

        $finalReport = FinalReport::where('case_id',$case_id)->first();
        
        if($finalReport)
        {
        $finalReport->update([
        'selected_images'=>$relativePath  
        ]);

        }
        else
        {
        FinalReport::create([
        'selected_images' => $relativePath,
        'case_id'=>$case_id
        ]);
        }

        $tableName = 'final_reports_new';

        if (!Schema::hasTable($tableName)) 
        {
        Schema::create($tableName, function (Blueprint $table) 
        {
        $table->id();
        $table->unsignedBigInteger('case_id')->index();
        $table->string('selected_images')->nullable();
        $table->timestamps();
        });
        }

        $existing = DB::table($tableName)->where('case_id', $case_id)->first();
        if($existing)
        {
        DB::table($tableName)->where('case_id', $case_id)->update([
        'selected_images' => $relativePath,
        'updated_at'      => now(),
        ]);
        }

        else 
        {
        DB::table($tableName)->insert([
        'case_id'         => $case_id,
        'selected_images' => $relativePath,
        'created_at'      => now(),
        'updated_at'      => now(),
        ]);
        }

        $data=[
            "status"=> 200,
            "message"=>  $absoluteUrl
         ];
        return response()->json(['data'=>$data],200);
    }

//Driver
    public function saveDriverSelected(Request $request)
    {

        // $dd_id=$request->driver_id;
        // $case_id=$request->case_id;

        // $finalReport = FinalReport::where('case_id',$case_id)->first();

        // if ($finalReport!==null) 
        // {
        // $finalReport->update([
        // 'dd_id' => $dd_id, 
        // ]);
        // }
        // else 
        // {
        // FinalReport::create([
        // 'dd_id' => $dd_id,
        // 'case_id'=>$case_id
        // ]);
        // }

        // $tableName = 'final_reports_new';

        // if (!Schema::hasTable($tableName)) 
        // {
        // Schema::create($tableName, function (Blueprint $table) 
        // {
        // $table->id();
        // $table->unsignedBigInteger('dd_id')->nullable();
        // $table->unsignedBigInteger('case_id')->index();
        // $table->timestamps();
        // });
        // }

        // $existing = DB::table($tableName)->where('case_id', $case_id)->first();

        // if ($existing) 
        // {
        // DB::table($tableName)->where('case_id', $case_id)->update([
        // 'dd_id'      => $dd_id,
        // 'updated_at' => now(),
        // ]);
        // } 

        // else 
        // {
        // DB::table($tableName)->insert([
        // 'dd_id'      => $dd_id,
        // 'case_id'    => $case_id,
        // 'created_at' => now(),
        // 'updated_at' => now(),
        // ]);
        // }


        // $data=[
        // "status"=> 200,
        // "message"=>  'success' 
        // ];
        // return response()->json(['data'=>$data],200); 

       


         $request->validate([
        'case_id' => 'required|integer',
        'column_name' => 'required|string',
        'value' => 'required|string',
        ]);

        $caseId = $request->case_id;
        $column = $request->column_name;
        $value = $request->value;

        // If the value should always be saved as a JSON array:
        $jsonValue = json_encode([$value]);

        $tables = ['final_reports_new', 'final_reports'];

        foreach ($tables as $tableName) {
        if (!Schema::hasTable($tableName)) {
            continue;
        }

        if (!Schema::hasColumn($tableName, $column)) {
            Schema::table($tableName, function (Blueprint $table) use ($column) {
                $table->json($column)->nullable(); // Use JSON type if possible
            });
        }

        $existing = DB::table($tableName)->where('case_id', $caseId)->first();

        if ($existing) {
            DB::table($tableName)
                ->where('case_id', $caseId)
                ->update([
                    $column => $jsonValue,
                    'updated_at' => now()
                ]);
        } else {
            DB::table($tableName)
                ->insert([
                    'case_id' => $caseId,
                    $column => $jsonValue,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
        }
        }

        return response()->json([
        'data' => [
            'status' => 200,
            'message' => 'Answer saved successfully in all relevant tables as JSON array.'
        ]
        ], 200);


    }

    public function saveDriverSelectedImages(Request $request)
    {
        
        $case_id=$request->case_id;

        $absoluteUrl = $request->selected_driver_images;

        $baseUrl = url('storage/');
        $relativePath = str_replace($baseUrl . '/', '', $absoluteUrl);

        $finalReport = FinalReport::where('case_id',$case_id)->first();
        
        if($finalReport){
            $finalReport->update([
                'selected_images'=>$relativePath  
           ]);

        }else{
            FinalReport::create([
                'selected_images' => $relativePath,
                'case_id'=>$case_id
             ]);
        }


        $tableName = 'final_reports_new';

        if (!Schema::hasTable($tableName)) {
        Schema::create($tableName, function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('case_id')->index();
        $table->string('selected_images')->nullable();
        $table->timestamps();
        });
        }

        $existing = DB::table($tableName)->where('case_id', $case_id)->first();
        if ($existing)
        {
        DB::table($tableName)->where('case_id', $case_id)->update([
        'selected_images' => $relativePath,
        'updated_at'      => now(),
        ]);
        }

        else 
        {
        DB::table($tableName)->insert([
        'case_id'         => $case_id,
        'selected_images' => $relativePath,
        'created_at'      => now(),
        'updated_at'      => now(),
        ]);
        }

        $data=[
            "status"=> 200,
            "message"=>  $absoluteUrl
         ];
        return response()->json(['data'=>$data],200);
    }

//Spot

public function saveSpotSelected(Request $request)
{

    //     $sd_id=$request->spot_id;
    //     $case_id=$request->case_id;

    //     $finalReport = FinalReport::where('case_id',$case_id)->first();

    //     if($finalReport!==null) 
    //     {

    //     $finalReport->update([
    //     'sd_id' => $sd_id, 
    //     ]);
    //     } 
    //     else 
    //     {

    //     FinalReport::create([
    //     'sd_id' => $sd_id,
    //     'case_id'=>$case_id
    //     ]);

    //     }

    //     $tableName = 'final_reports_new';

    //     if (!Schema::hasTable($tableName)) 
    //     {
    //     Schema::create($tableName, function (Blueprint $table) 
    //     {
    //     $table->id();
    //     $table->unsignedBigInteger('sd_id')->nullable();
    //     $table->unsignedBigInteger('case_id')->index();
    //     $table->timestamps();
    //     });
    //     }

    //     $existing = DB::table($tableName)->where('case_id', $case_id)->first();

    //     if ($existing) 
    //     {
    //     DB::table($tableName)->where('case_id', $case_id)->update([
    //     'sd_id'      => $sd_id,
    //     'updated_at' => now(),
    //     ]);
    //     } 

    //     else 
    //     {
    //     DB::table($tableName)->insert([
    //     'sd_id'      => $sd_id,
    //     'case_id'    => $case_id,
    //     'created_at' => now(),
    //     'updated_at' => now(),
    //     ]);
    //     }

    //     $data=[
    //        "status"=> 200,
    //        "message"=>  'success' 
    //     ];
    //    return response()->json(['data'=>$data],200); 


        $request->validate([
        'case_id' => 'required|integer',
        'column_name' => 'required|string',
        'value' => 'required|string',
        ]);

        $caseId = $request->case_id;
        $column = $request->column_name;
        $value = $request->value;

        // If the value should always be saved as a JSON array:
        $jsonValue = json_encode([$value]);

        $tables = ['final_reports_new', 'final_reports'];

        foreach ($tables as $tableName) {
        if (!Schema::hasTable($tableName)) {
            continue;
        }

        if (!Schema::hasColumn($tableName, $column)) {
            Schema::table($tableName, function (Blueprint $table) use ($column) {
                $table->json($column)->nullable(); // Use JSON type if possible
            });
        }

        $existing = DB::table($tableName)->where('case_id', $caseId)->first();

        if ($existing) {
            DB::table($tableName)
                ->where('case_id', $caseId)
                ->update([
                    $column => $jsonValue,
                    'updated_at' => now()
                ]);
        } else {
            DB::table($tableName)
                ->insert([
                    'case_id' => $caseId,
                    $column => $jsonValue,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
        }
        }

        return response()->json([
        'data' => [
            'status' => 200,
            'message' => 'Answer saved successfully in all relevant tables as JSON array.'
        ]
        ], 200);

    }

    public function saveSpotSelectedImages(Request $request)
    {
        
        $case_id=$request->case_id;

        $absoluteUrl = $request->selected_spot_images;

        $baseUrl = url('storage/');
        $relativePath = str_replace($baseUrl . '/', '', $absoluteUrl);

        $finalReport = FinalReport::where('case_id',$case_id)->first();
        
        if($finalReport)
        {
        $finalReport->update([
        'selected_images'=>$relativePath  
        ]);

        }
        else
        {
        FinalReport::create([
        'selected_images' => $relativePath,
        'case_id'=>$case_id
        ]);
        }

        $tableName = 'final_reports_new';

        if (!Schema::hasTable($tableName))
        {
        Schema::create($tableName, function (Blueprint $table) 
        {
        $table->id();
        $table->unsignedBigInteger('case_id')->index();
        $table->string('selected_images')->nullable();
        $table->timestamps();
        });
        }

        $existing = DB::table($tableName)->where('case_id', $case_id)->first();
        if ($existing)
        {
        DB::table($tableName)->where('case_id', $case_id)->update([
        'selected_images' => $relativePath,
        'updated_at'      => now(),
        ]);
        }

        else 
        {
        DB::table($tableName)->insert([
        'case_id'         => $case_id,
        'selected_images' => $relativePath,
        'created_at'      => now(),
        'updated_at'      => now(),
        ]);
        }

        $data=[
            "status"=> 200,
            "message"=>  $absoluteUrl
         ];
        return response()->json(['data'=>$data],200);
    }

    //Owner

    public function saveOwnerSelected(Request $request)
    {
        
    //     $od_id=$request->owner_id;
    //     $case_id=$request->case_id;


    //     $finalReport = FinalReport::where('case_id',$case_id)->first();

    //     if($finalReport!==null) 
    //     {

    //     $finalReport->update([
    //     'od_id' => $od_id, 
    //     ]);
    //     } 
    //     else 
    //     {

    //     FinalReport::create([
    //     'od_id' => $od_id,
    //     'case_id'=>$case_id
    //     ]);
    //     }


    //     $tableName = 'final_reports_new';

    //     if (!Schema::hasTable($tableName)) 
    //     {
    //     Schema::create($tableName, function (Blueprint $table) 
    //     {
    //     $table->id();
    //     $table->unsignedBigInteger('od_id')->nullable();
    //     $table->unsignedBigInteger('case_id')->index();
    //     $table->timestamps();
    //     });
    //     }

    //     $existing = DB::table($tableName)->where('case_id', $case_id)->first();

    //     if ($existing) 
    //     {
    //     DB::table($tableName)->where('case_id', $case_id)->update([
    //     'od_id'      => $od_id,
    //     'updated_at' => now(),
    //     ]);
    //     } 

    //     else 
    //     {
    //     DB::table($tableName)->insert([
    //     'od_id'      => $od_id,
    //     'case_id'    => $case_id,
    //     'created_at' => now(),
    //     'updated_at' => now(),
    //     ]);
    //     }

    //     $data=[
    //        "status"=> 200,
    //        "message"=>  'success' 
    //     ];
    //    return response()->json(['data'=>$data],200); 


     $request->validate([
        'case_id' => 'required|integer',
        'column_name' => 'required|string',
        'value' => 'required|string',
        ]);

        $caseId = $request->case_id;
        $column = $request->column_name;
        $value = $request->value;

        // If the value should always be saved as a JSON array:
        $jsonValue = json_encode([$value]);

        $tables = ['final_reports_new', 'final_reports'];

        foreach ($tables as $tableName) {
        if (!Schema::hasTable($tableName)) {
            continue;
        }

        if (!Schema::hasColumn($tableName, $column)) {
            Schema::table($tableName, function (Blueprint $table) use ($column) {
                $table->json($column)->nullable(); // Use JSON type if possible
            });
        }

        $existing = DB::table($tableName)->where('case_id', $caseId)->first();

        if ($existing) {
            DB::table($tableName)
                ->where('case_id', $caseId)
                ->update([
                    $column => $jsonValue,
                    'updated_at' => now()
                ]);
        } else {
            DB::table($tableName)
                ->insert([
                    'case_id' => $caseId,
                    $column => $jsonValue,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
        }
        }

        return response()->json([
        'data' => [
            'status' => 200,
            'message' => 'Answer saved successfully in all relevant tables as JSON array.'
        ]
        ], 200);
    }

    public function saveOwnerSelectedImages(Request $request)
    {
        
        $case_id=$request->case_id;

        $absoluteUrl = $request->selected_owner_images;

        $baseUrl = url('storage/');
        $relativePath = str_replace($baseUrl . '/', '', $absoluteUrl);

        $finalReport = FinalReport::where('case_id',$case_id)->first();
        
        if($finalReport){
        $finalReport->update([
        'selected_images'=>$relativePath  
        ]);

        }else{
        FinalReport::create([
        'selected_images' => $relativePath,
        'case_id'=>$case_id
        ]);
        }

        $tableName = 'final_reports_new';

        if (!Schema::hasTable($tableName))
        {
        Schema::create($tableName, function (Blueprint $table) 
        {
        $table->id();
        $table->unsignedBigInteger('case_id')->index();
        $table->string('selected_images')->nullable();
        $table->timestamps();
        });
        }

        $existing = DB::table($tableName)->where('case_id', $case_id)->first();
        if ($existing)
        {
        DB::table($tableName)->where('case_id', $case_id)->update([
        'selected_images' => $relativePath,
        'updated_at'      => now(),
        ]);
        }

        else 
        {
        DB::table($tableName)->insert([
        'case_id'         => $case_id,
        'selected_images' => $relativePath,
        'created_at'      => now(),
        'updated_at'      => now(),
        ]);
        }

        $data=[
            "status"=> 200,
            "message"=>  $absoluteUrl
         ];
        return response()->json(['data'=>$data],200);
    }


     //Accident

     public function saveAccidentSelected(Request $request)
     {
       
        // $ad_id=$request->accident_id;
        // $case_id=$request->case_id;

        // $finalReport = FinalReport::where('case_id',$case_id)->first();

        // if ($finalReport!==null) 
        // {
        // $finalReport->update([
        // 'ad_id' => $ad_id, 
        // ]);
        // } 
        
        // else 
        // {

        // FinalReport::create([
        // 'ad_id' => $ad_id,
        // 'case_id'=>$case_id
        // ]);
        // }


        // $tableName = 'final_reports_new';

        // if (!Schema::hasTable($tableName)) 
        // {
        // Schema::create($tableName, function (Blueprint $table) 
        // {
        // $table->id();
        // $table->unsignedBigInteger('ad_id')->nullable();
        // $table->unsignedBigInteger('case_id')->index();
        // $table->timestamps();
        // });
        // }

        // $existing = DB::table($tableName)->where('case_id', $case_id)->first();

        // if ($existing) 
        // {
        // DB::table($tableName)->where('case_id', $case_id)->update([
        // 'ad_id'      => $ad_id,
        // 'updated_at' => now(),
        // ]);
        // } 

        // else 
        // {
        // DB::table($tableName)->insert([
        // 'ad_id'      => $ad_id,
        // 'case_id'    => $case_id,
        // 'created_at' => now(),
        // 'updated_at' => now(),
        // ]);
        // }
 
        //  $data=[
        //     "status"=> 200,
        //     "message"=>  'success' 
        //  ];
        // return response()->json(['data'=>$data],200); 


         $request->validate([
        'case_id' => 'required|integer',
        'column_name' => 'required|string',
        'value' => 'required|string',
        ]);

        $caseId = $request->case_id;
        $column = $request->column_name;
        $value = $request->value;

        // If the value should always be saved as a JSON array:
        $jsonValue = json_encode([$value]);

        $tables = ['final_reports_new', 'final_reports'];

        foreach ($tables as $tableName) {
        if (!Schema::hasTable($tableName)) {
            continue;
        }

        if (!Schema::hasColumn($tableName, $column)) {
            Schema::table($tableName, function (Blueprint $table) use ($column) {
                $table->json($column)->nullable(); // Use JSON type if possible
            });
        }

        $existing = DB::table($tableName)->where('case_id', $caseId)->first();

        if ($existing) {
            DB::table($tableName)
                ->where('case_id', $caseId)
                ->update([
                    $column => $jsonValue,
                    'updated_at' => now()
                ]);
        } else {
            DB::table($tableName)
                ->insert([
                    'case_id' => $caseId,
                    $column => $jsonValue,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
        }
        }

        return response()->json([
        'data' => [
            'status' => 200,
            'message' => 'Answer saved successfully in all relevant tables as JSON array.'
        ]
        ], 200);

     }

     public function saveAccidentSelectedImages(Request $request)
    {
        
        $case_id=$request->case_id;

        $absoluteUrl = $request->selected_accident_images;

        $baseUrl = url('storage/');
        $relativePath = str_replace($baseUrl . '/', '', $absoluteUrl);

        $finalReport = FinalReport::where('case_id',$case_id)->first();

        if($finalReport)
        {
        $finalReport->update([
        'selected_images'=>$relativePath  
        ]);

        }
        else
        {
        FinalReport::create([
        'selected_images' => $relativePath,
        'case_id'=>$case_id
        ]);
        }


        
        $tableName = 'final_reports_new';

        if (!Schema::hasTable($tableName))
        {
        Schema::create($tableName, function (Blueprint $table) 
        {
        $table->id();
        $table->unsignedBigInteger('case_id')->index();
        $table->string('selected_images')->nullable();
        $table->timestamps();
        });
        }

        $existing = DB::table($tableName)->where('case_id', $case_id)->first();
        if ($existing)
        {
        DB::table($tableName)->where('case_id', $case_id)->update([
        'selected_images' => $relativePath,
        'updated_at'      => now(),
        ]);
        }

        else 
        {
        DB::table($tableName)->insert([
        'case_id'         => $case_id,
        'selected_images' => $relativePath,
        'created_at'      => now(),
        'updated_at'      => now(),
        ]);
        }


        $data=[
            "status"=> 200,
            "message"=>  $absoluteUrl
         ];
        return response()->json(['data'=>$data],200);
    }
    
}
