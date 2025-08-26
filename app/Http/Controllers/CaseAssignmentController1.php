<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\CaseAssignment;
use App\Models\InsuranceCompany;
use App\Models\InsuranceCustomer;
use App\Models\CaseReport;
use App\Models\InsuranceCase;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CaseAssignmentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create($id)
    {
        $insuranceCustomer = InsuranceCustomer::where("id", $id)->first();
        $users = User::where('role', '!=', 1)->where('status', '!=', 0)->get();
        $insuranceCompany = InsuranceCompany::where('id', $insuranceCustomer->company_id)->first();
        $caseId = InsuranceCase::where('customer_id', $id)->first();
        return view("dashboard.assign.create")->with([
            "insuranceCustomer" => $insuranceCustomer,
            "users" => $users,
            "insuranceCompany" => $insuranceCompany,
            "caseId" => $caseId,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "company_id" => "required",
            "customer_id" => "required",
            "Default_Executive" => "required",
            "executive_driver" => "required",
            "executive_garage" => "required",
            "executive_spot" => "required",
            "executive_meeting" => "required",
            "date" => "required",
            "investigation_type" => "required",
        ]);

        $executiveAccidentPerson = $request->investigation_type === 'MAC' ? $request->executive_accident_person : null;

        CaseAssignment::create([
            "case_id" => $request->case_id ?? null,
            "company_id" => $request->company_id,
            "customer_id" => $request->customer_id,
            "executive_driver" => $request->executive_driver,
            "executive_garage" => $request->executive_garage,
            "executive_spot" => $request->executive_spot,
            "executive_meeting" => $request->executive_meeting,
            "executive_accident_person" => $executiveAccidentPerson,
            "date" => $request->date,
            "type" => $request->investigation_type,
            "other" => $request->other,
            "status" => 1,
            "case_status" => 1,
            "craete_by" => Auth::user()->id ?? null,
            "update_by" => Auth::user()->id,
        ]);

        DB::table('insurance_cases')->where('customer_id', $request->customer_id)->update(['case_status' => 2]);

        return response()->json(['success' => 'Case assigned successfully']);
    }

    public function assignedCase(Request $request)
    {
        $cases = DB::table('case_assignments')
            ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
            ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
            ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')
            ->leftJoin('users as garage', 'case_assignments.executive_garage', '=', 'garage.id')
            ->leftJoin('users as spot', 'case_assignments.executive_spot', '=', 'spot.id')
            ->leftJoin('users as meeting', 'case_assignments.executive_meeting', '=', second: 'meeting.id')
            ->select('case_assignments.*',
                'insurance_companies.name as company_name',
                'insurance_customers.name as customer_name',
                'insurance_customers.phone',
                'driver.name as driver_name',
                'garage.name as garage_name',
                'spot.name as spot_name',
                'meeting.name as meeting_name'
            )
            ->paginate(10);
        return view('dashboard.assign.assigned-case')->with(['cases' => $cases]);
    }


     public function fakeCase(Request $request)
    {
        $cases = DB::table('case_assignments')
            ->leftJoin('insurance_companies', 'case_assignments.company_id', '=', 'insurance_companies.id')
            ->leftJoin('insurance_customers', 'case_assignments.customer_id', '=', 'insurance_customers.id')
            ->leftJoin('users as driver', 'case_assignments.executive_driver', '=', 'driver.id')
            ->leftJoin('users as garage', 'case_assignments.executive_garage', '=', 'garage.id')
            ->leftJoin('users as spot', 'case_assignments.executive_spot', '=', 'spot.id')
            ->leftJoin('users as meeting', 'case_assignments.executive_meeting', '=', second: 'meeting.id')
            ->select('case_assignments.*',
                'insurance_companies.name as company_name',
                'insurance_customers.name as customer_name',
                'insurance_customers.phone',
                'driver.name as driver_name',
                'garage.name as garage_name',
                'spot.name as spot_name',
                'meeting.name as meeting_name'
            )
            ->where('case_assignments.is_fake','1')
            ->paginate(10);
        return view('dashboard.assign.assigned-case')->with(['cases' => $cases]);
    }


    public function reAssign($id)
    {
        $cases = DB::table('case_assignments')->where('id', '=', $id)->first();
        $customer = DB::table('insurance_customers')->where('id', '=', $cases->customer_id)->first();
        $insuranceCompany = DB::table('insurance_companies')->where('id', '=', $cases->company_id)->first();
        $executives = User::where('role', '!=', 1)->where('status', '!=', 0)->get();
        return view('dashboard.assign.re-assign')
            ->with([
                'company' => $insuranceCompany,
                'customer' => $customer,
                'executives' => $executives,
                'cases' => $cases,
            ]);
    }

    public function reAssignUpdate(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        DB::table('case_assignments')->where('id', $request->id)->update([
            'executive_driver' => $request->driver,
            'executive_garage' => $request->garage,
            'executive_spot' => $request->spot,
            'executive_meeting' => $request->meeting,
            'executive_accident_person' => $request->accident_person,
            'date' => $request->date,
        ]);
    return response()->json(['success' => 'Case update successfully']);
        // return redirect()->back()->with('success', 'Case update successfully');

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
