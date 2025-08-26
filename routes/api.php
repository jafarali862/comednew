<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CaseController;
use App\Http\Controllers\API\LogoController;
use App\Http\Controllers\SpotUpdateController;
use App\Http\Controllers\OwnerUpdateController;
use App\Http\Controllers\DriverUpdateController;
use App\Http\Controllers\GarageUpdateController;
use App\Http\Controllers\API\ExecutiveController;
use App\Http\Controllers\AccidentUpdateController;
use App\Http\Controllers\API\FileUpdateController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post("/login", [AuthController::class, "login"]);

Route::middleware(['auth:api', 'check.token', 'checkLoginRequest', 'checkUserStatus'])->group(function () {

    //Case List And Submit Case
    Route::get("/all-cases", [CaseController::class, "allCaseList"])->name("all.case.list");
    Route::post('/garage-post/{case_id}', [CaseController::class, 'garageStore'])->name('garage.store');
    Route::post('/driver-post/{case_id}', [CaseController::class, 'driverStore'])->name('driver.store');
    Route::post('/spot-post/{case_id}', [CaseController::class, 'spotStore'])->name('spot.store');
    Route::post('/owner-post/{case_id}', [CaseController::class, 'ownerStore'])->name('owner.store');
    Route::post('/accident-person-post/{case_id}', [CaseController::class, 'accidentPersonStore'])->name('accident.person.store');

    //Odometer
    Route::post('/check-in/{id}', [ExecutiveController::class, 'checkIn'])->name('executive.check.in');
    Route::post('/check-out/{id}', [ExecutiveController::class, 'checkOut'])->name('executive.check.out');
    Route::get('/check-in-data', [ExecutiveController::class, 'checkInData'])->name('check.in.data');

    //Password Reset Request
    Route::post('/password-rest-request', [ExecutiveController::class, 'passwordResetRequest'])->name('password.rest.request.save');

    //Timeline
    Route::get('/time-line', [ExecutiveController::class, 'timeline'])->name('executive.timeline');

    //Chart - Report
    Route::get('/weekly-chart', [ExecutiveController::class, 'weeklyChart'])->name('executive.weekly.chart');
    Route::get('/monthly-chart', [ExecutiveController::class, 'monthlyChart'])->name('executive.monthly.chart');
    
    //Logout
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/dynamic-insert', [CaseController::class, 'store']);

    Route::post('/save-questiondata', [CaseController::class, 'storequestion']);
    Route::get('/test', [ExecutiveController::class, 'test']);

    //Logo 
    Route::get('/get-logo', [LogoController::class, 'index'])->name('get-logo');
    Route::post('/post-logo', [LogoController::class, 'store'])->name('post-logo');
    Route::get('/assign-work-data/{assign_id}',[CaseController::class, 'getAssignedWorks'])->name('assign-work-data');

    // Accident Api Update
    // Route::post('/accident-update/{id}', [AccidentUpdateController::class, 'uploadAccidentImageVideoVoice'])->name('accident.update');
    
    // driver Api Update
    // Route::post('/driver-update/{id}', [DriverUpdateController::class, 'uploadDriverImageVideoVoice'])->name('driver.update');

    // Owner Api Update
    // Route::post('/owner-update/{id}', [OwnerUpdateController::class, 'uploadOwnerImageVideoVoice'])->name('owner.update');

    // Garage Api Update
    // Route::post('/garage-update/{id}', [GarageUpdateController::class, 'uploadGarageImageVideoVoice'])->name('garage.update');

    //Spot Api Update
    // Route::post('/spot-update/{id}', [SpotUpdateController::class, 'uploadSpotImageVideoVoice'])->name('spot.update');

    //Special cases
    Route::get("/all-special-cases", [CaseController::class, "specialCaseList"])->name("all-specialcase-list");

    //file updater Api
    Route::post('/files-update', [FileUpdateController::class, 'uploadFileImageVideoVoice'])->name('file.update');


    // Spot Data
    Route::get('/spot-form-config/{id}', [CaseController::class, 'getSpotFormConfig'])->name('spot.config');
    Route::get('/garage-form-config/{id}', [CaseController::class, 'getGarageFormConfig'])->name('garage.config');

    Route::get('/insurance-company/{id}/questionnaire', [CaseController::class, 'getQuestionnaire']);

    
});


