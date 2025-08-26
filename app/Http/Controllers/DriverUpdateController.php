<?php

namespace App\Http\Controllers;

use App\Models\DriverData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class DriverUpdateController extends Controller
{

    public function updateRationCardImages(Request $request, $id)
    {
        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_images')) {
            foreach ($request->file('updated_images') as $index => $image) {
                $path = $image->store('driver_ration_card', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->ration_card = json_encode($updatedImages);
            $driver->save();


            return back()->with('success', 'Ration card images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateVehiclePermit(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_images_permit.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_images_permit')) {
            foreach ($request->file('updated_images_permit') as $index => $image) {
                $path = $image->store('vehicle_permit', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->vehicle_permit = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Permit  images updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateVideoCall(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_video_call.*' => 'required|mimes:mp4,avi,mov,wmv,mkv',
        ]);

        if ($request->hasFile('updated_video_call')) {
            foreach ($request->file('updated_video_call') as $index => $image) {
                $path = $image->store('video_call', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->video_call = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Video Call updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateAssetsPic(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_assets_pic.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_assets_pic')) {
            foreach ($request->file('updated_assets_pic') as $index => $image) {
                $path = $image->store('assets', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->assets_pic = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Asset Picture updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }



    public function updateDriverDatanew(Request $request)
    {

        // $selected = $request->input('selected_field');

        // if(!$selected || !str_contains($selected, ':')) 
        // {
        // return back()->withErrors(['error' => 'Please select a driver record to update.']);
        // }

        // [$fieldName, $garageId] = explode(':', $selected);

        // $garage = DriverData::findOrFail($garageId);

        // $inputKey = "field_value.$garageId.$fieldName";

        // if ($request->hasFile($inputKey)) 
        // {
        // $file = $request->file($inputKey);
        // $path = $file->store('driver_uploads', 'public');
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

        // return back()->with('success', 'Driver Data Updated Successfully!');


        $selected = $request->input('selected_field');

        if (!$selected || !str_contains($selected, ':')) {
            return back()->withErrors(['error' => 'Please select a driver record to update.']);
        }

        [$fieldName, $garageId] = explode(':', $selected);

        // Sanitize column name
        $fieldName = preg_replace('/[^a-zA-Z0-9_]/', '', $fieldName);

        $garage = DriverData::findOrFail($garageId);

        $inputKey = "field_value.$garageId.$fieldName";
        $otherKey = "other_value.$garageId.$fieldName";

        $finalValue = null;

        // Handle file input
        if ($request->hasFile($inputKey)) {
            $file = $request->file($inputKey);
            $path = $file->store('driver_uploads', 'public');
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

        return back()->with('success', 'Driver Data Updated Successfully!');

    }


    public function updateDriverImage(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_driver_image.*' => 'requiredimage|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_driver_image')) {
            foreach ($request->file('updated_driver_image') as $index => $image) {
                $path = $image->store('driver', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->driver_image = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Driver Image updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateDrivingLicenceImages(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_driver_licence_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_driving_licence_images')) {
            foreach ($request->file('updated_driving_licence_images') as $index => $image) {
                $path = $image->store('driving_licence', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->driving_licence_images = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Driver Licence updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateRcImages(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_rc_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_rc_images')) {
            foreach ($request->file('updated_rc_images') as $index => $image) {
                $path = $image->store('rc', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->rc_images = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'RC image updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateDriverAadhaarCardImages(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_driver_aadhaar_card_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_driver_aadhaar_card_images')) {
            foreach ($request->file('updated_driver_aadhaar_card_images') as $index => $image) {
                $path = $image->store('aadhaar', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->driver_aadhaar_card_images = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Aadhar image updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateDriverCoPassengerDl(Request $request, $id)
    {
        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_co_passenger_dl.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_co_passenger_dl')) {
            foreach ($request->file('updated_co_passenger_dl') as $index => $image) {
                $path = $image->store('co_passenger_dl', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->co_passenger_dl = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Co-passenger Driving Licence image updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateDriverCoPassengerAadhar(Request $request, $id)
    {
        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_co_passenger_aadhar.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        if ($request->hasFile('updated_co_passenger_aadhar')) {
            foreach ($request->file('updated_co_passenger_aadhar') as $index => $image) {
                $path = $image->store('co_passenger_aadhar', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->co_passenger_aadhar = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Co-passenger Driving Licence image updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }


    public function updateDriverVoice(Request $request, $id)
    {

        $driver = DriverData::findOrFail($id);

        Validator::make($request->all(), [
            'updated_driver_voice.*' => 'nullable',
        ]);

        if ($request->hasFile('updated_driver_voice')) {
            foreach ($request->file('updated_driver_voice') as $index => $image) {
                $path = $image->store('voice', 'public');
                $updatedImages[$index] = $path;
            }

            $driver->driver_voice = json_encode($updatedImages);
            $driver->save();
            return back()->with('success', 'Driver Voice updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }


    public function updateDriverData(Request $request, $id)
    {
        
        $request->validate([
            'driver_name' => 'nullable|string|max:255',
            'assign_work_id' => 'nullable',
            'vehical_type' => 'nullable|string|max:255',
            'rc_reg_date' => 'nullable|date',
            'rc_exp_date' => 'nullable|date',
            'dl_exp_date' => 'nullable|date',
            'rider_version_accident' => 'nullable|string',
            'dl_and_rto' => 'nullable|string',
            'vehicle_authorized_drive' => 'nullable|boolean',
            'others' => 'nullable|string',
            'seating_capacity' => 'nullable',
            'opp_vehicle_insurer' => 'nullable|string',
            'opp_vehicle_reg_no' => 'nullable|string',
            'opp_vehicle_made_make' => 'nullable|string',
            'opp_insured_name' => 'nullable|string',
            'opp_insured_policy_no' => 'nullable|string',
            'opp_party_insurance_start_date' => 'nullable|date',
            'opp_party_insurance_end_date' => 'nullable|date',
            'addres_opp_party' => 'nullable|string',
            'opp_rc_transfered_to' => 'nullable|string',
            'opp_rc_transfered_date' => 'nullable|date',
            'owner_rc_transfered_to' => 'nullable|string',
            'owner_rc_transfered_date' => 'nullable|date',
            'opp_vehicle_seating_capacity' => 'nullable|integer',
            'opp_vehicle_eng_no' => 'nullable|string',
            'opp_vehicle_chassis_no' => 'nullable|string',
            'owner_permit_no' => 'nullable|string',
            'opp_party_permit_no' => 'nullable|string',
            'owner_authorized_state' => 'nullable|string',
            'opp_party_authorized_state' => 'nullable|string',
            'owner_permit_period_validity' => 'nullable',
            'opp_party_permit_period_validity' => 'nullable',
            'owner_permit_verified' => 'nullable',
            'opp_party_permit_verified' => 'nullable',
            'badge_val_from'=> 'nullable',
            'badge_val_to'=> 'nullable',
            'driver_age'=> 'nullable',
            'driver_dob'=> 'nullable'
        ]);


        $driver = DriverData::findOrFail($id);

        $driver->update([
            'driver_name' => $request->input('driver_name'),
            'vehical_type' => $request->input('vehical_type'),
            'rc_reg_date' => $request->input('rc_reg_date'),
            'rc_exp_date' => $request->input('rc_exp_date'),
            'dl_exp_date' => $request->input('dl_exp_date'),
            'rider_version_accident' => $request->input('rider_version_accident'),
            'dl_and_rto' => $request->input('dl_and_rto'),
            'vehicle_authorized_drive' => $request->input('vehicle_authorized_drive'),
            'others' => $request->input('others'),
            'seating_capacity' => $request->input('seating_capacity'),
            'opp_vehicle_insurer' => $request->input('opp_vehicle_insurer'),
            'opp_vehicle_reg_no' => $request->input('opp_vehicle_reg_no'),
            'opp_vehicle_made_make' => $request->input('opp_vehicle_made_make'),
            'opp_insured_name' => $request->input('opp_insured_name'),
            'opp_insured_policy_no' => $request->input('opp_insured_policy_no'),
            'opp_party_insurance_start_date' => $request->input('opp_party_insurance_start_date'),
            'opp_party_insurance_end_date' => $request->input('opp_party_insurance_end_date'),
            'addres_opp_party' => $request->input('addres_opp_party'),
            'opp_rc_transfered_to' => $request->input('opp_rc_transfered_to'),
            'opp_rc_transfered_date' => $request->input('opp_rc_transfered_date'),
            'owner_rc_transfered_to' => $request->input('owner_rc_transfered_to'),
            'owner_rc_transfered_date' => $request->input('owner_rc_transfered_date'),
            'opp_vehicle_seating_capacity' => $request->input('opp_vehicle_seating_capacity'),
            'opp_vehicle_eng_no' => $request->input('opp_vehicle_eng_no'),
            'opp_vehicle_chassis_no' => $request->input('opp_vehicle_chassis_no'),
            'owner_permit_no' => $request->input('owner_permit_no'),
            'opp_party_permit_no' => $request->input('opp_party_permit_no'),
            'owner_authorized_state' => $request->input('owner_authorized_state'),
            'opp_party_authorized_state' => $request->input('opp_party_authorized_state'),
            'owner_permit_period_validity' => $request->input('owner_permit_period_validity'),
            'opp_party_permit_period_validity' => $request->input('opp_party_permit_period_validity'),
            'owner_permit_verified' => $request->input('owner_permit_verified'),
            'opp_party_permit_verified' => $request->input('opp_party_permit_verified'),
            'badge_val_from'=>$request->badge_val_from,
            'badge_val_to'=>$request->badge_val_to,
            'driver_age'=>$request->driver_age,
            'driver_dob'=>$request->driver_dob
        ]);

        // Redirect with a success message
        return back()->with('success', 'Driver information updated successfully!');
    }

    //API

    public function uploadDriverImageVideoVoice(Request $request, $id)
    {

        Validator::make($request->all(), [
            'driver_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'driver_report.*' => 'nullable|mimes:pdf,zip',
            'driver_voice.*' => 'nullable',
            'driver_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        ]);


        $driverData = DriverData::findOrFail($id);
        $allDownloads = [];


        foreach (['driver_images', 'driver_report', 'driver_voice', 'driver_video_call'] as $field) {

            if ($request->hasFile($field)) {

                foreach ($request->file($field) as $file) {
                    $path = $file->store('driver_downloads', 'public');
                    $allDownloads[] = $path;
                }
            }
        }


        if (!empty($allDownloads)) {
            $driverData->driver_downloads = json_encode($allDownloads);
            $driverData->save();
        }

        return response()->json(['data' => 'Data Successfully Saved'], 200);
    }


    public function driverSpecialCase($id)
    {
        $driverData = DriverData::findOrFail($id);
        $driverData->sp_case = 1;
        $driverData->save();
        return back()->with('success', 'Driver section data Reasigned successfully!');
    }
}
