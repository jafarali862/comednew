<?php

namespace App\Http\Controllers;

use App\Models\AccidentPersonData;
use Illuminate\Http\Request;

class AccidentUpdateController extends Controller
{
    public function updateAccidentPersonImages(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_person_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('accident_person_images')) {
            foreach ($request->file('accident_person_images') as $index => $image) {
                $path = $image->store('accident_person', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->accident_person_images = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person image updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateAccidentPersonMedicalReport(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_medical_report.*' => 'required|mimes:pdf,zip',
        ]);


        if ($request->hasFile('accident_medical_report')) {
            foreach ($request->file('accident_medical_report') as $index => $image) {
                $path = $image->store('medical', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->medical_report = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person Medical Report updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }


    public function updateAccidentDatanew(Request $request)
    {
        
        // $selected = $request->input('selected_field');

        // if(!$selected || !str_contains($selected, ':')) 
        // {
        // return back()->withErrors(['error' => 'Please select a accident record to update.']);
        // }

        // [$fieldName, $garageId] = explode(':', $selected);

        // $garage = AccidentPersonData::findOrFail($garageId);

        // $inputKey = "field_value.$garageId.$fieldName";

        // if ($request->hasFile($inputKey)) 
        // {
        // $file = $request->file($inputKey);
        // $path = $file->store('accident_uploads', 'public');
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

        // return back()->with('success', 'Accident Data Updated Successfully!');


     $selected = $request->input('selected_field');

        if (!$selected || !str_contains($selected, ':')) 
            {
            return back()->withErrors(['error' => 'Please select a accident record to update.']);
        }

        [$fieldName, $garageId] = explode(':', $selected);

        // Sanitize column name
        $fieldName = preg_replace('/[^a-zA-Z0-9_]/', '', $fieldName);

        $garage = AccidentPersonData::findOrFail($garageId);

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

        return back()->with('success', 'Accident Data Updated Successfully!');
  
    }


    public function updateAccidentPersonHospitalReport(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_hospital_report.*' => 'required|mimes:pdf,zip',
        ]);


        if ($request->hasFile('accident_hospital_report')) {
            foreach ($request->file('accident_hospital_report') as $index => $image) {
                $path = $image->store('hospital', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->hospital_report = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person Hospital Report updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }


    public function updateAccidentPersonGdReport(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'gd_pdf.*' => 'required|mimes:pdf,zip',
        ]);


        if ($request->hasFile('gd_pdf')) {
            foreach ($request->file('gd_pdf') as $index => $image) {
                $path = $image->store('gd_pdf', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->gd_pdf = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person GD Report updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }


    public function updateAccidentPersonRationCard(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_ration_card.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('accident_ration_card')) {
            foreach ($request->file('accident_ration_card') as $index => $image) {
                $path = $image->store('accident_pers_ration', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->ration_card = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person Ration Card updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateAccidentPersonAadharCard(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_person_aadhaar_card_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('accident_person_aadhaar_card_images')) {
            foreach ($request->file('accident_person_aadhaar_card_images') as $index => $image) {
                $path = $image->store('accident_person_aadhaar', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->accident_person_aadhaar_card_images = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person Aadhar Card updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateAccidentPersonWrittenStatement(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_person_written_statment_images.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);


        if ($request->hasFile('accident_person_written_statment_images')) {
            foreach ($request->file('accident_person_written_statment_images') as $index => $image) {
                $path = $image->store('written_statement', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->accident_person_written_statment_images = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person Written Statement updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateAccidentPersonVoice(Request $request, $id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);

        $request->validate([

            'accident_person_voice.*' => 'required',
        ]);


        if ($request->hasFile('accident_person_voice')) {
            foreach ($request->file('accident_person_voice') as $index => $image) {
                $path = $image->store('voice', 'public');
                $updatedImages[$index] = $path;
            }

            $accidentData->accident_person_voice = json_encode($updatedImages);
            $accidentData->save();


            return back()->with('success', 'Accident Person Voice updated successfully!');
        }
        return back()->with('error', 'No images selected.');
    }

    public function updateAccidentPersonData(Request $request, $id)
    {

        $request->validate([
            'executive_name' => 'nullable|string|max:255',
            'fir_vers_accdnt' => 'nullable|string|max:5000',
            'claiment_vers_aaccdnt' => 'nullable|string|max:5000',
            'chrgesheet_con' => 'nullable|string|max:5000',
            'relation_insured_and_claiment' => 'nullable|string|max:255',
            'age_injured_person' => 'nullable|integer|min:1',
            'profession_injured' => 'nullable|string|max:255',
            'diff_in_rider_ver_injured' => 'nullable|string|max:5000',
            'name_address_hospital' => 'nullable|string|max:1000',
            'distance_from_site_hospital' => 'nullable|string|max:255',
            'details_big_hospital_near_site' => 'nullable|string|max:1000',
            'zebra_cross_on_site' => 'nullable|boolean',
            'injury_record_details' => 'nullable|string|max:5000',
            'name_witness' => 'nullable|string|max:255',
            'name_informer' => 'nullable|string|max:255',
            'vehicle_no_fir' => 'nullable|string|max:255',
            'name_accused' => 'nullable|string|max:255',
            'injured_name' => 'nullable|string|max:255',
            'injured_phone' => 'nullable|string|max:255',
            'injured_address' => 'nullable|string|max:1000',
            'injured_pedstrian_or_traveller' => 'nullable|string',
            'injured_hospital_report' => 'nullable|string|max:5000',
            'injured_admited_hospital_details' => 'nullable|string|max:1000',
            'gd_no' => 'nullable|string',
            'police_station' => 'nullable|string',
            'gd_date' => 'nullable',
            'accident_date_time' => 'nullable',
            'accident_description' => 'nullable',
            'no_occupants' => 'nullable',
            'complnt_rel_injured' => 'nullable',
            'descrition_accused' => 'nullable',
            'accused_identifed' => 'nullable',
            'district' => 'nullable',
            'state' => 'nullable',
            'fir_no' => 'nullable',
            'section' => 'nullable',
            'date_time_fir' => 'nullable',
            'delay_in_fir' => 'nullable',
            'gist_fir' => 'nullable',
            'court_where_chargesheet_filled' => 'nullable',
            'date_chargesheet' => 'nullable',
            'section_chargesheet' => 'nullable',
            'who_charged_with' => 'nullable',
            'gist_chargesheet' => 'nullable',
            'petty_case_charged' => 'nullable',
            'status_criminal_case' => 'nullable',
            'accident_genuine' => 'nullable',
            'opnion_disablement' => 'nullable',
            'opnion_injured' => 'nullable',
            'accident_cause_more_vehicle' => 'nullable',
            'opnion_dl_validity' => 'nullable',
            'dl_extract_obtained' => 'nullable',
            'injured_established_fir' => 'nullable',
            'insured_vehicle_establ_fir' => 'nullable',
            'comment_defence_evidence' => 'nullable',
            'wound_certificate' => 'nullable',
            'helment_details' => 'nullable',
            'verification_medical_report' => 'nullable',
            'discussion_family_neighbour' => 'nullable',
            'role_injured' => 'nullable',
            'discussion_injured' => 'nullable',
            'discussion_employeer_injured' => 'nullable',
            'discussion_rider' => 'nullable',
            'discussion_financial' => 'nullable',
            'fact_findings' => 'nullable',
            'conclusion' => 'nullable',
            'name_complainant' => 'nullable',
            'name_add_num_employeer' => 'nullable',
            'edu_injured' => 'nullable',
            'gap_sequencial_event' => 'nullable',
            'date_time_hospital_addmission' => 'nullable',
            'doc_name_and_first_aid' => 'nullable',
            'record_found_first_aid_hospital' => 'nullable',
            'fir_named_or_not' => 'nullable',
            'absence_chargesheet' => 'nullable',
            'damage_per_od_claim' => 'nullable',
            'date_discharge' => 'nullable',
            'period_absence_from_work' => 'nullable',
            'permanent_disablity' => 'nullable',
            'present_condition_injury' => 'nullable',
            'amount_medical_expenceses' => 'nullable',
            'status_rembur_med_expense_employeer' => 'nullable',
            'other_information' => 'nullable',
            'date_panachanama' => 'nullable',
            'opnion_from_panchayath' => 'nullable',
            'date_of_death_date_pm' => 'nullable',
            'cause_death_per_pmr' => 'nullable',
            'co_injured_name_address' => 'nullable',
            'co_injured_income' => 'nullable',
            'co_injured_age' => 'nullable',
            'co_injured_occupation' => 'nullable',
            'co_injured_relation_injured' => 'nullable',
            'co_injured_depend_or_not' => 'nullable',
            'hit_run_police_reach_conclusion' => 'nullable',
            'gaps_police_investigation' => 'nullable',
            'case_suspect_nexus' => 'nullable',
            'tp_property_damage' => 'nullable',
            'policy_details' => 'nullable',
            'insured_vehicle_paper_valid_accident_time' => 'nullable',
            'criminal_court_status_case' => 'nullable',
            'case_diary_findings' => 'nullable',
            'about_accident' => 'nullable',
            'owner_verification' => 'nullable',
            'rider_verification' => 'nullable',
            'details_dl_validity' => 'nullable',
            'tpv_details_dl_validity' => 'nullable',
            'claim_no' => 'nullable',
            'injured_marital_status' => 'nullable',
            'co_injured_marital_status' => 'nullable',
            'claim_no' => 'required|string',
            'nature_of_claim' => 'nullable|string',
            'concern_matters' => 'nullable|string',
            'dist_from_police' => 'nullable|string',
            'rel_informr_claimant' => 'nullable|string',
            'address_different' => 'nullable|boolean',
            'annual_incom_injured' => 'nullable|numeric',
            'esi_coverage_details' => 'nullable|string',
            'status_injures_decesed' => 'nullable|string',
            'compass' => 'nullable|string',
            'pension_details' => 'nullable|string',
            'injured_death_on_spot' => 'nullable|boolean',
            'pmr_no' => 'nullable|string',
            'pmr_date' => 'nullable|date',
            'hospital_name_pmr_carried' => 'nullable|string',
            'injured_compromised' => 'nullable|boolean',
            'defense_fit_compromize' => 'nullable|boolean',
            'wound_certi_coment' => 'nullable|string|max:5000',
            'no_injured' => 'nullable|integer|min:0',
            'no_dead' => 'nullable|integer|min:0',
            'no_tppd' => 'nullable|integer|min:0',
            'comperhensive' => 'nullable|boolean',
            'dob_injured' => 'nullable|date',
            'aadhar_no_injured' => 'nullable|string|max:255',
            'pan_no' => 'nullable|string|max:255',
            'period_leave_avail' => 'nullable|integer|min:0',
            'source_income' => 'nullable|string|max:255',
            'month_incom' => 'nullable|numeric|min:0',
            'wound_certificate_short_disc' => 'nullable|string|max:5000',
            'injured_exami_date_on_woundcerti' => 'nullable|date',
            'injury_place_on_wound_certi' => 'nullable|string|max:255',
            'person_name_who_brought_injured' => 'nullable|string|max:255',
            'hospitalised_from_date' => 'nullable|date',
            'hospitalised_to_date' => 'nullable|date',
            'ip_days' => 'nullable|integer|min:0',
            'verified_treament_records' => 'nullable|string|max:5000',
            'details_postmortam_report' => 'nullable|string|max:5000',
            'legal_heirs_name' => 'nullable|string|max:255',
            'heirs_age' => 'nullable|integer|min:0',
            'heirs_rel_deseased' => 'nullable|string|max:255',
            'marital_status_heirs' => 'nullable|string|max:255',
            'heirs_residing_address' => 'nullable|string|max:1000',
            'heirs_occupation' => 'nullable|string|max:255',
            'heirs_employer_address' => 'nullable|string|max:1000',
        ]);


        $gd_date = \Carbon\Carbon::parse($request->input('gd_date'))->format('Y-m-d');

        $accident = AccidentPersonData::findOrFail($id);

        $accident->update([
            'executive_name' => $request->input('executive_name'),
            'fir_vers_accdnt' => $request->input('fir_vers_accdnt'),
            'claiment_vers_aaccdnt' => $request->input('claiment_vers_aaccdnt'),
            'chrgesheet_con' => $request->input('chrgesheet_con'),
            'relation_insured_and_claiment' => $request->input('relation_insured_and_claiment'),
            'age_injured_person' => $request->input('age_injured_person'),
            'profession_injured' => $request->input('profession_injured'),
            'diff_in_rider_ver_injured' => $request->input('diff_in_rider_ver_injured'),
            'name_address_hospital' => $request->input('name_address_hospital'),
            'distance_from_site_hospital' => $request->input('distance_from_site_hospital'),
            'details_big_hospital_near_site' => $request->input('details_big_hospital_near_site'),
            'zebra_cross_on_site' => $request->input('zebra_cross_on_site'),
            'injury_record_details' => $request->input('injury_record_details'),
            'name_witness' => $request->input('name_witness'),
            'name_informer' => $request->input('name_informer'),
            'vehicle_no_fir' => $request->input('vehicle_no_fir'),
            'name_accused' => $request->input('name_accused'),
            'injured_name' => $request->input('injured_name'),
            'injured_phone' => $request->input('injured_phone'),
            'injured_address' => $request->input('injured_address'),
            'injured_pedstrian_or_traveller' => $request->input('injured_pedstrian_or_traveller'),
            'injured_hospital_report' => $request->input('injured_hospital_report'),
            'injured_admited_hospital_details' => $request->input('injured_admited_hospital_details'),
            'gd_no' => $request->input('gd_no'),
            'police_station' => $request->input('police_station'),
            'gd_date' => $gd_date,
            'accident_description' => $request->accident_description,
            'accident_date_time' => $request->accident_date_time,
            'no_occupants' => $request->no_occupants,
            'complnt_rel_injured' => $request->complnt_rel_injured,
            'descrition_accused' => $request->descrition_accused,
            'accused_identifed' => $request->accused_identifed,
            'district' => $request->district,
            'state' => $request->state,
            'fir_no' => $request->fir_no,
            'name_complainant' => $request->name_complainant,
            'section' => $request->section,
            'date_time_fir' => $request->date_time_fir,
            'delay_in_fir' => $request->delay_in_fir,
            'gist_fir' => $request->gist_fir,
            'court_where_chargesheet_filled' => $request->court_where_chargesheet_filled,
            'date_chargesheet' => $request->date_chargesheet,
            'section_chargesheet' => $request->section_chargesheet,
            'who_charged_with' => $request->who_charged_with,
            'gist_chargesheet' => $request->gist_chargesheet,
            'petty_case_charged' => $request->petty_case_charged,
            'status_criminal_case' => $request->status_criminal_case,
            'accident_genuine' => $request->accident_genuine,
            'opnion_disablement' => $request->opnion_disablement,
            'opnion_injured' => $request->opnion_injured,
            'accident_cause_more_vehicle' => $request->accident_cause_more_vehicle,
            'opnion_dl_validity' => $request->opnion_dl_validity,
            'dl_extract_obtained' => $request->dl_extract_obtained,
            'injured_established_fir' => $request->injured_established_fir,
            'insured_vehicle_establ_fir' => $request->insured_vehicle_establ_fir,
            'comment_defence_evidence' => $request->comment_defence_evidence,
            'wound_certificate' => $request->wound_certificate,
            'helment_details' => $request->helment_details,
            'verification_medical_report' => $request->verification_medical_report,
            'discussion_family_neighbour' => $request->discussion_family_neighbour,
            'role_injured' => $request->role_injured,
            'discussion_injured' => $request->discussion_injured,
            'discussion_employeer_injured' => $request->discussion_employeer_injured,
            'discussion_rider' => $request->discussion_rider,
            'discussion_financial' => $request->discussion_financial,
            'fact_findings' => $request->fact_findings,
            'conclusion' => $request->conclusion,
            'name_add_num_employeer' => $request->name_add_num_employeer,
            'edu_injured' => $request->edu_injured,
            'gap_sequencial_event' => $request->gap_sequencial_event,
            'date_time_hospital_addmission' => $request->date_time_hospital_addmission,
            'doc_name_and_first_aid' => $request->doc_name_and_first_aid,
            'record_found_first_aid_hospital' => $request->record_found_first_aid_hospital,
            'fir_named_or_not' => $request->fir_named_or_not,
            'absence_chargesheet' => $request->absence_chargesheet,
            'damage_per_od_claim' => $request->damage_per_od_claim,
            'date_discharge' => $request->date_discharge,
            'period_absence_from_work' => $request->period_absence_from_work,
            'permanent_disablity' => $request->permanent_disablity,
            'present_condition_injury' => $request->present_condition_injury,
            'amount_medical_expenceses' => $request->amount_medical_expenceses,
            'status_rembur_med_expense_employeer' => $request->status_rembur_med_expense_employeer,
            'other_information' => $request->other_information,
            'date_panachanama' => $request->date_panachanama,
            'opnion_from_panchayath' => $request->opnion_from_panchayath,
            'date_of_death_date_pm' => $request->date_of_death_date_pm,
            'cause_death_per_pmr' => $request->cause_death_per_pmr,
            'co_injured_name_address' => $request->co_injured_name_address,
            'co_injured_income' => $request->co_injured_income,
            'co_injured_age' => $request->co_injured_age,
            'co_injured_occupation' => $request->co_injured_occupation,
            'co_injured_relation_injured' => $request->co_injured_relation_injured,
            'co_injured_depend_or_not' => $request->co_injured_depend_or_not,
            'hit_run_police_reach_conclusion' => $request->hit_run_police_reach_conclusion,
            'gaps_police_investigation' => $request->gaps_police_investigation,
            'case_suspect_nexus' => $request->case_suspect_nexus,
            'tp_property_damage' => $request->tp_property_damage,
            'policy_details' => $request->policy_details,
            'insured_vehicle_paper_valid_accident_time' => $request->insured_vehicle_paper_valid_accident_time,
            'criminal_court_status_case' => $request->criminal_court_status_case,
            'case_diary_findings' => $request->case_diary_findings,
            'about_accident' => $request->about_accident,
            'owner_verification' => $request->owner_verification,
            'rider_verification' => $request->rider_verification,
            'details_dl_validity' => $request->details_dl_validity,
            'tpv_details_dl_validity' => $request->tpv_details_dl_validity,
            'claim_no' => $request->claim_no,
            'injured_marital_status' => $request->injured_marital_status,
            'co_injured_marital_status' =>  $request->co_injured_marital_status,
            'nature_of_claim' => $request->nature_of_claim,
            'concern_matters' => $request->concern_matters,
            'dist_from_police' => $request->dist_from_police,
            'rel_informr_claimant' => $request->rel_informr_claimant,
            'address_different' => $request->address_different,
            'annual_incom_injured' => $request->annual_incom_injured,
            'esi_coverage_details' => $request->esi_coverage_details,
            'status_injures_decesed' => $request->status_injures_decesed,
            'compass' => $request->compass,
            'pension_details' => $request->pension_details,
            'injured_death_on_spot' => $request->injured_death_on_spot,
            'pmr_no' => $request->pmr_no,
            'pmr_date' => $request->pmr_date,
            'hospital_name_pmr_carried' => $request->hospital_name_pmr_carried,
            'injured_compromised' => $request->injured_compromised,
            'defense_fit_compromize' => $request->defense_fit_compromize,
            'wound_certi_coment' => $request->wound_certi_coment,
            'no_injured' => $request->no_injured,
            'no_dead' => $request->no_dead,
            'no_tppd' => $request->no_tppd,
            'comperhensive' => $request->comperhensive,
            'dob_injured' => $request->dob_injured,
            'aadhar_no_injured' => $request->aadhar_no_injured,
            'pan_no' => $request->pan_no,
            'period_leave_avail' => $request->period_leave_avail,
            'source_income' => $request->source_income,
            'month_incom' => $request->month_incom,
            'wound_certificate_short_disc' => $request->wound_certificate_short_disc,
            'injured_exami_date_on_woundcerti' => $request->injured_exami_date_on_woundcerti,
            'injury_place_on_wound_certi' => $request->injury_place_on_wound_certi,
            'person_name_who_brought_injured' => $request->person_name_who_brought_injured,
            'hospitalised_from_date' => $request->hospitalised_from_date,
            'hospitalised_to_date' => $request->hospitalised_to_date,
            'ip_days' => $request->ip_days,
            'verified_treament_records' => $request->verified_treament_records,
            'details_postmortam_report' => $request->details_postmortam_report,
            'legal_heirs_name' => $request->legal_heirs_name,
            'heirs_age' => $request->heirs_age,
            'heirs_rel_deseased' => $request->heirs_rel_deseased,
            'marital_status_heirs' => $request->marital_status_heirs,
            'heirs_residing_address' => $request->heirs_residing_address,
            'heirs_occupation' => $request->heirs_occupation,
            'heirs_employer_address' => $request->heirs_employer_address,
            'defense_fit_compromize' => $request->defense_fit_compromize,
        ]);

        // Redirect back with a success message
        return back()->with('success', 'Accident Person data updated successfully!');
    }

    //API

    public function uploadAccidentImageVideoVoice(Request $request, $id)
    {

        $request->validate([
            'accident_person_images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'accident_medical_report.*' => 'nullable|mimes:pdf,zip',
            'accident_person_voice.*' => 'nullable',
        ]);


        $accidentData = AccidentPersonData::findOrFail($id);
        $allDownloads = [];


        foreach (['accident_person_images', 'accident_medical_report', 'accident_person_voice'] as $field) {

            if ($request->hasFile($field)) {

                foreach ($request->file($field) as $file) {
                    $path = $file->store('accident_downloads', 'public');
                    $allDownloads[] = $path;
                }
            }
        }

        if (!empty($allDownloads)) {
            $accidentData->accident_downloads = json_encode($allDownloads);
            $accidentData->save();
        }

        return response()->json(['data' => 'Data Successfully Saved'], 200);
    }

    public function accidentSpecialCase($id)
    {
        $accidentData = AccidentPersonData::findOrFail($id);
        $accidentData->sp_case = 1;
        $accidentData->save();
        return back()->with('success', 'Accident Person section data Reasigned successfully!');
    }
}
