<?php

namespace App\Http\Controllers;

use App\Models\GarageData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class GarageUpdateController extends Controller
{
    public function updateGarageGateEntryImages(Request $request, $id)
    {
        $garage = GarageData::findOrFail($id);

        Validator::make($request->all(), [
            'garage_gate_entry_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('garage_gate_entry_images')) {
            foreach ($request->file('garage_gate_entry_images') as $index => $image) {
                $path = $image->store('garage_gate_entry', 'public');
                $updatedImages[$index] = $path;
            }

            $garage->garage_gate_entry_images = json_encode($updatedImages);
            $garage->save();


            return back()->with('success', 'Garage Gate Entry images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateGarageJobCardImages(Request $request, $id)
    {
        $garage = GarageData::findOrFail($id);

        Validator::make($request->all(), [
            'garage_job_card_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('garage_job_card_images')) {
            foreach ($request->file('garage_job_card_images') as $index => $image) {
                $path = $image->store('garage_job_card', 'public');
                $updatedImages[$index] = $path;
            }
            $garage->garage_job_card_images = json_encode($updatedImages);
            $garage->save();

            return back()->with('success', 'Garage Job Card updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateGarageVehicleImages(Request $request, $id)
    {
        $garage = GarageData::findOrFail($id);

        Validator::make($request->all(), [
            'vehicle_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('vehicle_images')) {
            foreach ($request->file('vehicle_images') as $index => $image) {
                $path = $image->store('vehicle', 'public');
                $updatedImages[$index] = $path;
            }
            $garage->vehicle_images = json_encode($updatedImages);
            $garage->save();

            return back()->with('success', 'Vehicle images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateGarageTowVehicleReport(Request $request, $id)
    {
        $garage = GarageData::findOrFail($id);

        Validator::make($request->all(), [
            'tow_vehical_report.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('tow_vehical_report')) {
            foreach ($request->file('tow_vehical_report') as $index => $image) {
                $path = $image->store('tow_vehicle', 'public');
                $updatedImages[$index] = $path;
            }
            $garage->tow_vehical_report = json_encode($updatedImages);
            $garage->save();

            return back()->with('success', 'Tow Vehical Report updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateGarageVoice(Request $request, $id)
    {
        $garage = GarageData::findOrFail($id);

        Validator::make($request->all(), [
        'garage_voice.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('garage_voice')) {
        foreach ($request->file('garage_voice') as $index => $image) {
        $path = $image->store('voice', 'public');
        $updatedImages[$index] = $path;
        }
        $garage->garage_voice = json_encode($updatedImages);
        $garage->save();

        return back()->with('success', 'Garage Voice updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateGarageData(Request $request, $id)
    {
        $request->validate([
            'garage_gate_entry' => 'nullable|string',
            'garage_job_card' => 'nullable|string',
            'is_fitness_particular_collected' => 'nullable|boolean',
            'is_permit_particular_collected' => 'nullable|boolean',
            'is_dl_particular_collected' => 'nullable|boolean',
            'is_any_motor_occurance' => 'nullable|boolean',
            'no_vehicle_involved_acident' => 'nullable|string',
            'damage_consist_with_accident' => 'nullable|string',
            'victum_occupant_or_pillion' => 'nullable|boolean',
            'victim_employee_insured' => 'nullable|boolean',
            'victim_owner_or_employee' => 'nullable|boolean',
            'victim_travel_on_load_body' => 'nullable|boolean',
            'vehicle_involve_other_accident' => 'nullable|boolean',
            'gross_vehicle_weight' => 'nullable|string',
            'date_vehicle_reg' => 'nullable|date',
            'vehicle_reg_validity' => 'nullable|date',
            'issuing_authority_vehicle' => 'nullable|string',
            'fitness_validity_opposite_vehicle' => 'nullable|date',
            'fitness_validity_vehicle' => 'nullable|date',
            'permit_no_vehicle' => 'nullable|string',
            'permit_no_opposit_vehicle' => 'nullable|string',
            'issuing_authority__opposite_vehicle' => 'nullable|string',
            'type_permit_vehicle' => 'nullable|string',
            'type_permit_opposite_vehicle' => 'nullable|string',
            'authorized_route_vehicle' => 'nullable|string',
            'authorized_route_opposit_vehicle' => 'nullable|string',
            'permit_validity_vehicle' => 'nullable|date',
            'permit_validity_opposite_vehicle' => 'nullable|date',

            'is_break_in' => 'nullable',
            'break_in_ins_date' => 'nullable|date',
            'odometer_readng_break_in' => 'nullable|numeric',
            'is_any_discre_found_break_in' => 'nullable',
            'is_accused_elgible_drive' => 'nullable',
            'travel_from_to' => 'nullable|string|max:255',
            'clue_aout_accident' => 'nullable|string|max:255',
            'car_scrap_found_on_spot' => 'nullable',
            'garage_name' => 'nullable|string|max:255',
            'odometer_reading_service_hist' => 'nullable',
            'tp_vehicle_details' => 'nullable|string|max:255',
            'is_any_disc_in_garage_entry_job_crd' => 'nullable',
            'investi_referal_reson_1' => 'nullable|string|max:255',
            'referal_findings_1' => 'nullable|string|max:255',
            'investi_referal_rason2' => 'nullable|string|max:255',
            'referal_findings_2' => 'nullable|string|max:255',
        ]);

        $garage = GarageData::findOrFail($id);

        $garage->update([
            'garage_gate_entry' => $request->garage_gate_entry,
            'garage_job_card' => $request->garage_job_card,
            'is_fitness_particular_collected' => $request->is_fitness_particular_collected,
            'is_permit_particular_collected' => $request->is_permit_particular_collected,
            'is_dl_particular_collected' => $request->is_dl_particular_collected,
            'is_any_motor_occurance' => $request->is_any_motor_occurance,
            'no_vehicle_involved_acident' => $request->no_vehicle_involved_acident,
            'damage_consist_with_accident' => $request->damage_consist_with_accident,
            'victim_occupant_or_pillion' => $request->victim_occupant_or_pillion,
            'victim_employee_insured' => $request->victim_employee_insured,
            'victim_owner_or_employee' => $request->victim_owner_or_employee,
            'victim_travel_on_load_body' => $request->victim_travel_on_load_body,
            'vehicle_involve_other_accident' => $request->vehicle_involve_other_accident,
            'gross_vehicle_weight' => $request->gross_vehicle_weight,
            'date_vehicle_reg' => $request->date_vehicle_reg,
            'vehicle_reg_validity' => $request->vehicle_reg_validity,
            'issuing_authority_vehicle' => $request->issuing_authority_vehicle,
            'fitness_validity_opposite_vehicle' => $request->fitness_validity_opposite_vehicle,
            'fitness_validity_vehicle' => $request->fitness_validity_vehicle,
            'permit_no_vehicle' => $request->permit_no_vehicle,
            'permit_no_opposit_vehicle' => $request->permit_no_opposit_vehicle,
            'issuing_authority__opposite_vehicle' => $request->issuing_authority__opposite_vehicle,
            'type_permit_vehicle' => $request->type_permit_vehicle,
            'type_permit_opposite_vehicle' => $request->type_permit_opposite_vehicle,
            'authorized_route_vehicle' => $request->authorized_route_vehicle,
            'authorized_route_opposit_vehicle' => $request->authorized_route_opposit_vehicle,
            'permit_validity_vehicle' => $request->permit_validity_vehicle,
            'permit_validity_opposite_vehicle' => $request->permit_validity_opposite_vehicle,
            'is_break_in' => $request->is_break_in,
            'break_in_ins_date' => $request->break_in_ins_date,
            'odometer_readng_break_in' => $request->odometer_readng_break_in,
            'is_any_discre_found_break_in' => $request->is_any_discre_found_break_in,
            'is_accused_elgible_drive' => $request->is_accused_elgible_drive,
            'travel_from_to' => $request->travel_from_to,
            'clue_aout_accident' => $request->clue_aout_accident,
            'car_scrap_found_on_spot' => $request->car_scrap_found_on_spot,
            'garage_name' => $request->garage_name,
            'odometer_reading_service_hist' => $request->odometer_reading_service_hist,
            'tp_vehicle_details' => $request->tp_vehicle_details,
            'is_any_disc_in_garage_entry_job_crd' => $request->is_any_disc_in_garage_entry_job_crd,
            'investi_referal_reson_1' => $request->investi_referal_reson_1,
            'referal_findings_1' => $request->referal_findings_1,
            'investi_referal_rason2' => $request->investi_referal_rason2,
            'referal_findings_2' => $request->referal_findings_2,
        ]);

        return back()->with('success', 'Garage information updated successfully!');
    }


    public function updateGarageDatanew22(Request $request)
    {
    $selectedId = $request->input('selected') ?? $request->input('selected_gate') ?? $request->input('selected_job') ?? $request->input('selected_fitness')?? 
    $request->input('selected_permits')?? $request->input('selected_particulars')?? $request->input('selected_motors');

    if(!$selectedId) 
    {
    return back()->withErrors(['error' => 'Please select a garage record to update.']);
    }

    $garage = GarageData::findOrFail($selectedId);

    // Update based on available field
    if ($request->has("garage_gate_entry.$selectedId")) 
    {
    $garage->garage_gate_entry = $request->garage_gate_entry[$selectedId];
    }

    if ($request->has("garage_job_card.$selectedId")) 
    {
    $garage->garage_job_card = $request->garage_job_card[$selectedId];
    }

    if ($request->has("is_fitness_particular_collected.$selectedId")) 
    {
    $garage->is_fitness_particular_collected = $request->is_fitness_particular_collected[$selectedId];
    }
    if ($request->has("is_permit_particular_collected.$selectedId")) 
    {
    $garage->is_permit_particular_collected = $request->is_permit_particular_collected[$selectedId];
    }

    if ($request->has("is_dl_particular_collected.$selectedId")) 
    {
    $garage->is_dl_particular_collected = $request->is_dl_particular_collected[$selectedId];
    }

    if ($request->has("is_any_motor_occurance.$selectedId")) 
    {
    $garage->is_any_motor_occurance = $request->is_any_motor_occurance[$selectedId];
    }

    $garage->save();

    return back()->with('success', 'Garage data updated successfully!');
    }


    public function updateGarageDatanew(Request $request)
    {

        // $selected = $request->input('selected_field');

        // if(!$selected || !str_contains($selected, ':')) 
        // {
        // return back()->withErrors(['error' => 'Please select a garage record to update.']);
        // }

        // [$fieldName, $garageId] = explode(':', $selected);

        // $garage = GarageData::findOrFail($garageId);

        // $inputKey = "field_value.$garageId.$fieldName";

        // if ($request->hasFile($inputKey)) 
        // {
        // $file = $request->file($inputKey);
        // $path = $file->store('garage_uploads', 'public');
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

        // return back()->with('success', 'Garage Data Updated Successfully!');


        $selected = $request->input('selected_field');

        if (!$selected || !str_contains($selected, ':')) {
            return back()->withErrors(['error' => 'Please select a garage record to update.']);
        }

        [$fieldName, $garageId] = explode(':', $selected);

        // Sanitize column name
        $fieldName = preg_replace('/[^a-zA-Z0-9_]/', '', $fieldName);

        $garage = GarageData::findOrFail($garageId);

        $inputKey = "field_value.$garageId.$fieldName";
        $otherKey = "other_value.$garageId.$fieldName";

        $finalValue = null;

        // Handle file input
        if ($request->hasFile($inputKey)) {
            $file = $request->file($inputKey);
            $path = $file->store('garage_uploads', 'public');
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

        // Dynamically create the column if it doesn't exist
        // if (!Schema::hasColumn('garage_data', $fieldName)) {
        //     Schema::table('garage_data', function (Blueprint $table) use ($fieldName) {
        //         $table->string($fieldName)->nullable();
        //     });
        // }

        // Update the garage data
        $garage->$fieldName = $finalValue;
        $garage->save();

        return back()->with('success', 'Garage Data Updated Successfully!');
}


    // public function updateGarageDatanew(Request $request)
    // {
    // $selected = $request->input('selected_field');

    // if (!$selected || !str_contains($selected, ':')) 
    // {
    //     return back()->withErrors(['error' => 'Please select a garage record to update.']);
    // }

    // list($garageId, $fieldName) = explode(':', $selected);

    // $garage = GarageData::findOrFail($garageId);

    // $fieldData = $request->input("field_value");

    // if (!isset($fieldData[$garageId][$fieldName])) 
    // {
    //     return back()->withErrors(['error' => 'Invalid input submitted.']);
    // }

    // $value = $fieldData[$garageId][$fieldName];

    // if ($request->hasFile("field_value.$garageId.$fieldName")) {
    //     $file = $request->file("field_value.$garageId.$fieldName");
    //     $filePath = $file->store('uploads', 'public');
    //     $garage->$fieldName = $filePath;
    // } 
    // else 
    // {
    //     $garage->$fieldName = $value;
    // }

    // $garage->save();

    // return back()->with('success', 'Garage data updated successfully!');
    // }


    public function garageSpecialCase($id)
    {
        $accidentData = GarageData::findOrFail($id);
        $accidentData->sp_case = 1;
        $accidentData->save();
        return back()->with('success', 'Garage section data Reasigned successfully!');
    }

    //Api
    public function uploadGarageImageVideoVoice(Request $request, $id)
    {

        Validator::make($request->all(), [
            'garage_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'garage_report.*' => 'nullable|mimes:pdf,zip',
            'garage_voice.*' => 'nullable',
            'garage_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        ]);


        $garageData = GarageData::findOrFail($id);
        $allDownloads = [];


        foreach (['garage_images', 'garage_report', 'garage_voice', 'garage_video_call'] as $field) {

            if ($request->hasFile($field)) {

                foreach ($request->file($field) as $file) {
                    $path = $file->store('garage_downloads', 'public');
                    $allDownloads[] = $path;
                }
            }
        }


        if (!empty($allDownloads)) {
            $garageData->garage_downloads = json_encode($allDownloads);
            $garageData->save();
        }

        return response()->json(['data' => 'Data Successfully Saved'], 200);
    }
}
