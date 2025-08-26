<?php

namespace App\Http\Controllers\API;

use App\Models\SpotData;
use App\Models\OwnerData;
use App\Models\DriverData;
use App\Models\GarageData;
use Illuminate\Http\Request;
use App\Models\AccidentPersonData;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class FileUpdateController extends Controller
{
    public function uploadFileImageVideoVoice(Request $request)
    {
    
        Validator::make($request->all(), [
        'owner_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        'owner_report.*' => 'nullable|mimes:pdf,zip',
        'owner_voice.*' => 'nullable',
        'owner_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        'garage_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        'garage_report.*' => 'nullable|mimes:pdf,zip',
        'garage_voice.*' => 'nullable',
        'garage_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        'driver_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        'driver_report.*' => 'nullable|mimes:pdf,zip',
        'driver_voice.*' => 'nullable',
        'driver_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        'accident_person_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        'accident_medical_report.*' => 'nullable|mimes:pdf,zip',
        'accident_person_voice.*' => 'nullable',
        'accident_video.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        'spot_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        'spot_report.*' => 'nullable|mimes:pdf,zip',
        'spot_voice.*' => 'nullable',
        'spot_video_call.*' => 'nullable|mimes:mp4,avi,mov,wmv,mkv',
        'accident_id'=>'nullable', 
        'spot_id'=>'nullable',
        'driver_id'=>'nullable',
        'garage_id'=>'nullable',
        'owner_id'=>'nullable',     
    ]);


    if($request->owner_id!==null){
        $ownerData = OwnerData::findOrFail($request->owner_id);
        $allDownloads = [];

        if($ownerData)
        {
            foreach (['owner_images', 'owner_report', 'owner_voice','owner_video_call'] as $field) {
            
                if ($request->hasFile($field)) {
                    
                    foreach ($request->file($field) as $file) {
                        $path = $file->store('owner_downloads', 'public');
                        $allDownloads[] = $path;
                    }
                }
            }
        
        
            if (!empty($allDownloads)) {
                $ownerData->owner_downloads = json_encode($allDownloads);
                $ownerData->sp_case= null;
                $ownerData->save();
            }
        }
    }    
   

    if($request->garage_id!==null)
    {
       
        $garageData = GarageData::findOrFail($request->garage_id);
        $allDownloads = [];

        if($garageData){
    
            foreach (['garage_images', 'garage_report', 'garage_voice','garage_video_call'] as $field) {
            
                if ($request->hasFile($field)) {
                    
                    foreach ($request->file($field) as $file) {
                        $path = $file->store('garage_downloads', 'public');
                        $allDownloads[] = $path;
                    }
                }
            }
        
        
            if (!empty($allDownloads)) {
                $garageData->garage_downloads = json_encode($allDownloads);
                $garageData->sp_case= null;
                $garageData->save();
            }
        }
    }

      
      if($request->driver_id!==null){
            
            
            $driverData = DriverData::findOrFail($request->driver_id);
            $allDownloads = [];

            if($driverData){
                foreach (['driver_images', 'driver_report', 'driver_voice','driver_video_call'] as $field) {
                    
                    if ($request->hasFile($field)) {
                        
                        foreach ($request->file($field) as $file) {
                            $path = $file->store('driver_downloads', 'public');
                            $allDownloads[] = $path;
                        }
                    }
                }

            
                if (!empty($allDownloads)) {
                    $driverData->driver_downloads = json_encode($allDownloads);
                    $driverData->sp_case= null;
                    $driverData->save();
                }
            }
        }


  if($request->accident_id!==null){
    $accidentData = AccidentPersonData::findOrFail($request->accident_id);
    $allDownloads = [];

    if($accidentData){
        foreach (['accident_person_images', 'accident_medical_report','accident_video', 'accident_person_voice'] as $field) {
            
            if ($request->hasFile($field)) {
                
                foreach ($request->file($field) as $file) {
                    $path = $file->store('accident_downloads', 'public');
                    $allDownloads[] = $path;
                }
            }
        }

    
        if (!empty($allDownloads)) {
            $accidentData->accident_downloads = json_encode($allDownloads);
            $accidentData->sp_case= null;
            $accidentData->save();
        }
    }
  }

    if($request->spot_id!==null){
            $spotData = SpotData::findOrFail($request->spot_id);
            $allDownloads = [];

            if($spotData){
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
                    $spotData->sp_case= null;
                    $spotData->save();
                }
            }
    }
    return response()->json(['data' => 'Data Successfully Saved'], 200);
  }
}
