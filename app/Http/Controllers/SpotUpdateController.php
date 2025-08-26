<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\SpotData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SpotUpdateController extends Controller
{
    public function updateSpotImages(Request $request, $id)
    {
            $spotData = SpotData::findOrFail($id);
    
            Validator::make($request->all(),[
                'spot_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',  
            ]);

        if ($request->hasFile('spot_images')) {
            foreach ($request->file('spot_images') as $index => $image) {
                $path = $image->store('spot', 'public');
                $updatedImages[$index] = $path;  
            }

            $spotData->spot_images = json_encode($updatedImages);
            $spotData->save();
        

            return back()->with('success', 'Spot images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateSpotVoices(Request $request, $id)
    {
            $spotData = SpotData::findOrFail($id);
    
            Validator::make($request->all(),[
                'spot_voice.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',  
            ]);

        if ($request->hasFile('spot_voice')) {
            foreach ($request->file('spot_voice') as $index => $image) {
                $path = $image->store('voice', 'public');
                $updatedImages[$index] = $path;  
            }

            $spotData->spot_voice = json_encode($updatedImages);
            $spotData->save();
        

            return back()->with('success', 'Spot Voice updated successfully!');
        }
        return back()->with('error', 'No Voice selected.');
    }


    public function updateSpotDatanew(Request $request)
    {

        // $selected = $request->input('selected_field');

        // if(!$selected || !str_contains($selected, ':')) 
        // {
        //     return back()->withErrors(['error' => 'Please select a spot record to update.']);
        // }

        // [$fieldName, $garageId] = explode(':', $selected);

        // $garage = SpotData::findOrFail($garageId);

        // $inputKey = "field_value.$garageId.$fieldName";

        // if ($request->hasFile($inputKey)) 
        // {
        // $file = $request->file($inputKey);
        // $path = $file->store('spot_uploads', 'public');
        // $garage->$fieldName = $path;
        // }

        // elseif ($request->filled($inputKey)) 
        // {
        // $value = $request->input($inputKey);
        // $garage->$fieldName = $value;
        // } 
        // else 
        // {
        // return back()->withErrors(['error' => 'No valid input found to update.']);
        // }

        // $garage->save();

        // return back()->with('success', 'Spot Data Updated Successfully!');


        $selected = $request->input('selected_field');

        if (!$selected || !str_contains($selected, ':')) 
            {
            return back()->withErrors(['error' => 'Please select a spot record to update.']);
        }

        [$fieldName, $garageId] = explode(':', $selected);

        // Sanitize column name
        $fieldName = preg_replace('/[^a-zA-Z0-9_]/', '', $fieldName);

        $garage = SpotData::findOrFail($garageId);

        $inputKey = "field_value.$garageId.$fieldName";
        $otherKey = "other_value.$garageId.$fieldName";

        $finalValue = null;

        // Handle file input
        if ($request->hasFile($inputKey)) {
            $file = $request->file($inputKey);
            $path = $file->store('spot_uploads', 'public');
            $finalValue = $path;
        }
        // Handle select input
        elseif ($request->filled($inputKey)) {
            $value = $request->input($inputKey);

            // If "Other" is selected
            if ($value === 'Other' && $request->filled($otherKey)) {
                $finalValue = $request->input($otherKey);
            } else {
                $finalValue = $value;
            }
        } else {
            return back()->withErrors(['error' => 'No valid input found to update.']);
        }

        $garage->$fieldName = $finalValue;
        $garage->save();

        return back()->with('success', 'Spot Data Updated Successfully!');

    }



    public function updateSpotData(Request $request, $id)
    {
        $request->validate([
            'spot_address' => 'nullable|string',
            'investigation_date'=> 'nullable',
            'investigation_submission_date'=> 'nullable',
            'op_no'=> 'nullable',
            'advocate_name'=> 'nullable',
            'court'=> 'nullable',
            'case_title'=> 'nullable',
            'case_claim'=> 'nullable',
            'cause_loss'=> 'nullable',
            'od_claim'=> 'nullable',
            'road_details'=>'nullable',
            'investigation_bill_no' => 'nullable|string',
            'investigation_report' => 'nullable|string',
            'loss_minimization_sheet' => 'nullable|string',
            'policy_copy' => 'nullable|string',
            'driving_license_extract' => 'nullable|string',
            'permit_copy' => 'nullable|string',
            'fitness_certificate_copy' => 'nullable|string',
            'rc_book' => 'nullable|string',
            'insured_statement' => 'nullable|string',
            'claimant_statement' => 'nullable|string',
            'seizure_memo_copy' => 'nullable|string',
            'arrest_memo_copy' => 'nullable|string',
            'mvi_report' => 'nullable|string',
            'age_proof' => 'nullable|string',
            'income_proof' => 'nullable|string',
            'occupation_proof' => 'nullable|string',
            'family_photograph' => 'nullable|string',
            'spot_panchnama_copy' => 'nullable|string',
            'accident_site_map' => 'nullable|string',
            'inquest_panchnama' => 'nullable|string',
            'paper_cutting' => 'nullable|string',
            'fir' => 'nullable|string',
            'final_report_charge_sheet' => 'nullable|string',
            'death_certificate' => 'nullable|string',
            'post_mortem_report' => 'nullable|string',
            'viscera_report' => 'nullable|string',
            'od_status' => 'nullable|string',
            'tp_vehicle_insurance_details' => 'nullable|string',
            'tp_driving_license' => 'nullable|string',
            'tp_insurer_confirmation' => 'nullable|string',
            'notice_u_s_134c' => 'nullable|string',
        ]);

        // $investigation_date = Carbon::createFromFormat('d-m-Y', $request->investigation_date)->format('Y-m-d');
        // $investigation_submission_date = Carbon::createFromFormat('d-m-Y', $request->investigation_submission_date)->format('Y-m-d');
        
        $SpotData = SpotData::findOrFail($id);

        $SpotData->update([
            'spot_address' => $request->spot_address,
            'investigation_date'=> $request->investigation_date,
            'investigation_submission_date'=> $request->investigation_submission_date,
            'op_no'=> $request->op_no,
            'advocate_name'=> $request->advocate_name,
            'court'=> $request->court,
            'case_title'=> $request->case_title,
            'case_claim'=> $request->case_claim,
            'cause_loss'=> $request->cause_loss,
            'od_claim'=> $request->od_claim, 
            'road_details'=>$request->road_details,
            'investigation_bill_no' => $request->investigation_bill_no,
            'investigation_report' => $request->investigation_report,
            'loss_minimization_sheet' => $request->loss_minimization_sheet,
            'policy_copy' => $request->policy_copy,
            'driving_license_extract' => $request->driving_license_extract,
            'permit_copy' => $request->permit_copy,
            'fitness_certificate_copy' => $request->fitness_certificate_copy,
            'rc_book' => $request->rc_book,
            'insured_statement' => $request->insured_statement,
            'claimant_statement' => $request->claimant_statement,
            'seizure_memo_copy' => $request->seizure_memo_copy,
            'arrest_memo_copy' => $request->arrest_memo_copy,
            'mvi_report' => $request->mvi_report,
            'age_proof' => $request->age_proof,
            'income_proof' => $request->income_proof,
            'occupation_proof' => $request->occupation_proof,
            'family_photograph' => $request->family_photograph,
            'spot_panchnama_copy' => $request->spot_panchnama_copy,
            'accident_site_map' => $request->accident_site_map,
            'inquest_panchnama' => $request->inquest_panchnama,
            'paper_cutting' => $request->paper_cutting,
            'fir' => $request->fir,
            'final_report_charge_sheet' => $request->final_report_charge_sheet,
            'death_certificate' => $request->death_certificate,
            'post_mortem_report' => $request->post_mortem_report,
            'viscera_report' => $request->viscera_report,
            'od_status' => $request->od_status,
            'tp_vehicle_insurance_details' => $request->tp_vehicle_insurance_details,
            'tp_driving_license' => $request->tp_driving_license,
            'tp_insurer_confirmation' => $request->tp_insurer_confirmation,
            'notice_u_s_134c' => $request->notice_u_s_134c,
            
        ]);

        return back()->with('success', 'Spot information updated successfully!');
    }

    public function spotSpecialCase($id)
    {
        $accidentData = SpotData::findOrFail($id);
        $accidentData->sp_case = 1;
        $accidentData->save();
        return back()->with('success', 'Spot section data Reasigned successfully!');
    }

    //Api
    public function uploadSpotImageVideoVoice(Request $request, $id)
    {
        Validator::make($request->all(), [
        'spot_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        'spot_report.*' => 'nullable|mimes:pdf,zip',
        'spot_voice.*' => 'nullable',
        'spot_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',  
    ]);

    
    $spotData = SpotData::findOrFail($id);
    $allDownloads = [];

    
    foreach (['spot_images', 'spot_report', 'spot_voice','spot_video_call'] as $field) {
        
        if ($request->hasFile($field)) {
            
            foreach ($request->file($field) as $file) {
                $path = $file->store('spot_downloads', 'public');
                $allDownloads[] = $path;
            }
        }
    }

   
    if (!empty($allDownloads)) {
        $spotData->spot_downloads = json_encode($allDownloads);
        $spotData->save();
    }

    return response()->json(['data' => 'Data Successfully Saved'], 200);
  }
}
