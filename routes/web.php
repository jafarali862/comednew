<?php

use App\Http\Controllers\LoginWithOTPController;
use App\Http\Controllers\SocialiteController;
use Illuminate\Support\Str;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\API\WebController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\ExecutiveController;
use App\Http\Controllers\SpotUpdateController;
use App\Http\Controllers\FieldAddingController;
use App\Http\Controllers\FinalReportController;
use App\Http\Controllers\OwnerUpdateController;
use App\Http\Controllers\DriverUpdateController;
use App\Http\Controllers\GarageUpdateController;
use App\Http\Controllers\AccidentUpdateController;
use App\Http\Controllers\CaseAssignmentController;
use App\Http\Controllers\Executive\CaseController;
use App\Http\Controllers\ReportGenerateController;
use App\Http\Controllers\InsuranceCustomerController;
use App\Http\Controllers\LogoManagenentController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});


//Auth
Route::middleware(["guest"])->group(function () {
    Route::get("/login", [AuthController::class, "loginForm"])->name("login.form");
    Route::post("/login", [AuthController::class, "login"])->name("login");
    Route::get("/register", [AuthController::class, "registerForm"])->name("register.form");
    Route::post("/register", [AuthController::class, "register"])->name("register");
});



Route::middleware(["web.auth"])->group(function () {

    //Dashboard
    Route::get("/home", [AuthController::class, "dashboard"])->name("dashboard");

    //Admin Access URL
    Route::middleware(['role:1'])->group(function () {
        //User
        Route::get("/all-user", [UserController::class, "index"])->name("user.list");
        Route::get("/add-user", [UserController::class, "create"])->name("user.create");
        Route::post("/save-user", [UserController::class, "store"])->name("user.store");
        Route::get("/edit-user/{id}", [UserController::class, "edit"])->name("user.edit");
        Route::post("/update-user", [UserController::class, "update"])->name("user.update");
        Route::post("/user-active-change", [UserController::class, "userActiveChange"])->name("user.active.change");
        Route::get("/approval-request", [UserController::class,"approval"])->name("approval.request");
        Route::post('/approve/{id}', [UserController::class,"approve"])->name("approval.request.update");

        //Company
        Route::get("/all-company", [CompanyController::class, "index"])->name("company.list");
        Route::get("/add-company", [CompanyController::class, "create"])->name("company.create");
        Route::post("/save-company", [CompanyController::class, "store"])->name("companies.store");
        Route::get("/edit-company/{id}", [CompanyController::class, "edit"])->name("companies.edit");
        Route::post("/update-company", [CompanyController::class, "update"])->name("company.update");

        // Questiionnaire
        Route::get("/add-questionnaire", [CompanyController::class, "create_question"])->name("company.create_question");
        Route::post("/save-questionnaire", [CompanyController::class, "store_question"])->name("companies.store_question");
        // Route::post("/save-questionnaire", [CompanyController::class, "store_questionpdf"])->name("companies.store_question");

        Route::get('/questions', [CompanyController::class, 'index_question'])->name('questions.index_question');
        Route::get('/questions/{id}/edit', [CompanyController::class, 'edit_question'])->name('questions.edit_question');
        Route::put('/questions/{id}', [CompanyController::class, 'update_question'])->name('questions.update_question');
        Route::delete('/questions/{id}', [CompanyController::class, 'destroy_question'])->name('questions.destroy_question');
        Route::get('/questions/{category}', [CompanyController::class, 'getQuestionsByCategory']);

        //Insurance Customer
        Route::get('/add-insurance-customer', [InsuranceCustomerController::class, 'create'])->name('insurance.create');
        Route::post('/add-insurance-customer', [InsuranceCustomerController::class, 'store'])->name('insurance.store');

        //Case
        Route::get('/all-case', [InsuranceCustomerController::class, 'index'])->name('case.index');

        Route::get('/today-case', [InsuranceCustomerController::class, 'todaycase'])->name('case.today');
        Route::get('/fake-case', [CaseAssignmentController::class, 'fakeCase'])->name('fake.cases');

        // Route::get('/assign-case/{customer}', [InsuranceCustomerController::class, 'showAssignForm'])->name('assign.case');
        Route::get('/case/view/{id}', [InsuranceCustomerController::class, 'view'])->name('view.case');
        Route::get('/case-assign/view/{id}', [CaseAssignmentController::class, 'view'])->name('view.case_assignment');

        //Asign the case
        Route::get('/assign-case/{id}', [CaseAssignmentController::class, 'create'])->name('assign.case');
        Route::post('/assign-case', [CaseAssignmentController::class, 'store'])->name('store.case');
        Route::get('/assigned-case', [CaseAssignmentController::class, 'assignedCase'])->name('assigned.case');
        Route::get('/case-re-assign/{id}', [CaseAssignmentController::class,'reAssign'])->name('re.assign.case');
        Route::post('/case-re-assign', [CaseAssignmentController::class,'reAssignUpdate'])->name('re.assign.update');
        Route::get('/case-edit/{id}', [InsuranceCustomerController::class,'edit'])->name('case.edit');
        Route::put('/case-update/{id}', [InsuranceCustomerController::class,'update'])->name('case.update');

        //Report 
        Route::get('/request-report', [ReportGenerateController::class, 'requestReport'])->name('request.report');
        Route::get('/request-report-view/{id}', [ReportGenerateController::class, 'requestReportView'])->name('request.report.view');

        // Fake data
        Route::post('/insurance/fake-data', [InsuranceCustomerController::class, 'markFakeData'])->name('insurance.fake.data');

        //Final Report
        Route::get('/final-report-create', [FinalReportController::class, 'index'])->name('final.report.create');
        Route::post('/final-report-download', [FinalReportController::class, 'createFinalPdfDownload'])->name('final.report.download');
        // Route::get('/final-report/preview/{reportId}', [FinalReportController::class, 'preview'])->name('final.report.preview');
       
       // test
        Route::get('/test-list', [FinalReportController::class, 'testList'])->name('test.list');

        //Report Re-Assign
        Route::post('/garage-re-assign', [ReportGenerateController::class, 'garageReAssign'])->name('garage.re.assign');
        Route::post('/driver-re-assign', [ReportGenerateController::class, 'driverReAssign'])->name('driver.re.assign');
        Route::post('/spot-re-assign', [ReportGenerateController::class, 'spotReAssign'])->name('spot.re.assign');
        Route::post('/owner-re-assign', [ReportGenerateController::class, 'ownerReAssign'])->name('owner.re.assign');
        Route::post('/accident-person-re-assign', [ReportGenerateController::class, 'accidentPersonReAssign'])->name('accident.person.re.assign');

        Route::get('/odometer-list', [ExecutiveController::class, 'odometerList'])->name('odometer.list');
        Route::get('/odometer-view/{id}', [ExecutiveController::class, 'view'])->name('odometer.view');

        //Password Reset 

        Route::get('/password-reset-request', [UserController::class, 'passwordResetRequest'])->name('password.reset.request');
        Route::get('/password-reset-edit/{id}', [UserController::class, 'passwordResetEdit'])->name('password.reset.edit');
        Route::post('/password-reset-update/{id}', [UserController::class, 'passwordResetUpdate'])->name('password.reset.update');
        Route::post('/password-reset-reject/{id}', [UserController::class, 'passwordResetReject'])->name('password.reset.reject');
        Route::get('/all-password-reset-request', [UserController::class, 'allPasswordRestRequest'])->name('all.password.reset.request');

        //Salary
        Route::get('/create-salary', [ExecutiveController::class, 'salaryCreate'])->name('salary.create');
        Route::post('/salary-store', [ExecutiveController::class, 'salaryStore'])->name('salary.store');
        Route::get('/salary-list', [ExecutiveController::class, 'salaryIndex'])->name('salary.index');

        //Field Addition
        Route::resource('field-addition',FieldAddingController::class);
        // Route::get('/auto-save-answers', [CompanyController::class, 'fetchAndInsert']);
      
        // routes/web.php
        Route::get('/templates/create', [CompanyController::class, 'create_templates'])->name('templates.create_templates');
        Route::post('/templates', [CompanyController::class, 'store_templates'])->name('templates.store_templates');
        Route::get('/templates', [CompanyController::class, 'list_templates'])->name('templates.list_templates');
        Route::get('/templates/{template}/edit', [CompanyController::class, 'edit_templates'])->name('templates.edit_templates');
        Route::post('/templates/{template}/update', [CompanyController::class, 'update_templates'])->name('templates.update_templates');


        // Route::get('/reports/{id}/preview', [CompanyController::class, 'preview'])->name('report.preview');
        // Route::get('/reports/{report_id}/preview-pdf', [CompanyController::class, 'previewFinalPdf'])->name('report.previewFinalPdf');

        //driver  update

        Route::post('/driver/{id}/update-ration-card', [DriverUpdateController::class, 'updateRationCardImages'])->name('driver.update.ration.card');
        Route::post('/driver/{id}/update-vehicle-permit', [DriverUpdateController::class, 'updateVehiclePermit'])->name('driver.update.vehicle.permit');
        Route::post('/driver/{id}/update-video-call', [DriverUpdateController::class, 'updateVideoCall'])->name('driver.update.video_call');
        Route::post('/driver/{id}/update-assets-pic', [DriverUpdateController::class, 'updateAssetsPic'])->name('driver.update.assets_pic');
        Route::post('/driver/{id}/update-driver-image', [DriverUpdateController::class, 'updateDriverImage'])->name('driver.update.driver_image');
        Route::post('/driver/{id}/driving_licence_images', [DriverUpdateController::class, 'updateDrivingLicenceImages'])->name('driver.update.driver_licence_images');
        Route::post('/driver/{id}/rc_images', [DriverUpdateController::class, 'updateRcImages'])->name('driver.update.rc_images');
        Route::post('/driver/{id}/driver_aadhaar_card_images', [DriverUpdateController::class, 'updateDriverAadhaarCardImages'])->name('driver.update.driver_aadhaar_card_images');
        Route::post('/driver/{id}/driver_co_passenger_dl', [DriverUpdateController::class, 'updateDriverCoPassengerDl'])->name('driver.update.co_passenger_dl');
        Route::post('/driver/{id}/driver_co_passenger_aadhar', [DriverUpdateController::class, 'updateDriverCoPassengerAadhar'])->name('driver.update.co_passenger_aadhar');
        Route::post('/driver/{id}/driver_voice', [DriverUpdateController::class, 'updateDriverVoice'])->name('driver.update.driver_voice');
        Route::put('/driver/{id}/driver_text_update', [DriverUpdateController::class, 'updateDriverData'])->name('driver.text.update');
        Route::get('/driver/{id}', [DriverUpdateController::class, 'driverSpecialCase'])->name('driver-special-case');

        //garage  update
        Route::post('/garage/{id}/update-garage-gate-entry', [GarageUpdateController::class, 'updateGarageGateEntryImages'])->name('garage.update.gate_entry_image');
        Route::post('/garage/{id}/update-garage-job-card-images', [GarageUpdateController::class, 'updateGarageJobCardImages'])->name('garage.update.job_card_image');
        Route::post('/garage/{id}/update-garage-garage-vehicle_images', [GarageUpdateController::class, 'updateGarageVehicleImages'])->name('garage.update.vehicle_images');
        Route::post('/garage/{id}/update-garage-tow-vehical-report', [GarageUpdateController::class, 'updateGarageTowVehicleReport'])->name('garage.update.tow_vehical_report');
        Route::post('/garage/{id}/update-garage-voice', [GarageUpdateController::class, 'updateGarageVoice'])->name('garage.update.garage_voice');
        Route::put('/garage/{id}/garage-text-update', [GarageUpdateController::class, 'updateGarageData'])->name('garage.text.update');

    //  My Updation
        Route::post('/garage/garage-text-update', [GarageUpdateController::class, 'updateGarageDatanew'])->name('garage.text.update_new');
        Route::post('/driver/driver-text-update', [DriverUpdateController::class, 'updateDriverDatanew'])->name('driver.text.update_new');
        Route::post('/spot/spot-text-update', [SpotUpdateController::class, 'updateSpotDatanew'])->name('spot.text.update_new');
        Route::post('/owner/owner-text-update', [OwnerUpdateController::class, 'updateOwnerDatanew'])->name('owner.text.update_new');
        Route::post('/accident/accident-text-update', [AccidentUpdateController::class, 'updateAccidentDatanew'])->name('accident.text.update_new');

        //Owner section Reasign
        Route::get('/garage/{id}', [GarageUpdateController::class, 'garageSpecialCase'])->name('garrage-special-case');

        //Spot  update
        Route::post('/spot/{id}/update-spot-images', [SpotUpdateController::class, 'updateSpotImages'])->name('spot.update.spot_images');
        Route::post('/spot/{id}/update-spot-voices', [SpotUpdateController::class, 'updateSpotVoices'])->name('spot.update.spot_voice');
        Route::put('/spot/{id}/update-text-update', [SpotUpdateController::class, 'updateSpotData'])->name('spot.text.update');

        //Owner section Reasign
        Route::get('/spot/{id}', [SpotUpdateController::class, 'spotSpecialCase'])->name('spot-special-case');

        //Owner  update
        Route::post('/owner/{id}/update-owner-statment-images', [OwnerUpdateController::class, 'updateOwnerWrittenStatmentImages'])->name('owner.update.written_statment_images');
        Route::post('/owner/{id}/update-owner-aadhar-images', [OwnerUpdateController::class, 'updateOwnerAadharImage'])->name('owner.update.aadhaar_card_images');
        Route::post('/owner/{id}/update-owner-ration-card-images', [OwnerUpdateController::class, 'updateOwnerRationCardImage'])->name('owner.update.ration_card_images');
        Route::post('/owner/{id}/update-owner-driving-lic-images', [OwnerUpdateController::class, 'updateOwnerDrivingLic'])->name('owner.update.driving_lic_images');
        Route::post('/owner/{id}/update-owner-voice', [OwnerUpdateController::class, 'updateOwnerVoice'])->name('owner.update.owner_voice');
        Route::put('/owner/{id}/update-owner-text', [OwnerUpdateController::class, 'updateOwnerData'])->name('owner.update.owner_data');

         //Owner section Reasign
         Route::get('/owner/{id}', [OwnerUpdateController::class, 'ownerSpecialCase'])->name('owner-special-case');

       //Accident  update
        Route::post('/accident/{id}/update-accident-person-images', [AccidentUpdateController::class, 'updateAccidentPersonImages'])->name('accident.update.person_images');
        Route::post('/accident/{id}/update-accident-person-medical-report', [AccidentUpdateController::class, 'updateAccidentPersonMedicalReport'])->name('accident.update.medical_report');
        Route::post('/accident/{id}/update-accident-person-hospital-report', [AccidentUpdateController::class, 'updateAccidentPersonHospitalReport'])->name('accident.update.hospital_report');
        Route::post('/accident/{id}/update-accident-person-ration-card', [AccidentUpdateController::class, 'updateAccidentPersonRationCard'])->name('accident.update.ration_card');
        Route::post('/accident/{id}/update-accident-person-aadhar-card', [AccidentUpdateController::class, 'updateAccidentPersonAadharCard'])->name('accident.update.aadhar_card');
        Route::post('/accident/{id}/update-accident-person-written-statement', [AccidentUpdateController::class, 'updateAccidentPersonWrittenStatement'])->name('accident.update.written_statment_images');
        Route::post('/accident/{id}/update-accident-person-voice', [AccidentUpdateController::class, 'updateAccidentPersonVoice'])->name('accident.update.accident_person_voice');
        Route::put('/accident/{id}/update-accident-person-data', [AccidentUpdateController::class, 'updateAccidentPersonData'])->name('accident.update.accident_data');
        Route::post('/accident/{id}/update-gd-report', [AccidentUpdateController::class, 'updateAccidentPersonGdReport'])->name('accident.update.gd_pdf');

        //Accident section Reasign
        Route::get('/accident/{id}', [AccidentUpdateController::class, 'accidentSpecialCase'])->name('accident-special-case');

        //logo Management
        Route::get('/logos', [LogoManagenentController::class, 'index'])->name('logos');
        Route::get('/logo', [LogoManagenentController::class, 'getLogo'])->name('logo');
        Route::post('/logo/store', [LogoManagenentController::class, 'storeLogo'])->name('logo.store');
        Route::get('/logo/{id}/edit', [LogoManagenentController::class, 'editLogo'])->name('logo.edit');
        Route::put('/logo/{id}/update', [LogoManagenentController::class, 'updateLogo'])->name('logo.update');

        //Final Report
        Route::post('/garage/save-selected', [ReportGenerateController::class, 'saveGarageSelected'])->name('garage.save.selected');
        Route::post('/garage/save-selected-images', [ReportGenerateController::class, 'saveGarageSelectedImages'])->name('garage.save.selected.images');

        Route::post('/driver/save-selected', [ReportGenerateController::class, 'saveDriverSelected'])->name('driver.save.selected');
        Route::post('/driver/save-selected-images', [ReportGenerateController::class, 'saveDriverSelectedImages'])->name('driver.save.selected.images');

        Route::post('/spot/save-selected', [ReportGenerateController::class, 'saveSpotSelected'])->name('spot.save.selected');
        Route::post('/spot/save-selected-images', [ReportGenerateController::class, 'saveSpotSelectedImages'])->name('spot.save.selected.images');

        Route::post('/owner/save-selected', [ReportGenerateController::class, 'saveOwnerSelected'])->name('owner.save.selected');
        Route::post('/owner/save-selected-images', [ReportGenerateController::class, 'saveOwnerSelectedImages'])->name('owner.save.selected.images');

        Route::post('/accident/save-selected', [ReportGenerateController::class, 'saveAccidentSelected'])->name('accident.save.selected');
        Route::post('/accident/save-selected-images', [ReportGenerateController::class, 'saveAccidentSelectedImages'])->name('accident.save.selected.images');

    });
    //Sub Admin Access URL
    Route::middleware(['role:2,1'])->group(function () {
        //Case
        Route::get('/all-case', [InsuranceCustomerController::class, 'index'])->name('case.index');

        //Asign the case
        Route::get('/assign-case/{id}', [CaseAssignmentController::class, 'create'])->name('assign.case');
        Route::post('/assign-case', [CaseAssignmentController::class, 'store'])->name('store.case');
        Route::get('/assigned-case', [CaseAssignmentController::class, 'assignedCase'])->name('assigned.case');
        Route::get('/case-re-assign/{id}', [CaseAssignmentController::class,'reAssign'])->name('re.assign.case');
        Route::post('/case-re-assign', [CaseAssignmentController::class,'reAssignUpdate'])->name('re.assign.update');

        //Report 
        Route::get('/request-report', [ReportGenerateController::class, 'requestReport'])->name('request.report');
        Route::get('/request-report-view/{id}', [ReportGenerateController::class, 'requestReportView'])->name('request.report.view');

        //Report Re-Assign
        Route::post('/garage-re-assign', [ReportGenerateController::class, 'garageReAssign'])->name('garage.re.assign');
        Route::post('/driver-re-assign', [ReportGenerateController::class, 'driverReAssign'])->name('driver.re.assign');
        Route::post('/spot-re-assign', [ReportGenerateController::class, 'spotReAssign'])->name('spot.re.assign');
        Route::post('/owner-re-assign', [ReportGenerateController::class, 'ownerReAssign'])->name('owner.re.assign');
        Route::post('/accident-person-re-assign', [ReportGenerateController::class, 'accidentPersonReAssign'])->name('accident.person.re.assign');
      
    });

    //Executive Access URL
    Route::middleware(['role:3'])->group(function () {
        Route::get('/all-cases', [CaseController::class,'index'])->name('executive.case.list');
    });

    Route::get('/unauthorized', function () {
        return response()->view('errors.403', [], 403);
    });

    //Logout
    Route::post("/logout", [AuthController::class, "logout"])->name("logout");
});

//For Mobile Web 
Route::get('/report-mobile/{id}', [WebController::class, 'report'])->name('report.name');
Route::get('/salary-report/{id}', [WebController::class, 'salaryReport'])->name('salary.report');
Route::get('/today-record/{id}', [WebController::class, 'todayRecord'])->name('today.record');
Route::get('/monthly-record/{id}', [WebController::class, 'monthlyRecord'])->name('monthly.record');
Route::get('/executive-help-support', [WebController::class, 'helpSupport'])->name('help.support');
Route::get('/mobile-odometer-list/{id}', [WebController::class, 'odometer'])->name('mobile.odometer');


