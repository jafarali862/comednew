<?php

namespace App\Http\Controllers;

use App\Models\OwnerData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;

class OwnerUpdateController extends Controller
{
    public function updateOwnerWrittenStatmentImages(Request $request, $id)
    {
        $ownerData = OwnerData::findOrFail($id);

        $request->validate([

            'owner_written_statment_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('owner_written_statment_images')) {
            foreach ($request->file('owner_written_statment_images') as $index => $image) {
                $path = $image->store('written_statement', 'public');
                $updatedImages[$index] = $path;
            }

            $ownerData->owner_written_statment_images = json_encode($updatedImages);
            $ownerData->save();


            return back()->with('success', 'Owner Written Statement updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateOwnerAadharImage(Request $request, $id)
    {
        $ownerData = OwnerData::findOrFail($id);

        $request->validate([

            'owner_aadhaar_card_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('owner_aadhaar_card_images')) {
            foreach ($request->file('owner_aadhaar_card_images') as $index => $image) {
                $path = $image->store('aadhaar', 'public');
                $updatedImages[$index] = $path;
            }

            $ownerData->owner_aadhaar_card_images = json_encode($updatedImages);
            $ownerData->save();


            return back()->with('success', 'Owner Aadhar Card images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }


    public function updateOwnerDatanew(Request $request)
    {

    // $selected = $request->input('selected_field');

    // if(!$selected || !str_contains($selected, ':')) 
    // {
    //     return back()->withErrors(['error' => 'Please select a owner record to update.']);
    // }

    // [$fieldName, $garageId] = explode(':', $selected);

    // $garage = OwnerData::findOrFail($garageId);

    // $inputKey = "field_value.$garageId.$fieldName";

    // if ($request->hasFile($inputKey)) 
    // {
    // $file = $request->file($inputKey);
    // $path = $file->store('owner_uploads', 'public');
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

    // return back()->with('success', 'Owner Data Updated Successfully!');

 


 
      Log::info('Files Received:', $request->allFiles());

    $fieldValues = $request->input('field_value', []);
    $otherValues = $request->input('other_value', []);

    // Add uploaded files to the same structure as $fieldValues
    foreach ($request->allFiles()['field_value'] ?? [] as $ownerId => $fields) {
        foreach ($fields as $column => $file) {
            // If not already in fieldValues, inject dummy value to trigger the file processing
            if (!isset($fieldValues[$ownerId][$column])) {
                $fieldValues[$ownerId][$column] = null;
            }
        }
    }

    if (empty($fieldValues)) {
        Log::warning('No field values submitted.');
        return back()->withErrors(['error' => 'No data submitted.']);
    }

    foreach ($fieldValues as $ownerId => $fields) {
        $owner = OwnerData::find($ownerId);
        if (!$owner) {
            Log::warning("Owner with ID {$ownerId} not found.");
            continue;
        }

        foreach ($fields as $column => $value) {
            $uploadedFile = $request->file("field_value.$ownerId.$column");

            if ($uploadedFile instanceof \Illuminate\Http\UploadedFile) {
                Log::info("File uploaded for owner ID {$ownerId}, column {$column}, original name: {$uploadedFile->getClientOriginalName()}");
                $storedPath = $uploadedFile->store('owner_uploads', 'public');
                if ($storedPath) {
                    Log::info("File stored at: {$storedPath}");
                    $value = $storedPath;
                } else {
                    Log::error("Failed to store uploaded file for owner ID {$ownerId}, column {$column}");
                }
            } else {
                Log::info("No uploaded file for owner ID {$ownerId}, column {$column}. Value: {$value}");
            }

            if ($value === 'Other' && !empty($otherValues[$ownerId][$column])) {
                $value = $otherValues[$ownerId][$column];
                Log::info("Other value detected for owner ID {$ownerId}, column {$column}: {$value}");
            }

            $owner->$column = $value;
        }

        if ($owner->save()) {
            Log::info("Owner ID {$ownerId} data saved successfully.");
        } else {
            Log::error("Failed to save data for owner ID {$ownerId}");
        }
    }

    return back()->with('success', 'Owner data updated successfully.');



    }


    public function updateOwnerRationCardImage(Request $request, $id)
    {
        $ownerData = OwnerData::findOrFail($id);

        $request->validate([
            'owner_ration_card.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('owner_ration_card')) {
            foreach ($request->file('owner_ration_card') as $index => $image) {
                $path = $image->store('owner_ration', 'public');
                $updatedImages[$index] = $path;
            }

            $ownerData->ration_card     = json_encode($updatedImages);
            $ownerData->save();


            return back()->with('success', 'Owner Ration Card images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateOwnerDrivingLic(Request $request, $id)
    {
        $ownerData = OwnerData::findOrFail($id);

        $request->validate([
            'owner_driving_lic.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('owner_driving_lic')) {
            foreach ($request->file('owner_driving_lic') as $index => $image) {
                $path = $image->store('owner_dl', 'public');
                $updatedImages[$index] = $path;
            }

            $ownerData->driving_lic     = json_encode($updatedImages);
            $ownerData->save();

            return back()->with('success', 'Owner Driving Licence images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateOwnerVoice(Request $request, $id)
    {
        $ownerData = OwnerData::findOrFail($id);

        $request->validate([
            'owner_voice.*' => 'required',
        ]);

        if ($request->hasFile('owner_voice')) {
            foreach ($request->file('owner_voice') as $index => $image) {
                $path = $image->store('voice', 'public');
                $updatedImages[$index] = $path;
            }

            $ownerData->owner_voice     = json_encode($updatedImages);
            $ownerData->save();

            return back()->with('success', 'Owner Voice updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateOwnerData(Request $request, $id)
    {

        $request->validate([
            'insured_version_acc' => 'nullable',
            'insured_occupation' => 'nullable',
            'rc_owner_name' => 'nullable',
            'vehicle_no' => 'nullable|string|max:50',
            'made_make' => 'nullable',
            'engine_no' => 'nullable|string|max:50',
            'chass_no' => 'nullable|string|max:50',
            'class_of_vehicle' => 'nullable|string|max:100',
            'details_opp_vehicle' => 'nullable|string',
            'permit_details' => 'nullable|string',
            'owner_opp_vehicle' => 'nullable|string',
            'fitness_validity_from' => 'nullable',
            'fitness_validity_to' => 'nullable',
            'polution_validity_from' => 'nullable',
            'polution_validity_to' => 'nullable',
            'doa_in_policy' => 'nullable',
            'policy_comper_tp_liability' => 'nullable',
            'if_goodladen_details' => 'nullable',
            'damage_goods_transport' => 'nullable',
            'details_damage_vehicle' => 'nullable',
            'insured_advocate' => 'nullable',
            'accused_admited_offence' => 'nullable',
            'type_license' => 'nullable',
            'vehicle_auth_drive' => 'nullable',
            'mismatch_vehicle_in_dl' => 'nullable',
            'insured_advocate_num' => 'nullable',
            'all_liability_covered' => 'nullable',
            'is_close_proximity' => 'nullable',
            'rc_owner_insurer_same' => 'nullable',
            'victim_is_employee' => 'nullable',
            'reg_valid_doa' => 'nullable',
            'fitness_valid_doa' => 'nullable',
            'valid_permit_doa' => 'nullable',
            'any_violation_route_permit' => 'nullable',
            'opp_party_insurer_name' => 'nullable',
            'opp_party_policy_no' => 'nullable',
            'is_opp_party_liabile' => 'nullable',
            'opp_party_period_insurance' => 'nullable',
            'opp_part_class_vehicle' => 'nullable',
            'opp_party_rc_owner' => 'nullable',
            'opp_engine_no' => 'nullable',
            'opp_chassis_no' => 'nullable',
            'cc_vehicle' => 'nullable',
            'opp_party_cc_vehicle' => 'nullable',
            'address_mobile_accused' => 'nullable',
            'accused_dl_vaild_doa' => 'nullable',
            'rel_accused_insured' => 'nullable',
            'opp_driver_dl_valid' => 'nullable',
            'accused_accident_before' => 'nullable',
            'dl_no_owner' => 'nullable',
            'dl_no_opp_vehicle' => 'nullable',
            'opp_party_class_vehicle_auth_drive' => 'nullable',
            'accused_first_issue_nt' => 'nullable',
            'opp_party_first_issue_nt' => 'nullable',
            'nt_validity__accused' => 'nullable',
            'nt_validity_opp_party' => 'nullable',
            'badge_no_accused' => 'nullable',
            'badge_no_opp_party' => 'nullable',
            'accused_tv_first_issue' => 'nullable',
            'opp_party_tv_first_issue' => 'nullable',
            'accused_transport_validity' => 'nullable',
            'opp_party_transport_validity' => 'nullable',
            'interact_no' => 'nullable',
            'accident_hapn_nat_hoilday' => 'nullable',
            'date_claim_intimated' => 'nullable',
            'reason_late_intimation' => 'nullable',
            'insured_profession' => 'nullable',
            'is_neg_area_address' => 'nullable',
            'pan_no_owner' => 'nullable',
            'aadhar_no_owner' => 'nullable',
            'hyp_details' => 'nullable',
            'vehicle_damages' => 'nullable',
            'comercl_vehicle_details' => 'nullable',
            'material_loss_accidnt' => 'nullable',
            'material_quantity' => 'nullable',
            'is_load_recept_available' => 'nullable',
            'fitness_details' => 'nullable',
            'area_covered' => 'nullable',
            'prev_insurer' => 'nullable',
            'prev_policy_no' => 'nullable',
            'policy_detl' => 'nullable',
            'any_clain_in_prev_policy' => 'nullable',
            'is_prev_claim_photo_available' => 'nullable',
            'social_status'=>'nullable'
        ]);
        $owner = OwnerData::findOrFail($id);
        
       $updated= $owner->update([
            'insured_version_acc' => $request->insured_version_acc,
            'insured_occupation' => $request->insured_occupation,
            'rc_owner_name' => $request->rc_owner_name,
            'vehicle_no' => $request->vehicle_no,
            'made_make' => $request->made_make,
            'engine_no' => $request->engine_no,
            'chass_no' => $request->chass_no,
            'class_of_vehicle' => $request->class_of_vehicle,
            'details_opp_vehicle' => $request->details_opp_vehicle,
            'permit_details' => $request->permit_details,
            'owner_opp_vehicle' => $request->owner_opp_vehicle,
            'fitness_validity_from' => $request->fitness_validity_from,
            'fitness_validity_to' => $request->fitness_validity_to,
            'polution_validity_from' => $request->polution_validity_from,
            'polution_validity_to' => $request->polution_validity_to,
            'doa_in_policy' => $request->doa_in_policy,
            'policy_comper_tp_liability' => $request->policy_comper_tp_liability,
            'if_goodladen_details' => $request->if_goodladen_details,
            'damage_goods_transport' => $request->damage_goods_transport,
            'details_damage_vehicle' => $request->details_damage_vehicle,
            'insured_advocate' => $request->insured_advocate,
            'accused_admited_offence' => $request->accused_admited_offence,
            'type_license' => $request->type_license,
            'vehicle_auth_drive' => $request->vehicle_auth_drive,
            'mismatch_vehicle_in_dl' => $request->mismatch_vehicle_in_dl,
            'insured_advocate_num' => $request->insured_advocate_num,
            'all_liability_covered' => $request->all_liability_covered,
            'is_close_proximity' => $request->is_close_proximity,
            'rc_owner_insurer_same' => $request->rc_owner_insurer_same,
            'victim_is_employee' => $request->victim_is_employee,
            'reg_valid_doa' => $request->reg_valid_doa,
            'fitness_valid_doa' => $request->fitness_valid_doa,
            'valid_permit_doa' => $request->valid_permit_doa,
            'any_violation_route_permit' => $request->any_violation_route_permit,
            'opp_party_insurer_name' => $request->opp_party_insurer_name,
            'opp_party_policy_no' => $request->opp_party_policy_no,
            'is_opp_party_liabile' => $request->is_opp_party_liabile,
            'opp_party_period_insurance' => $request->opp_party_period_insurance,
            'opp_part_class_vehicle' => $request->opp_part_class_vehicle,
            'opp_party_rc_owner' => $request->opp_party_rc_owner,
            'opp_engine_no' => $request->opp_engine_no,
            'opp_chassis_no' => $request->opp_chassis_no,
            'cc_vehicle' => $request->cc_vehicle,
            'opp_party_cc_vehicle' => $request->opp_party_cc_vehicle,
            'address_mobile_accused' => $request->address_mobile_accused,
            'accused_dl_vaild_doa' => $request->accused_dl_vaild_doa,
            'rel_accused_insured' => $request->rel_accused_insured,
            'opp_driver_dl_valid' => $request->opp_driver_dl_valid,
            'accused_accident_before' => $request->accused_accident_before,
            'dl_no_owner' => $request->dl_no_owner,
            'dl_no_opp_vehicle' => $request->dl_no_opp_vehicle,
            'opp_party_class_vehicle_auth_drive' => $request->opp_party_class_vehicle_auth_drive,
            'accused_first_issue_nt' => $request->accused_first_issue_nt,
            'opp_party_first_issue_nt' => $request->opp_party_first_issue_nt,
            'nt_validity__accused' => $request->nt_validity__accused,
            'nt_validity_opp_party' => $request->nt_validity_opp_party,
            'badge_no_accused' => $request->badge_no_accused,
            'badge_no_opp_party' => $request->badge_no_opp_party,
            'accused_tv_first_issue' => $request->accused_tv_first_issue,
            'opp_party_tv_first_issue' => $request->opp_party_tv_first_issue,
            'accused_transport_validity' => $request->accused_transport_validity,
            'opp_party_transport_validity' => $request->opp_party_transport_validity,
            'interact_no' => $request->interact_no,
            'accident_hapn_nat_hoilday' => $request->accident_hapn_nat_hoilday,
            'date_claim_intimated' => $request->date_claim_intimated,
            'reason_late_intimation' => $request->reason_late_intimation,
            'insured_profession' => $request->insured_profession,
            'is_neg_area_address' => $request->is_neg_area_address,
            'pan_no_owner' => $request->pan_no_owner,
            'aadhar_no_owner' => $request->aadhar_no_owner,
            'hyp_details' => $request->hyp_details,
            'vehicle_damages' => $request->vehicle_damages,
            'comercl_vehicle_details' => $request->comercl_vehicle_details,
            'material_loss_accidnt' => $request->material_loss_accidnt,
            'material_quantity' => $request->material_quantity,
            'is_load_recept_available' => $request->is_load_recept_available,
            'fitness_details' => $request->fitness_details,
            'area_covered' => $request->area_covered,
            'prev_insurer' => $request->prev_insurer,
            'prev_policy_no' => $request->prev_policy_no,
            'policy_detl' => $request->policy_detl,
            'any_clain_in_prev_policy' => $request->any_clain_in_prev_policy,
            'is_prev_claim_photo_available' => $request->is_prev_claim_photo_available,
            'social_status'=>$request->social_status
        ]);

       

        return back()->with('success', 'Owner data updated successfully!');
    }

    public function ownerSpecialCase($id)
    {
        $accidentData = OwnerData::findOrFail($id);
        $accidentData->sp_case = 1;
        $accidentData->save();
        return back()->with('success', 'Owner section data Reasigned successfully!');
    }

    //API

    public function uploadOwnerImageVideoVoice(Request $request, $id)
    {

        Validator::make($request->all(), [
            'owner_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'owner_report.*' => 'nullable|mimes:pdf,zip',
            'owner_voice.*' => 'nullable',
            'owner_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        ]);


        $ownerData = OwnerData::findOrFail($id);
        $allDownloads = [];


        foreach (['owner_images', 'owner_report', 'owner_voice', 'owner_video_call'] as $field) {

            if ($request->hasFile($field)) {

                foreach ($request->file($field) as $file) {
                    $path = $file->store('owner_downloads', 'public');
                    $allDownloads[] = $path;
                }
            }
        }


        if (!empty($allDownloads)) {
            $ownerData->owner_downloads = json_encode($allDownloads);
            $ownerData->save();
        }

        return response()->json(['data' => 'Data Successfully Saved'], 200);
    }
}
