@extends('dashboard.layout.app')
@section('title', 'Add Company')

@section('content')
    <div class="container-fluid">
        <div class="text-right">
            <button class="btn btn-danger mr-2 mb-2" onclick="window.history.back()"><i class="fa fa-arrow-left"
                    aria-hidden="true"></i></button>
            <button class="btn btn-warning mr-2 mb-2" onclick="window.location.reload()"><i class="fa fa-spinner"
                    aria-hidden="true"></i></button>
            <a href="{{ route('company.list') }}" class="btn btn-primary mr-2 mb-2">
                <i class="fa fa-list" aria-hidden="true"></i>
            </a>
        </div>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header">
                        <h4>Add Company</h4>
                    </div>
                    <div id="successMessage" class="alert alert-success" style="display: none;"></div>
                    <div class="card-body">
                        <form action="{{ route('companies.store') }}" method="POST" id="companyForm">
                            @csrf
                            <div class="form-group">
                                <label for="name">Company Name</label> <span class="text-danger">*</span>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="contact_person">Contact Person</label> <span class="text-danger">*</span>
                                <input type="text" class="form-control" id="contact_person" name="contact_person"
                                    required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number</label> <span class="text-danger">*</span>
                                <input type="tel" class="form-control" id="phone" name="phone" required>
                                <span class="text-danger" id="phone-error"></span>
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label> <span class="text-danger">*</span>
                                <input type="email" class="form-control" id="email" name="email" required>
                                <span class="text-danger" id="email-error"></span>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label> <span class="text-danger">*</span>
                                <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                            </div>


                    <!-- Insurance Type Tabs -->
                    <ul class="nav nav-tabs" id="insuranceTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="garage-tab" data-bs-toggle="tab" data-bs-target="#garage" type="button" role="tab">Garage Data</button>
                    </li>
                    <li class="nav-item" role="presentation">
                    <button class="nav-link" id="driver-tab" data-bs-toggle="tab" data-bs-target="#driver" type="button" role="tab">Driver Data</button>
                    </li>
                    <li class="nav-item" role="presentation">
                    <button class="nav-link" id="spot-tab" data-bs-toggle="tab" data-bs-target="#spot" type="button" role="tab">Spot Data</button>
                    </li>

                     <li class="nav-item" role="presentation">
                    <button class="nav-link" id="meeting-tab" data-bs-toggle="tab" data-bs-target="#meeting" type="button" role="tab">Owner Data</button>
                    </li>

                    <li class="nav-item" role="presentation">
                    <button class="nav-link" id="accident-tab" data-bs-toggle="tab" data-bs-target="#accident" type="button" role="tab">Accident Data</button>
                    </li>

                    </ul>

                    <!-- Tab Content -->
                    <div class="tab-content p-3 border border-top-0 mb-4" id="insuranceTabsContent">
           
                    <div class="tab-pane fade show active" id="garage" role="tabpanel" aria-labelledby="garage-tab">
                    <h5>Garage Data Insurance Questionnaire</h5>
                    
                     
                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_gate_entry" id="check_garage_gate_entry">

                    <input type="hidden" name="question_types[garage][garage_gate_entry]" value="text">
                    <label class="form-check-label" for="check_garage_gate_entry">
                   Garage Gate Entry?
                    </label>
                   
                    </div>


                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_job_card" id="check_garage_job_card">

                    <input type="hidden" name="question_types[garage][garage_job_card]" value="text">
                    <label class="form-check-label" for="check_garage_job_card">
                 Garage Job Card?
                    </label>
                   
                    </div>

                       <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="fitness_collected" id="check_fitness_collected">

                    <input type="hidden" name="question_types[garage][fitness_collected]" value="select">
                    <label class="form-check-label" for="check_fitness_collected">
               Is Fitness Particular Collected?
                    </label>
                   
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="permit_collected" id="check_permit_collected">

                    <input type="hidden" name="question_types[garage][permit_collected]" value="select">
                    <label class="form-check-label" for="check_permit_collected">
                    Is Permit Particular Collected?
                    </label>

                    </div>
                
                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="particular_collected" id="check_particular_collected">

                    <input type="hidden" name="question_types[garage][particular_collected]" value="select">
                    <label class="form-check-label" for="check_particular_collected">
                 Is DL Particular Collected?
                    </label>

                    </div>


                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="motor_occurance" id="check_motor_occurance">

                    <input type="hidden" name="question_types[garage][motor_occurance]" value="select">
                    <label class="form-check-label" for="check_motor_occurance">
                  Is Any Motor Occurrence?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_accident" id="check_vehicle_accident">

                    <input type="hidden" name="question_types[garage][vehicle_accident]" value="select">
                    <label class="form-check-label" for="check_vehicle_accident">
               No Vehicle Involved in Accident
                    </label>

                    </div>

                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="motor_damage" id="check_damage">

                    <input type="hidden" name="question_types[garage][motor_damage]" value="textarea">
                    <label class="form-check-label" for="check_damage">
                 Damage Consist with Accident?
                    </label>

                    </div>

                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="victim_pillion" id="check_victim_pillion">

                    <input type="hidden" name="question_types[garage][victim_pillion]" value="select">
                    <label class="form-check-label" for="check_victim_pillion">
                 Victim Occupant or Pillion?
                    </label>

                    </div>

                       <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="victim_employee" id="check_victim_employee">

                    <input type="hidden" name="question_types[garage][victim_employee]" value="select">
                    <label class="form-check-label" for="check_victim_employee">
                Victim Employee Insured?
                    </label>

                    </div>

                    
                       <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="victim_owner_emp" id="check_victim_owner_emp">

                    <input type="hidden" name="question_types[garage][victim_owner_emp]" value="select">
                    <label class="form-check-label" for="check_victim_owner_emp">
            Victim Owner or Employee?
                    </label>

                    </div>

                       <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="victim_travel" id="check_victim_travel">

                    <input type="hidden" name="question_types[garage][victim_travel]" value="select">
                    <label class="form-check-label" for="check_victim_travel">
            Victim Travel on Load Body?
                    </label>

                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_involved_accident"
                    id="check_vehicle_involved_accident">

                    <input type="hidden" name="question_types[garage][vehicle_involved_accident]" value="select">
                    <label class="form-check-label" for="check_vehicle_involved_accident">
                    Vehicle Involved in Other Accident?
                    </label>

                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_weight"
                    id="check_vehicle_weight">

                    <input type="hidden" name="question_types[garage][vehicle_weight]" value="text">
                    <label class="form-check-label" for="check_vehicle_weight">
                    Gross Vehicle Weight?
                    </label>

                    </div>
                    
                    
                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_reg_date"
                    id="check_vehicle_reg_date">

                    <input type="hidden" name="question_types[garage][vehicle_reg_date]" value="text">
                    <label class="form-check-label" for="check_vehicle_reg_date">
                    Date Vehicle Registered?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_reg_validity"
                    id="check_vehicle_reg_validity">

                    <input type="hidden" name="question_types[garage][vehicle_reg_validity]" value="text">
                    <label class="form-check-label" for="check_vehicle_reg_validity">
                    Vehicle Registration Validity?
                    </label>

                    </div>

                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_authority"
                    id="check_vehicle_authority">

                    <input type="hidden" name="question_types[garage][vehicle_authority]" value="text">
                    <label class="form-check-label" for="check_vehicle_authority">
                  Issuing Authority Vehicle?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_fitness_validity_opposite"
                    id="check_vehicle_fitness_validity_opposite">

                    <input type="hidden" name="question_types[garage][vehicle_fitness_validity_opposite]" value="text">
                    <label class="form-check-label" for="check_vehicle_fitness_validity_opposite">
                 Fitness Validity Opposite Vehicle?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_fitness_validity"
                    id="check_vehicle_fitness_validity">

                    <input type="hidden" name="question_types[garage][vehicle_fitness_validity]" value="text">
                    <label class="form-check-label" for="check_vehicle_fitness_validity">
                 Fitness Validity Vehicle?
                    </label>

                    </div>

                    
                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_permit_no"
                    id="check_vehicle_permit_no">

                    <input type="hidden" name="question_types[garage][vehicle_permit_no]" value="text">
                    <label class="form-check-label" for="check_vehicle_permit_no">
                Permit No Vehicle?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_permit_opposite_no"
                    id="check_vehicle_permit_opposite_no">

                    <input type="hidden" name="question_types[garage][vehicle_permit_opposite_no]" value="text">
                    <label class="form-check-label" for="check_vehicle_permit_opposite_no">
               Permit No Opposite Vehicle?
                    </label>

                    </div>

                        <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="issuing_authority_opposite_vehicle"
                    id="check_issuing_authority_opposite_vehicle">

                    <input type="hidden" name="question_types[garage][issuing_authority_opposite_vehicle]" value="text">
                    <label class="form-check-label" for="check_issuing_authority_opposite_vehicle">
              Issuing Authority Opposite Vehicle?
                    </label>

                    </div>

                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_permit_type"
                    id="check_vehicle_permit_type">

                    <input type="hidden" name="question_types[garage][vehicle_permit_type]" value="select">
                    <label class="form-check-label" for="check_vehicle_permit_type">
                    Type Permit Vehicle?
                    </label>

                    </div>


                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_opposite_permit_type"
                    id="check_vehicle_opposite_permit_type">

                    <input type="hidden" name="question_types[garage][vehicle_opposite_permit_type]" value="select">
                    <label class="form-check-label" for="check_vehicle_opposite_permit_type">
                    Type Permit Opposite Vehicle?
                    </label>

                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="authorized_route_vehicle"
                    id="check_authorized_route_vehicle">

                    <input type="hidden" name="question_types[garage][authorized_route_vehicle]" value="text">
                    <label class="form-check-label" for="check_authorized_route_vehicle">
                   Authorized Route Vehicle?
                    </label>

                    </div>


                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="authorized_route_vehicle_opposite"
                    id="check_authorized_route_vehicle_opposite">

                    <input type="hidden" name="question_types[garage][authorized_route_vehicle_opposite]" value="text">
                    <label class="form-check-label" for="check_authorized_route_vehicle_opposite">
                   Authorized Route Opposite Vehicle?
                    </label>

                    </div>


                        <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_permit_validity"
                    id="check_vehicle_permit_validity">

                    <input type="hidden" name="question_types[garage][vehicle_permit_validity]" value="text">
                    <label class="form-check-label" for="check_vehicle_permit_validity">
                   Permit Validity Vehicle?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_permit_validity_opposite"
                    id="check_vehicle_permit_validity_opposite">

                    <input type="hidden" name="question_types[garage][vehicle_permit_validity_opposite]" value="text">
                    <label class="form-check-label" for="check_vehicle_permit_validity_opposite">
                  Permit Validity Opposite Vehicle?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_break_in"
                    id="check_vehicle_break_in">

                    <input type="hidden" name="question_types[garage][vehicle_break_in]" value="select">
                    <label class="form-check-label" for="check_vehicle_break_in">
                  Is Break In?
                    </label>

                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_break_inspection_date"
                    id="check_vehicle_break_inspection_date">

                    <input type="hidden" name="question_types[garage][vehicle_break_inspection_date]" value="date">
                    <label class="form-check-label" for="check_vehicle_break_inspection_date">
                    Break In Inspection Date?
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="vehicle_odometer_reading_break_in"
                    id="check_vehicle_odometer_reading_break_in">

                    <input type="hidden" name="question_types[garage][vehicle_odometer_reading_break_in]" value="select">
                    <label class="form-check-label" for="check_vehicle_odometer_reading_break_in">
                    Odometer Reading at Break In?
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="discrepancy_break_in"
                    id="check_discrepancy_break_in">

                    <input type="hidden" name="question_types[garage][discrepancy_break_in]" value="select">
                    <label class="form-check-label" for="check_discrepancy_break_in">
                    Any Discrepancy Found at Break In?
                    </label>
                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="travel_from_to"
                    id="check_travel_from_to">

                    <input type="hidden" name="question_types[garage][travel_from_to]" value="textarea">
                    <label class="form-check-label" for="check_travel_from_to">
                   Travel From To?
                    </label>
                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="clue_about_accident"
                    id="check_clue_about_accident">

                    <input type="hidden" name="question_types[garage][check_clue_about_accident]" value="textarea">
                    <label class="form-check-label" for="check_clue_about_accident">
                   Clue About Accident?
                    </label>
                    </div>

                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="car_scrap_spot"
                    id="check_car_scrap_spot">

                    <input type="hidden" name="question_types[garage][car_scrap_spot]" value="select">
                    <label class="form-check-label" for="check_car_scrap_spot">
                  Car Scrap Found on Spot?

                    </label>
                    </div>

                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_name"
                    id="check_garage_name">

                    <input type="hidden" name="question_types[garage][garage_name]" value="text">
                    <label class="form-check-label" for="check_garage_name">
                        Garage Name?
                    </label>
                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="odometer_reading_service_history"
                    id="check_odometer_reading_service_history">

                    <input type="hidden" name="question_types[garage][odometer_reading_service_history]" value="textarea">
                    <label class="form-check-label" for="check_odometer_reading_service_history">
                     Odometer Reading from Service History?
                    </label>
                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="third_party_vehicle_details"
                    id="check_third_party_vehicle_details">

                    <input type="hidden" name="question_types[garage][third_party_vehicle_details]" value="textarea">
                    <label class="form-check-label" for="check_third_party_vehicle_details">
                     Third Party Vehicle Details?
                    </label>
                    </div>

                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="discrepancy_garage_entry_job_card"
                    id="check_discrepancy_garage_entry_job_card">

                    <input type="hidden" name="question_types[garage][discrepancy_garage_entry_job_card]" value="select">
                    <label class="form-check-label" for="check_discrepancy_garage_entry_job_card">
                     Any Discrepancy in Garage Entry Job Card?
                    </label>
                    </div>

                       <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="investigation_referral_reason_1"
                    id="check_investigation_referral_reason_1">

                    <input type="hidden" name="question_types[garage][investigation_referral_reason_1]" value="textarea">
                    <label class="form-check-label" for="check_investigation_referral_reason_1">
                    Investigation Referral Reason 1:
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="referral_findings_1"
                    id="check_referral_findings_1">

                    <input type="hidden" name="question_types[garage][referral_findings_1]" value="textarea">
                    <label class="form-check-label" for="check_referral_findings_1">
                   Referral Findings 1:
                    </label>
                    </div>


                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="investigation_referral_reason_2"
                    id="check_investigation_referral_reason_2">

                    <input type="hidden" name="question_types[garage][investigation_referral_reason_2]" value="textarea">
                    <label class="form-check-label" for="check_investigation_referral_reason_2">
                    Investigation Referral Reason 2:
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="referral_findings_2"
                    id="check_referral_findings_2">

                    <input type="hidden" name="question_types[garage][referral_findings_2]" value="textarea">
                    <label class="form-check-label" for="check_referral_findings_2">
                   Referral Findings 2:
                    </label>
                    </div>


                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_gate_entry_images"
                    id="check_garage_gate_entry_images">

                    <input type="hidden" name="question_types[garage][garage_gate_entry_images]" value="file">
                    <label class="form-check-label" for="check_garage_gate_entry_images">
                  Garage Gate Entry Images
                    </label>
                    </div>
                    


                      <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_job_card_images"
                    id="check_garage_job_card_images">

                    <input type="hidden" name="question_types[garage][garage_job_card_images]" value="file">
                    <label class="form-check-label" for="check_garage_job_card_images">
                Garage Job Card Images
                    </label>
                    </div>

                        <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_vehicle_images"
                    id="check_garage_vehicle_images">

                    <input type="hidden" name="question_types[garage][garage_vehicle_images]" value="file">
                    <label class="form-check-label" for="check_garage_vehicle_images">
                    Vehicle Images
                    </label>
                    </div>


                     <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_tow_vehicle_report"
                    id="check_garage_tow_vehicle_report">

                    <input type="hidden" name="question_types[garage][garage_tow_vehicle_report]" value="file">
                    <label class="form-check-label" for="check_garage_tow_vehicle_report">
                   Tow Vehical Report
                    </label>
                    </div>


                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[garage][]" value="garage_voice"
                    id="check_garage_voice">

                    <input type="hidden" name="question_types[garage][garage_voice]" value="file">
                    <label class="form-check-label" for="check_garage_voice">
                  Garage Voice
                    </label>
                    </div>
                    
                    
                    

                   
                    </div>

                    <div class="tab-pane fade" id="driver" role="tabpanel" aria-labelledby="driver-tab">
                    <h5>Driver Insurance Questionnaire</h5>

                    {{-- Select Input --}}
                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[driver][]" value="preferred_network" id="check_preferred_network">
                    <input type="hidden" name="question_types[driver][preferred_network]" value="select">
                    <label class="form-check-label" for="check_preferred_network">
                    Do you have a preferred hospital network?
                    </label>
               
                    </div>

                    {{-- Select Input --}}
                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[driver][]" value="driver_claim_rating" id="check_driver_claim_rating">
                    <input type="hidden" name="question_types[driver][driver_claim_rating]" value="select">                                                                                                       
                    <label class="form-check-label" for="check_driver_claim_rating">
                    How would you rate the claim process?
                    </label>
                    </div>

                    {{-- Text Input --}}
                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[driver][]" value="license_number" id="check_license_number">
                    <input type="hidden" name="question_types[driver][license_number]" value="text">
                    <label class="form-check-label" for="check_license_number">
                    Enter your license number:
                    </label>
                    </div>

                    {{-- File Upload --}}
                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[driver][]" value="driver_license_upload" id="check_driver_license_upload">
                    <input type="hidden" name="question_types[driver][driver_license_upload]" value="file">
                    <label class="form-check-label" for="check_driver_license_upload">
                    Upload your driver license:
                    </label>
                    </div>
                    </div>


                    <div class="tab-pane fade" id="spot" role="tabpanel" aria-labelledby="spot-tab">
                    <h5>Spot Data Insurance Questionnaire</h5>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[spot][]" value="spot_claim" id="check_spot_claim">
                    <input type="hidden" name="question_types[spot][spot_claim]" value="select">
                    <label class="form-check-label" for="check_spot_claim">
                    Have you ever filed a home insurance claim?
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[spot][]" value="spot_coverage_feel" id="check_spot_coverage_feel">
                    <input type="hidden" name="question_types[spot][spot_coverage_feel]" value="select">
                    <label class="form-check-label" for="check_spot_coverage_feel">
                    Do you feel your home is fully covered?
                    </label>
                    </div>
                    </div>

                    

                    <div class="tab-pane fade" id="meeting" role="tabpanel" aria-labelledby="meeting-tab">
                    <h5>Owner Data Insurance Questionnaire</h5>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[meeting][]" value="meeting_claim" id="check_meeting_claim">
                    <input type="hidden" name="question_types[meeting][meeting_claim]" value="select">
                    <label class="form-check-label" for="check_meeting_claim">
                    Have you ever filed a home insurance claim?
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[meeting][]" value="meeting_coverage_feel" id="check_meeting_coverage_feel">
                    <input type="hidden" name="question_types[meeting][meeting_coverage_feel]" value="textbox">
                    <label class="form-check-label" for="check_meeting_coverage_feel">
                    Do you feel your home is fully covered?
                    </label>
                    </div>
                    </div>


                       <div class="tab-pane fade" id="meeting" role="tabpanel" aria-labelledby="meeting-tab">
                    <h5>Spot Data Insurance Questionnaire</h5>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[meeting][]" value="meeting_claim" id="check_meeting_claim">
                    <input type="hidden" name="question_types[meeting][meeting_claim]" value="select">
                    <label class="form-check-label" for="check_meeting_claim">
                    Have you ever filed a home insurance claim?
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[meeting][]" value="meeting_coverage_feel" id="check_meeting_coverage_feel">
                    <input type="hidden" name="question_types[meeting][meeting_coverage_feel]" value="textbox">
                    <label class="form-check-label" for="check_meeting_coverage_feel">
                    Do you feel your home is fully covered?
                    </label>
                    </div>
                    </div>


                      <div class="tab-pane fade" id="accident" role="tabpanel" aria-labelledby="accident-tab">
                    <h5>Accident Data Insurance Questionnaire</h5>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[accident][]" value="accident_claim" id="check_accident_claim">
                    <input type="hidden" name="question_types[accident][accident_claim]" value="select">
                    <label class="form-check-label" for="check_meeting_claim">
                    Have you ever filed a home insurance claim?
                    </label>
                    </div>

                    <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="selected_questions[accident][]" value="accident_coverage_feel" id="check_accident_coverage_feel">
                    <input type="hidden" name="question_types[accident][accident_coverage_feel]" value="textbox">
                    <label class="form-check-label" for="check_accident_coverage_feel">
                    Do you feel your home is fully covered?
                    </label>
                    </div>
                    </div>





                     

                    </div>


                            <div class="form-group">
                                        <label for="place">Select Final Report Template</label> <span class="text-danger">*</span>
                                        <select class="form-select" style="width: 200px;" id='selectTemplate' name='template'>
                                            <option value="" disabled selected>Please select</option>
                                            <option value="1">Template 1</option>
                                            <option value="2">Template 2</option>
                                            <option value="3">Template 3</option>
                                            <option value="4">Template 4</option>
                                            <option value="5">Template 5</option>
                                            <option value="6">Template 6</option>
                                            <option value="7">Template 7</option>
                                            <option value="8">Template 8</option>
                                        </select>
                                        <span class="text-danger" id="template-error"></span>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Company</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#companyForm').on('submit', function(e) {
                e.preventDefault();

                $.ajax({
                    url: '{{ route('companies.store') }}',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        if (response.success) {
                            $('#successMessage').text(response.success).show();
                            $('#companyForm')[0].reset(); // Reset form fields
                            $('.text-danger').text(''); // Clear previous error messages
                        }
                    },
                    error: function(xhr) {
                        var errors = xhr.responseJSON.errors;
                        $('.text-danger').text(''); // Clear previous error messages
                        $.each(errors, function(key, value) {
                            $('#' + key + '-error').text(value);
                        });
                    }
                });
            });
        });
    </script>
@endsection
