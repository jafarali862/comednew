-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 10:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_person_data`
--

CREATE TABLE `accident_person_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED NOT NULL,
  `accident_person_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_images`)),
  `accident_person_aadhaar_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_aadhaar_card_images`)),
  `accident_person_written_statment_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_written_statment_images`)),
  `accident_person_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_voice`)),
  `medical_report` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medical_report`)),
  `hospital_report` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hospital_report`)),
  `ration_card` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ration_card`)),
  `fir_vers_accdnt` text DEFAULT NULL,
  `claiment_vers_aaccdnt` text DEFAULT NULL,
  `chrgesheet_con` text DEFAULT NULL,
  `relation_insured_and_claiment` varchar(255) DEFAULT NULL,
  `age_injured_person` varchar(255) DEFAULT NULL,
  `profession_injured` varchar(255) DEFAULT NULL,
  `diff_in_rider_ver_injured` text DEFAULT NULL,
  `name_address_hospital` text DEFAULT NULL,
  `distance_from_site_hospital` varchar(255) DEFAULT NULL,
  `details_big_hospital_near_site` text DEFAULT NULL,
  `zebra_cross_on_site` tinyint(1) DEFAULT NULL,
  `injury_record_details` text DEFAULT NULL,
  `name_witness` varchar(255) DEFAULT NULL,
  `name_informer` varchar(255) DEFAULT NULL,
  `vehicle_no_fir` varchar(255) DEFAULT NULL,
  `name_accused` varchar(255) DEFAULT NULL,
  `injured_name` varchar(255) DEFAULT NULL,
  `injured_phone` varchar(255) DEFAULT NULL,
  `injured_address` text DEFAULT NULL,
  `injured_pedstrian_or_traveller` varchar(255) DEFAULT NULL,
  `injured_hospital_report` text DEFAULT NULL,
  `injured_admited_hospital_details` text DEFAULT NULL,
  `gd_no` varchar(255) DEFAULT NULL,
  `police_station` varchar(255) DEFAULT NULL,
  `gd_date` date DEFAULT NULL,
  `gd_pdf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`gd_pdf`)),
  `accident_date_time` datetime DEFAULT NULL,
  `accident_description` text DEFAULT NULL,
  `accident_downloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_downloads`)),
  `sp_case` int(11) DEFAULT NULL,
  `latitude_and_longitude` varchar(255) DEFAULT NULL,
  `wound_certi_coment` text DEFAULT NULL,
  `no_injured` int(11) DEFAULT NULL,
  `no_dead` int(11) DEFAULT NULL,
  `no_tppd` int(11) DEFAULT NULL,
  `comperhensive` text DEFAULT NULL,
  `dob_injured` date DEFAULT NULL,
  `aadhar_no_injured` text DEFAULT NULL,
  `pan_no` text DEFAULT NULL,
  `period_leave_avail` int(11) DEFAULT NULL,
  `source_income` text DEFAULT NULL,
  `month_incom` decimal(8,2) DEFAULT NULL,
  `wound_certificate_short_disc` text DEFAULT NULL,
  `injured_exami_date_on_woundcerti` date DEFAULT NULL,
  `injury_place_on_wound_certi` text DEFAULT NULL,
  `person_name_who_brought_injured` text DEFAULT NULL,
  `hospitalised_from_date` date DEFAULT NULL,
  `hospitalised_to_date` date DEFAULT NULL,
  `ip_days` int(11) DEFAULT NULL,
  `verified_treament_records` text DEFAULT NULL,
  `details_postmortam_report` text DEFAULT NULL,
  `legal_heirs_name` text DEFAULT NULL,
  `heirs_age` int(11) DEFAULT NULL,
  `heirs_rel_deseased` text DEFAULT NULL,
  `marital_status_heirs` text DEFAULT NULL,
  `heirs_residing_address` text DEFAULT NULL,
  `heirs_occupation` text DEFAULT NULL,
  `heirs_employer_address` text DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `no_occupants` int(11) DEFAULT NULL,
  `complnt_rel_injured` varchar(255) DEFAULT NULL,
  `descrition_accused` varchar(255) DEFAULT NULL,
  `accused_identifed` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `fir_no` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `date_time_fir` varchar(255) DEFAULT NULL,
  `delay_in_fir` varchar(255) DEFAULT NULL,
  `gist_fir` text DEFAULT NULL,
  `court_where_chargesheet_filled` varchar(255) DEFAULT NULL,
  `date_chargesheet` varchar(255) DEFAULT NULL,
  `section_chargesheet` varchar(255) DEFAULT NULL,
  `who_charged_with` varchar(255) DEFAULT NULL,
  `gist_chargesheet` text DEFAULT NULL,
  `petty_case_charged` varchar(255) DEFAULT NULL,
  `status_criminal_case` varchar(255) DEFAULT NULL,
  `accident_genuine` varchar(255) DEFAULT NULL,
  `opnion_disablement` varchar(255) DEFAULT NULL,
  `opnion_dl_validity` varchar(255) DEFAULT NULL,
  `dl_extract_obtained` varchar(255) DEFAULT NULL,
  `injured_established_fir` varchar(255) DEFAULT NULL,
  `insured_vehicle_establ_fir` varchar(255) DEFAULT NULL,
  `comment_defence_evidence` varchar(255) DEFAULT NULL,
  `wound_certificate` text DEFAULT NULL,
  `helment_details` varchar(255) DEFAULT NULL,
  `verification_medical_report` varchar(255) DEFAULT NULL,
  `discussion_family_neighbour` varchar(255) DEFAULT NULL,
  `role_injured` varchar(255) DEFAULT NULL,
  `discussion_injured` varchar(255) DEFAULT NULL,
  `discussion_employeer_injured` varchar(255) DEFAULT NULL,
  `discussion_rider` varchar(255) DEFAULT NULL,
  `discussion_financial` varchar(255) DEFAULT NULL,
  `fact_findings` text DEFAULT NULL,
  `conclusion` text DEFAULT NULL,
  `opnion_injured` varchar(255) DEFAULT NULL,
  `accident_cause_more_vehicle` varchar(255) DEFAULT NULL,
  `name_complainant` varchar(255) DEFAULT NULL,
  `name_add_num_employeer` text DEFAULT NULL,
  `edu_injured` varchar(255) DEFAULT NULL,
  `gap_sequencial_event` text DEFAULT NULL,
  `date_time_hospital_addmission` varchar(255) DEFAULT NULL,
  `doc_name_and_first_aid` text DEFAULT NULL,
  `record_found_first_aid_hospital` text DEFAULT NULL,
  `fir_named_or_not` varchar(255) DEFAULT NULL,
  `absence_chargesheet` text DEFAULT NULL,
  `damage_per_od_claim` text DEFAULT NULL,
  `date_discharge` varchar(255) DEFAULT NULL,
  `period_absence_from_work` varchar(255) DEFAULT NULL,
  `permanent_disablity` text DEFAULT NULL,
  `present_condition_injury` text DEFAULT NULL,
  `amount_medical_expenceses` text DEFAULT NULL,
  `status_rembur_med_expense_employeer` text DEFAULT NULL,
  `other_information` text DEFAULT NULL,
  `date_panachanama` text DEFAULT NULL,
  `opnion_from_panchayath` text DEFAULT NULL,
  `date_of_death_date_pm` varchar(255) DEFAULT NULL,
  `cause_death_per_pmr` text DEFAULT NULL,
  `co_injured_name_address` text DEFAULT NULL,
  `co_injured_income` text DEFAULT NULL,
  `co_injured_age` text DEFAULT NULL,
  `co_injured_occupation` text DEFAULT NULL,
  `co_injured_relation_injured` text DEFAULT NULL,
  `co_injured_depend_or_not` text DEFAULT NULL,
  `hit_run_police_reach_conclusion` text DEFAULT NULL,
  `gaps_police_investigation` text DEFAULT NULL,
  `case_suspect_nexus` text DEFAULT NULL,
  `tp_property_damage` text DEFAULT NULL,
  `policy_details` text DEFAULT NULL,
  `insured_vehicle_paper_valid_accident_time` text DEFAULT NULL,
  `criminal_court_status_case` text DEFAULT NULL,
  `case_diary_findings` text DEFAULT NULL,
  `about_accident` text DEFAULT NULL,
  `owner_verification` text DEFAULT NULL,
  `rider_verification` text DEFAULT NULL,
  `details_dl_validity` text DEFAULT NULL,
  `tpv_details_dl_validity` text DEFAULT NULL,
  `claim_no` varchar(255) DEFAULT NULL,
  `nature_of_claim` text DEFAULT NULL,
  `concern_matters` text DEFAULT NULL,
  `dist_from_police` text DEFAULT NULL,
  `rel_informr_claimant` text DEFAULT NULL,
  `address_different` tinyint(1) NOT NULL DEFAULT 0,
  `annual_incom_injured` decimal(15,2) DEFAULT NULL,
  `esi_coverage_details` text DEFAULT NULL,
  `status_injures_decesed` text DEFAULT NULL,
  `compass` text DEFAULT NULL,
  `pension_details` text DEFAULT NULL,
  `injured_death_on_spot` tinyint(1) NOT NULL DEFAULT 0,
  `pmr_no` text DEFAULT NULL,
  `pmr_date` date DEFAULT NULL,
  `hospital_name_pmr_carried` text DEFAULT NULL,
  `injured_compromised` tinyint(1) NOT NULL DEFAULT 0,
  `defense_fit_compromize` tinyint(1) NOT NULL DEFAULT 0,
  `injured_marital_status` varchar(255) DEFAULT NULL,
  `co_injured_marital_status` varchar(255) DEFAULT NULL,
  `persons_full_name` varchar(255) DEFAULT NULL,
  `injury_audio` varchar(255) DEFAULT NULL,
  `describe_what_happened_in_the_accident` varchar(255) DEFAULT NULL,
  `upload_photos_of_the_vehicle_damage` varchar(255) DEFAULT NULL,
  `was_anyone_injured_in_the_accident` varchar(255) DEFAULT NULL,
  `fsdfdf` varchar(255) DEFAULT NULL,
  `what_is_garage` text DEFAULT NULL,
  `test23` text DEFAULT NULL,
  `test456` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accident_person_data_old`
--

CREATE TABLE `accident_person_data_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fsdfdf` varchar(255) DEFAULT NULL,
  `what_is_garage` text DEFAULT NULL,
  `test23` text DEFAULT NULL,
  `test456` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_work_data`
--

CREATE TABLE `assign_work_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `garage_reassign_status` varchar(255) DEFAULT NULL,
  `garage_re_assign_count` varchar(255) DEFAULT NULL,
  `driver_reassign_status` varchar(255) DEFAULT NULL,
  `driver_re_assign_count` varchar(255) DEFAULT NULL,
  `spot_reassign_status` varchar(255) DEFAULT NULL,
  `spot_re_assign_count` varchar(255) DEFAULT NULL,
  `owner_reassign_status` varchar(255) DEFAULT NULL,
  `owner_re_assign_count` varchar(255) DEFAULT NULL,
  `accident_person_reassign_status` varchar(255) DEFAULT NULL,
  `accident_person_re_assign_count` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_work_data`
--

INSERT INTO `assign_work_data` (`id`, `case_id`, `garage_reassign_status`, `garage_re_assign_count`, `driver_reassign_status`, `driver_re_assign_count`, `spot_reassign_status`, `spot_re_assign_count`, `owner_reassign_status`, `owner_re_assign_count`, `accident_person_reassign_status`, `accident_person_re_assign_count`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-06 01:48:12', '2025-08-06 01:48:12'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-06 02:01:04', '2025-08-06 02:01:04'),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-07 22:19:22', '2025-08-07 22:19:22'),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-07 23:16:21', '2025-08-07 23:16:21'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-07 23:49:50', '2025-08-07 23:49:50'),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-08 00:17:09', '2025-08-08 00:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `case_assignments`
--

CREATE TABLE `case_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `executive_driver` bigint(20) UNSIGNED NOT NULL,
  `executive_garage` bigint(20) UNSIGNED NOT NULL,
  `executive_spot` bigint(20) UNSIGNED NOT NULL,
  `executive_meeting` bigint(20) UNSIGNED NOT NULL,
  `executive_accident_person` bigint(20) UNSIGNED DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `other` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `case_status` varchar(255) NOT NULL,
  `is_fake` varchar(11) DEFAULT NULL,
  `craete_by` varchar(255) NOT NULL,
  `update_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `case_assignments`
--

INSERT INTO `case_assignments` (`id`, `case_id`, `company_id`, `customer_id`, `executive_driver`, `executive_garage`, `executive_spot`, `executive_meeting`, `executive_accident_person`, `date`, `type`, `other`, `status`, `case_status`, `is_fake`, `craete_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 1, 2, 2, 2, 2, NULL, '2025-08-12', 'MACT', 'reee', '1', '1', NULL, '1', '1', '2025-08-06 01:48:12', '2025-08-06 01:52:18'),
(2, 2, 15, 2, 11, 11, 11, 11, NULL, '2025-08-11', 'OD', NULL, '2', '1', NULL, '1', '1', '2025-08-06 02:01:04', '2025-08-06 02:01:04'),
(3, 3, 16, 3, 11, 11, 11, 11, NULL, '2025-08-11', 'OD', NULL, '2', '1', NULL, '1', '1', '2025-08-07 22:19:22', '2025-08-07 22:19:22'),
(4, 4, 17, 4, 11, 11, 11, 11, NULL, '2025-08-25', 'OD', NULL, '2', '1', NULL, '1', '1', '2025-08-07 23:16:21', '2025-08-07 23:16:21'),
(5, 5, 18, 5, 11, 11, 11, 11, NULL, '2025-08-24', 'OD', NULL, '2', '1', NULL, '1', '1', '2025-08-07 23:49:50', '2025-08-07 23:49:50'),
(6, 6, 19, 6, 11, 11, 11, 11, NULL, '2025-08-25', 'MACT', NULL, '2', '1', NULL, '1', '1', '2025-08-08 00:17:09', '2025-08-08 00:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `company_logos`
--

CREATE TABLE `company_logos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_logos`
--

INSERT INTO `company_logos` (`id`, `name`, `email`, `phone`, `place`, `logo`, `template`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test@gmail.com', '1112223334', 'test@gmail.com', 'logos/zhjn6hCrav3vQOY6LitVLVh9f4B358SifFpX4Vum.png', '8', '2024-12-03 04:15:05', '2025-03-23 21:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `driver_data`
--

CREATE TABLE `driver_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED NOT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `driver_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_image`)),
  `driving_licence_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driving_licence_images`)),
  `rc_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`rc_images`)),
  `driver_aadhaar_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_aadhaar_card_images`)),
  `driver_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_voice`)),
  `co_passenger_dl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`co_passenger_dl`)),
  `co_passenger_aadhar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`co_passenger_aadhar`)),
  `vehical_type` varchar(255) DEFAULT NULL,
  `vehicle_permit` longtext DEFAULT NULL,
  `rc_reg_date` date DEFAULT NULL,
  `rc_exp_date` date DEFAULT NULL,
  `dl_exp_date` date DEFAULT NULL,
  `ration_card` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ration_card`)),
  `video_call` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`video_call`)),
  `assets_pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`assets_pic`)),
  `rider_version_accident` varchar(255) DEFAULT NULL,
  `dl_and_rto` varchar(255) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `seating_capacity` int(11) DEFAULT NULL,
  `driver_downloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_downloads`)),
  `sp_case` int(11) DEFAULT NULL,
  `vehicle_authorized_drive` tinyint(1) DEFAULT NULL,
  `latitude_and_longitude` varchar(255) DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `opp_vehicle_insurer` varchar(255) DEFAULT NULL,
  `opp_vehicle_reg_no` varchar(255) DEFAULT NULL,
  `opp_vehicle_made_make` varchar(255) DEFAULT NULL,
  `opp_insured_name` varchar(255) DEFAULT NULL,
  `opp_insured_policy_no` varchar(255) DEFAULT NULL,
  `opp_party_insurance_start_date` date DEFAULT NULL,
  `opp_party_insurance_end_date` date DEFAULT NULL,
  `addres_opp_party` varchar(255) DEFAULT NULL,
  `opp_rc_transfered_to` varchar(255) DEFAULT NULL,
  `opp_rc_transfered_date` date DEFAULT NULL,
  `owner_rc_transfered_to` varchar(255) DEFAULT NULL,
  `owner_rc_transfered_date` date DEFAULT NULL,
  `opp_vehicle_seating_capacity` varchar(255) DEFAULT NULL,
  `opp_vehicle_eng_no` varchar(255) DEFAULT NULL,
  `opp_vehicle_chassis_no` varchar(255) DEFAULT NULL,
  `owner_permit_no` varchar(255) DEFAULT NULL,
  `opp_party_permit_no` varchar(255) DEFAULT NULL,
  `owner_authorized_state` varchar(255) DEFAULT NULL,
  `opp_party_authorized_state` varchar(255) DEFAULT NULL,
  `owner_permit_period_validity` int(11) DEFAULT NULL,
  `opp_party_permit_period_validity` int(11) DEFAULT NULL,
  `owner_permit_verified` tinyint(1) DEFAULT NULL,
  `opp_party_permit_verified` tinyint(1) DEFAULT NULL,
  `driver_age` int(11) DEFAULT NULL,
  `driver_dob` date DEFAULT NULL,
  `badge_val_from` date DEFAULT NULL,
  `badge_val_to` date DEFAULT NULL,
  `driver_full_name` varchar(255) DEFAULT NULL,
  `audiophoto_proof` varchar(255) DEFAULT NULL,
  `full_name_of_the_driver_at_the_time_of_the_accident` varchar(255) DEFAULT NULL,
  `what_is_the_drivers_contact_number` varchar(255) DEFAULT NULL,
  `was_the_driver_under_influence` varchar(255) DEFAULT NULL,
  `did_the_driver_receive_any_injuries` varchar(255) DEFAULT NULL,
  `list_any_previous_driving_offenses` varchar(255) DEFAULT NULL,
  `driver_appointment_date` date DEFAULT NULL,
  `ddddddddddddda` varchar(255) DEFAULT NULL,
  `test` varchar(255) DEFAULT NULL,
  `driver_10` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_data`
--

INSERT INTO `driver_data` (`id`, `assign_work_id`, `driver_name`, `driver_image`, `driving_licence_images`, `rc_images`, `driver_aadhaar_card_images`, `driver_voice`, `co_passenger_dl`, `co_passenger_aadhar`, `vehical_type`, `vehicle_permit`, `rc_reg_date`, `rc_exp_date`, `dl_exp_date`, `ration_card`, `video_call`, `assets_pic`, `rider_version_accident`, `dl_and_rto`, `others`, `seating_capacity`, `driver_downloads`, `sp_case`, `vehicle_authorized_drive`, `latitude_and_longitude`, `executive_id`, `created_at`, `updated_at`, `location`, `opp_vehicle_insurer`, `opp_vehicle_reg_no`, `opp_vehicle_made_make`, `opp_insured_name`, `opp_insured_policy_no`, `opp_party_insurance_start_date`, `opp_party_insurance_end_date`, `addres_opp_party`, `opp_rc_transfered_to`, `opp_rc_transfered_date`, `owner_rc_transfered_to`, `owner_rc_transfered_date`, `opp_vehicle_seating_capacity`, `opp_vehicle_eng_no`, `opp_vehicle_chassis_no`, `owner_permit_no`, `opp_party_permit_no`, `owner_authorized_state`, `opp_party_authorized_state`, `owner_permit_period_validity`, `opp_party_permit_period_validity`, `owner_permit_verified`, `opp_party_permit_verified`, `driver_age`, `driver_dob`, `badge_val_from`, `badge_val_to`, `driver_full_name`, `audiophoto_proof`, `full_name_of_the_driver_at_the_time_of_the_accident`, `what_is_the_drivers_contact_number`, `was_the_driver_under_influence`, `did_the_driver_receive_any_injuries`, `list_any_previous_driving_offenses`, `driver_appointment_date`, `ddddddddddddda`, `test`, `driver_10`) VALUES
(1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-04'),
(3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '2025-08-08 00:24:07', '2025-08-08 00:25:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-19');

-- --------------------------------------------------------

--
-- Table structure for table `driver_data_old`
--

CREATE TABLE `driver_data_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `driver_appointment_date` date DEFAULT NULL,
  `ddddddddddddda` varchar(255) DEFAULT NULL,
  `test` varchar(255) DEFAULT NULL,
  `driver_10` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_data_old`
--

INSERT INTO `driver_data_old` (`id`, `assign_work_id`, `executive_id`, `created_at`, `updated_at`, `driver_appointment_date`, `ddddddddddddda`, `test`, `driver_10`) VALUES
(1, 5, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, NULL, '2025-08-04'),
(3, 6, 11, '2025-08-08 00:24:07', '2025-08-08 00:24:07', NULL, NULL, NULL, '2025-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `validation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `final_reports`
--

CREATE TABLE `final_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `od_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `selected_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`selected_images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_of_the_meeting` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`date_of_the_meeting`)),
  `was_there_any_police_presence_at_the_location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`was_there_any_police_presence_at_the_location`)),
  `upload_a_photo_of_the_garage_sign_or_front_view` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`upload_a_photo_of_the_garage_sign_or_front_view`)),
  `what_is_the_name_of_the_garage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`what_is_the_name_of_the_garage`)),
  `what_is_garage_pass_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`what_is_garage_pass_number`)),
  `driver_appointment_date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_appointment_date`)),
  `what_is_spot_locations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`what_is_spot_locations`)),
  `owner_driving_license` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_driving_license`)),
  `what_is_owner_license_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`what_is_owner_license_number`)),
  `what_is_garage_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`what_is_garage_id`)),
  `garage_10` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_10`)),
  `spot_10` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spot_10`)),
  `driver_10` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_10`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `final_reports`
--

INSERT INTO `final_reports` (`id`, `ad_id`, `gd_id`, `dd_id`, `od_id`, `sd_id`, `case_id`, `selected_images`, `created_at`, `updated_at`, `date_of_the_meeting`, `was_there_any_police_presence_at_the_location`, `upload_a_photo_of_the_garage_sign_or_front_view`, `what_is_the_name_of_the_garage`, `what_is_garage_pass_number`, `driver_appointment_date`, `what_is_spot_locations`, `owner_driving_license`, `what_is_owner_license_number`, `what_is_garage_id`, `garage_10`, `spot_10`, `driver_10`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2025-08-07 22:27:28', '2025-08-07 22:27:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"ALX123456\"]', '[\"Garage345\"]', NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, 5, NULL, '2025-08-08 00:13:03', '2025-08-08 00:13:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"Garage 655\"]', '[\"spot44\"]', NULL),
(3, NULL, NULL, NULL, NULL, NULL, 6, NULL, '2025-08-08 00:24:53', '2025-08-08 00:25:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"Garage New\"]', NULL, '[\"2025-08-19\"]');

-- --------------------------------------------------------

--
-- Table structure for table `garage_data`
--

CREATE TABLE `garage_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED NOT NULL,
  `garage_gate_entry` varchar(255) DEFAULT NULL,
  `garage_job_card` varchar(255) DEFAULT NULL,
  `garage_name` varchar(255) DEFAULT NULL,
  `garage_gate_entry_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_gate_entry_images`)),
  `garage_job_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_job_card_images`)),
  `vehicle_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vehicle_images`)),
  `garage_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_voice`)),
  `tow_vehical_report` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tow_vehical_report`)),
  `latitude_and_longitude` varchar(255) DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `garage_downloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_downloads`)),
  `is_fitness_particular_collected` tinyint(1) NOT NULL DEFAULT 0,
  `is_permit_particular_collected` tinyint(1) NOT NULL DEFAULT 0,
  `is_dl_particular_collected` tinyint(1) NOT NULL DEFAULT 0,
  `is_any_motor_occurance` tinyint(1) NOT NULL DEFAULT 0,
  `no_vehicle_involved_acident` int(11) DEFAULT NULL,
  `damage_consist_with_accident` text DEFAULT NULL,
  `victim_occupant_or_pillion` varchar(255) DEFAULT NULL,
  `victim_employee_insured` varchar(255) DEFAULT NULL,
  `victim_owner_or_employee` varchar(255) DEFAULT NULL,
  `victim_travel_on_load_body` varchar(255) DEFAULT NULL,
  `vehicle_involve_other_accident` tinyint(1) NOT NULL DEFAULT 0,
  `gross_vehicle_weight` decimal(10,2) DEFAULT NULL,
  `date_vehicle_reg` date DEFAULT NULL,
  `vehicle_reg_validity` date DEFAULT NULL,
  `issuing_authority_vehicle` varchar(255) DEFAULT NULL,
  `fitness_validity_opposite_vehicle` date DEFAULT NULL,
  `fitness_validity_vehicle` date DEFAULT NULL,
  `permit_no_vehicle` varchar(255) DEFAULT NULL,
  `permit_no_opposit_vehicle` varchar(255) DEFAULT NULL,
  `issuing_authority__opposite_vehicle` varchar(255) DEFAULT NULL,
  `type_permit_vehicle` varchar(255) DEFAULT NULL,
  `type_permit_opposite_vehicle` varchar(255) DEFAULT NULL,
  `authorized_route_vehicle` varchar(255) DEFAULT NULL,
  `authorized_route_opposit_vehicle` varchar(255) DEFAULT NULL,
  `permit_validity_vehicle` date DEFAULT NULL,
  `permit_validity_opposite_vehicle` date DEFAULT NULL,
  `sp_case` int(11) DEFAULT NULL,
  `is_break_in` tinyint(1) DEFAULT NULL,
  `break_in_ins_date` date DEFAULT NULL,
  `odometer_readng_break_in` int(11) DEFAULT NULL,
  `is_any_discre_found_break_in` tinyint(1) DEFAULT NULL,
  `is_accused_elgible_drive` tinyint(1) DEFAULT NULL,
  `travel_from_to` varchar(255) DEFAULT NULL,
  `clue_aout_accident` text DEFAULT NULL,
  `car_scrap_found_on_spot` tinyint(1) DEFAULT NULL,
  `odometer_reading_service_hist` text DEFAULT NULL,
  `tp_vehicle_details` text DEFAULT NULL,
  `is_any_disc_in_garage_entry_job_crd` tinyint(1) DEFAULT NULL,
  `investi_referal_reson_1` text DEFAULT NULL,
  `referal_findings_1` text DEFAULT NULL,
  `investi_referal_rason2` text DEFAULT NULL,
  `referal_findings_2` text DEFAULT NULL,
  `garage_registration_number` varchar(255) DEFAULT NULL,
  `damage_images` varchar(255) DEFAULT NULL,
  `what_is_the_name_of_the_garage` varchar(255) DEFAULT NULL,
  `upload_a_photo_of_the_garage_sign_or_front_view` varchar(255) DEFAULT NULL,
  `what_is_the_garages_registration_number` varchar(255) DEFAULT NULL,
  `what_is_the_best_model_of_scooter` varchar(255) DEFAULT NULL,
  `what_is_garage_badge_nameddeeeee` text DEFAULT NULL,
  `what_is_garage_pass_number` varchar(255) DEFAULT NULL,
  `what_is_type_script` varchar(255) DEFAULT NULL,
  `what_is_garage_id` varchar(255) DEFAULT NULL,
  `garage_10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `garage_data`
--

INSERT INTO `garage_data` (`id`, `assign_work_id`, `garage_gate_entry`, `garage_job_card`, `garage_name`, `garage_gate_entry_images`, `garage_job_card_images`, `vehicle_images`, `garage_voice`, `tow_vehical_report`, `latitude_and_longitude`, `executive_id`, `created_at`, `updated_at`, `location`, `garage_downloads`, `is_fitness_particular_collected`, `is_permit_particular_collected`, `is_dl_particular_collected`, `is_any_motor_occurance`, `no_vehicle_involved_acident`, `damage_consist_with_accident`, `victim_occupant_or_pillion`, `victim_employee_insured`, `victim_owner_or_employee`, `victim_travel_on_load_body`, `vehicle_involve_other_accident`, `gross_vehicle_weight`, `date_vehicle_reg`, `vehicle_reg_validity`, `issuing_authority_vehicle`, `fitness_validity_opposite_vehicle`, `fitness_validity_vehicle`, `permit_no_vehicle`, `permit_no_opposit_vehicle`, `issuing_authority__opposite_vehicle`, `type_permit_vehicle`, `type_permit_opposite_vehicle`, `authorized_route_vehicle`, `authorized_route_opposit_vehicle`, `permit_validity_vehicle`, `permit_validity_opposite_vehicle`, `sp_case`, `is_break_in`, `break_in_ins_date`, `odometer_readng_break_in`, `is_any_discre_found_break_in`, `is_accused_elgible_drive`, `travel_from_to`, `clue_aout_accident`, `car_scrap_found_on_spot`, `odometer_reading_service_hist`, `tp_vehicle_details`, `is_any_disc_in_garage_entry_job_crd`, `investi_referal_reson_1`, `referal_findings_1`, `investi_referal_rason2`, `referal_findings_2`, `garage_registration_number`, `damage_images`, `what_is_the_name_of_the_garage`, `upload_a_photo_of_the_garage_sign_or_front_view`, `what_is_the_garages_registration_number`, `what_is_the_best_model_of_scooter`, `what_is_garage_badge_nameddeeeee`, `what_is_garage_pass_number`, `what_is_type_script`, `what_is_garage_id`, `garage_10`) VALUES
(1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '2025-08-07 23:41:20', '2025-08-07 23:41:20', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1111', NULL),
(2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '2025-08-07 23:45:23', '2025-08-07 23:45:23', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1111', NULL),
(3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Garage 655'),
(5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, '2025-08-08 00:24:07', '2025-08-08 00:24:07', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Garage New');

-- --------------------------------------------------------

--
-- Table structure for table `garage_data_old`
--

CREATE TABLE `garage_data_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `what_is_the_best_model_of_scooter` varchar(255) DEFAULT NULL,
  `gggggdfg` varchar(255) DEFAULT NULL,
  `what_is_garage_badge_nameddeeeee` text DEFAULT NULL,
  `what_is_garage_pass_number` varchar(255) DEFAULT NULL,
  `what_is_type_script` varchar(255) DEFAULT NULL,
  `what_is_garage_id` varchar(255) DEFAULT NULL,
  `garage_10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `garage_data_old`
--

INSERT INTO `garage_data_old` (`id`, `assign_work_id`, `executive_id`, `created_at`, `updated_at`, `what_is_the_best_model_of_scooter`, `gggggdfg`, `what_is_garage_badge_nameddeeeee`, `what_is_garage_pass_number`, `what_is_type_script`, `what_is_garage_id`, `garage_10`) VALUES
(1, 4, 11, '2025-08-07 23:41:20', '2025-08-07 23:41:20', NULL, NULL, NULL, NULL, NULL, '1111', NULL),
(2, 4, 11, '2025-08-07 23:45:23', '2025-08-07 23:45:23', NULL, NULL, NULL, NULL, NULL, '1111', NULL),
(3, 5, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, NULL, NULL, NULL, NULL, 'Garage 655'),
(5, 6, 11, '2025-08-08 00:24:07', '2025-08-08 00:24:07', NULL, NULL, NULL, NULL, NULL, NULL, 'Garage New');

-- --------------------------------------------------------

--
-- Table structure for table `insurance_cases`
--

CREATE TABLE `insurance_cases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `insurance_type` varchar(255) NOT NULL,
  `case_details` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_new` int(15) DEFAULT 0,
  `assigned_status` varchar(255) DEFAULT NULL,
  `case_status` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `update_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insurance_cases`
--

INSERT INTO `insurance_cases` (`id`, `company_id`, `customer_id`, `insurance_type`, `case_details`, `status`, `status_new`, `assigned_status`, `case_status`, `create_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 15, 1, 'single', 'this is case details descriptiosn', '1', 0, '1', '1', '1', '1', '2025-08-06 01:48:12', '2025-08-06 01:52:18'),
(2, 15, 2, 'single', 'this is case data', '1', 0, '1', '1', '1', '1', '2025-08-06 02:01:04', '2025-08-06 02:01:04'),
(3, 16, 3, 'single', 'this is case descriptions data..........', '1', 0, '1', '1', '1', '1', '2025-08-07 22:19:22', '2025-08-07 22:19:22'),
(4, 17, 4, 'single', 'caserrr', '1', 0, '1', '1', '1', '1', '2025-08-07 23:16:21', '2025-08-07 23:16:21'),
(5, 18, 5, 'single', 'case55', '1', 0, '1', '1', '1', '1', '2025-08-07 23:49:50', '2025-08-07 23:49:50'),
(6, 19, 6, 'insurance1', 'case55', '1', 0, '1', '1', '1', '1', '2025-08-08 00:17:09', '2025-08-08 00:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `insurance_companies`
--

CREATE TABLE `insurance_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `template` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `selected_tabs` longtext DEFAULT NULL,
  `questionnaires` longtext DEFAULT NULL,
  `create_by` varchar(255) NOT NULL,
  `update_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insurance_companies`
--

INSERT INTO `insurance_companies` (`id`, `name`, `contact_person`, `email`, `phone`, `address`, `template`, `status`, `selected_tabs`, `questionnaires`, `create_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 'Ins. Niveosys', 'NIV TEST', 'niv@gmail.com', '9074515422', 'KINFRA Ramanattukara, Ground floor', 9, '1', '[\"garage\",\"driver\",\"spot\",\"meeting\",\"accident\"]', '{\"garage\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"label\":\"What Is The Name Of The Garage\",\"type\":\"text\",\"required\":false},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"label\":\"Upload A Photo Of The Garage Sign Or Front View\",\"type\":\"file\",\"required\":false,\"file_type\":\"image\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"label\":\"What Is The Garages Registration Number\",\"type\":\"text\",\"required\":false}},\"driver\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"label\":\"Full Name Of The Driver At The Time Of The Accident\",\"type\":\"text\",\"required\":false},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"label\":\"What Is The Drivers Contact Number\",\"type\":\"text\",\"required\":false},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"label\":\"Was The Driver Under Influence\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0}]},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"label\":\"Did The Driver Receive Any Injuries\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0}]},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"label\":\"List Any Previous Driving Offenses\",\"type\":\"text\",\"required\":false}},\"spot\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"label\":\"Enter The Address Or Coordinates Of The Accident Spot\",\"type\":\"text\",\"required\":false},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"label\":\"Were Any Traffic Signals Nearby\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0}]},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"label\":\"Was There Any Police Presence At The Location\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0}]}},\"meeting\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"label\":\"Who Did You Meet Regarding The Accident Name Role\",\"type\":\"text\",\"required\":false},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"label\":\"Record A Summary Of The Meeting Conversation\",\"type\":\"file\",\"required\":false,\"file_type\":\"audio\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"label\":\"What Was Discussed In The Meeting\",\"type\":\"text\",\"required\":false},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"label\":\"Date Of The Meeting\",\"type\":\"date\",\"required\":false},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"label\":\"Was Any Agreement Or Document Signed\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0}]},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"label\":\"Next Steps Discussed In The Meeting\",\"type\":\"text\",\"required\":false}},\"accident\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"label\":\"Describe What Happened In The Accident\",\"type\":\"text\",\"required\":false},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"label\":\"Upload Photos Of The Vehicle Damage\",\"type\":\"file\",\"required\":false,\"file_type\":\"image\"},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"label\":\"Was Anyone Injured In The Accident\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0}]}}}', '1', '1', '2025-07-14 04:30:25', '2025-07-14 04:30:25'),
(15, 'Test company', 'Ahammed Shaws', 'ahammed786@gmail.com', '9656523123', 'Adress1', 1, '1', '[\"garage\",\"driver\",\"spot\",\"meeting\"]', '{\"garage\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"label\":\"What Is The Name Of The Garage\",\"type\":\"text\",\"required\":false},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"label\":\"Upload A Photo Of The Garage Sign Or Front View\",\"type\":\"file\",\"required\":false,\"file_type\":\"image\"}},\"driver\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"label\":\"What Is The Drivers Contact Number\",\"type\":\"text\",\"required\":false},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"label\":\"Did The Driver Receive Any Injuries\",\"type\":\"select\",\"required\":false,\"options\":[{\"label\":\"Yes\",\"value\":1},{\"label\":\"No\",\"value\":0},{\"label\":\"Other\",\"value\":2}]}},\"spot\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"label\":\"Enter The Address Or Coordinates Of The Accident Spot\",\"type\":\"text\",\"required\":false}},\"meeting\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"label\":\"Who Did You Meet Regarding The Accident Name Role\",\"type\":\"text\",\"required\":false},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"label\":\"What Was Discussed In The Meeting\",\"type\":\"text\",\"required\":false}}}', '1', '1', '2025-08-06 01:45:59', '2025-08-06 01:45:59'),
(16, 'Company 55', 'Sameer ali', 'cmp45@mail.com', '9656521212', 'adress 44', 1, '1', '[\"garage\",\"meeting\"]', '{\"garage\":{\"what_is_garage_id\":{\"name\":\"what_is_garage_id\",\"label\":\"What Is Garage Id\",\"type\":\"text\",\"required\":false}},\"meeting\":{\"what_is_owner_license_number\":{\"name\":\"what_is_owner_license_number\",\"label\":\"What Is Owner License Number\",\"type\":\"text\",\"required\":false}}}', '1', '1', '2025-08-07 22:13:30', '2025-08-07 22:13:30'),
(17, 'Life Insurance Company', 'Arun Kumar', 'ar@gmail.com', '9497626135', 'address44', 2, '1', '[\"garage\",\"meeting\"]', '{\"garage\":{\"what_is_garage_id\":{\"name\":\"what_is_garage_id\",\"label\":\"What Is Garage Id\",\"type\":\"text\",\"required\":false}},\"meeting\":{\"what_is_owner_license_number\":{\"name\":\"what_is_owner_license_number\",\"label\":\"What Is Owner License Number\",\"type\":\"text\",\"required\":false}}}', '1', '1', '2025-08-07 23:15:01', '2025-08-07 23:15:01'),
(18, 'Latest company', 'Ravi Nair', 'rv@gmail.com', '9497626890', 'adress44', 1, '1', '[\"garage\",\"driver\",\"spot\",\"meeting\"]', '{\"garage\":{\"garage_10\":{\"name\":\"garage_10\",\"label\":\"Garage 10\",\"type\":\"text\",\"required\":false}},\"driver\":{\"driver_10\":{\"name\":\"driver_10\",\"label\":\"Driver 10\",\"type\":\"date\",\"required\":false}},\"spot\":{\"spot_10\":{\"name\":\"spot_10\",\"label\":\"Spot 10\",\"type\":\"text\",\"required\":false}},\"meeting\":{\"owner_10\":{\"name\":\"owner_10\",\"label\":\"Owner 10\",\"type\":\"text\",\"required\":false}}}', '1', '1', '2025-08-07 23:48:26', '2025-08-07 23:48:26'),
(19, 'curial life insurance', 'Sadique shaw', 'crl@gmail.com', '9497626133', 'sssssssssfff', 2, '1', '[\"garage\",\"driver\"]', '{\"garage\":{\"garage_10\":{\"name\":\"garage_10\",\"label\":\"Garage 10\",\"type\":\"text\",\"required\":false}},\"driver\":{\"driver_10\":{\"name\":\"driver_10\",\"label\":\"Driver 10\",\"type\":\"date\",\"required\":false}}}', '1', '1', '2025-08-08 00:15:13', '2025-08-08 00:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `insurance_customers`
--

CREATE TABLE `insurance_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `emergency_contact_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `policy_start` date DEFAULT NULL,
  `policy_end` date DEFAULT NULL,
  `insurance_type` varchar(255) DEFAULT NULL,
  `intimation_report` varchar(900) DEFAULT NULL,
  `crime_number` varchar(65) DEFAULT NULL,
  `police_station` varchar(90) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `update_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `insurance_customers`
--

INSERT INTO `insurance_customers` (`id`, `company_id`, `name`, `father_name`, `phone`, `emergency_contact_number`, `email`, `present_address`, `permanent_address`, `policy_no`, `policy_start`, `policy_end`, `insurance_type`, `intimation_report`, `crime_number`, `police_station`, `status`, `create_by`, `update_by`, `created_at`, `updated_at`) VALUES
(1, 15, 'Muhamed Hassan', 'Abdulla', '9497626100', '9497626100', 'abd786@gmail.com', 'Vengara', 'Vengara', '123456', '2025-08-11', '2025-08-25', 'MACT', 'uploads/intimation_reports/1754464692_Format-Yield Test Certificate[L].pdf', '123123', 'tirur', '1', '1', '1', '2025-08-06 01:48:12', '2025-08-06 01:48:12'),
(2, 15, 'Abdurahman', 'Fawas', '9497626320', '9497626320', 'abd786@gmail.com', 'adreess11', 'adreess11', '3451235X', '2025-07-02', '2025-08-31', 'OD', 'uploads/intimation_reports/1754465464_Format-Work completion report[L].pdf', '12312356', 'vga police station', '1', '1', '1', '2025-08-06 02:01:04', '2025-08-06 02:01:04'),
(3, 16, 'Afsal shaw', 'irfan', '9497626144', '9497626144', 'afsalshaw@gmail.com', 'qqqqqqqqqwee', 'qqqqqqqqqwee', '345123', '2025-08-19', '2025-08-31', 'OD', 'uploads/intimation_reports/1754624961_1ofGuPtQuSuD16dp6zOoUuhmkjHo3LHCLqIApjLi.pdf', '333322XXE', 'mlpm', '1', '1', '1', '2025-08-07 22:19:22', '2025-08-07 22:19:22'),
(4, 17, 'Test css', 'ahamed', '9497626144', '9497626144', 'as@gmail.com', 'ddddddddss', 'ddddddddss', '345123', '2025-08-19', '2025-08-25', 'OD', 'uploads/intimation_reports/1754628381_1ofGuPtQuSuD16dp6zOoUuhmkjHo3LHCLqIApjLi.pdf', '3333224', 'tirur', '1', '1', '1', '2025-08-07 23:16:21', '2025-08-07 23:16:21'),
(5, 18, 'Mishal', 'assan', '9497626800', '9497626800', 'msl@gmail.com', 'ffffffffs', 'ffffffffs', '3451235X', '2025-08-01', '2025-08-19', 'OD', 'uploads/intimation_reports/1754630390_1ofGuPtQuSuD16dp6zOoUuhmkjHo3LHCLqIApjLi.pdf', '33332244', 'tirur', '1', '1', '1', '2025-08-07 23:49:50', '2025-08-07 23:49:50'),
(6, 19, 'Iqbal', 'rashid', '9876546780', '9876546780', 'rsh@gmail.com', 'ffffffffffd', 'ffffffffffd', '3451678', '2025-07-02', '2025-08-08', 'MACT', 'uploads/intimation_reports/1754632029_1ofGuPtQuSuD16dp6zOoUuhmkjHo3LHCLqIApjLi.pdf', '33332244', 'tirur', '1', '1', '1', '2025-08-08 00:17:09', '2025-08-08 00:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2024_09_09_092412_create_insurance_companies_table', 1),
(11, '2024_09_11_043415_create_insurance_customers_table', 1),
(12, '2024_09_11_043437_create_insurance_cases_table', 1),
(13, '2024_09_19_105113_create_case_assignments_table', 1),
(14, '2024_09_26_091615_create_assign_work_data_table', 1),
(15, '2024_10_11_045640_create_odometer_readings_table', 2),
(16, '2024_10_15_045625_create_password_reset_requests_table', 3),
(17, '2024_10_16_035512_create_re_assign_work_data_table', 4),
(18, '2024_10_16_113324_create_garage_data_table', 5),
(19, '2024_10_16_113335_create_driver_data_table', 5),
(20, '2024_10_16_113357_create_spot_data_table', 5),
(21, '2024_10_16_113411_create_owner_data_table', 5),
(22, '2024_10_16_113437_create_accident_person_data_table', 5),
(23, '2024_10_17_065412_create_salaries_table', 6),
(24, '2024_11_22_065054_add_fields_to_insurance_customers_table', 7),
(25, '2024_11_22_101844_add_fields_to_accident_person_data', 7),
(26, '2024_11_22_105321_add_fields_to_driver_data', 7),
(27, '2024_11_22_112332_add_tow_vehical_report_to_garage_data', 7),
(28, '2024_11_22_120319_add_video_call_and_assets_pic_to_driver_data', 7),
(29, '2024_11_25_042344_add_ration_card_and_driving_lic_to_owner_data_table', 7),
(30, '2024_11_28_070841_add_columns_to_driver_data_table', 8),
(31, '2024_11_28_085026_add_columns_to_owner_data_table', 8),
(32, '2024_11_28_120135_add_columns_to_accident_person_data_table', 9),
(33, '2024_11_29_100134_modify_columns_in_accident_person_data_table', 10),
(34, '2024_12_03_050424_create_company_logos_table', 11),
(35, '2024_12_06_114002_add_gd_fields_to_accident_person_data_table', 12),
(36, '2024_12_09_044549_add_accident_downloads_to_accident_person_data_table', 13),
(37, '2024_12_09_083234_add_sp_case_to_accident_person_data_table', 13),
(38, '2024_12_09_095806_add_sp_case_to_driver_data_table', 13),
(39, '2024_12_09_095942_add_sp_case_to_garage_data_table', 13),
(40, '2024_12_09_100139_add_sp_case_to_owner_data_table', 13),
(41, '2024_12_09_100844_add_sp_case_to_spot_data_table', 13),
(42, '2024_12_12_054227_create_final_reports_table', 14),
(43, '2025_01_02_062048_add_template_to_company_logos_table', 15),
(44, '2025_01_02_100231_add_template_to_insurance_companies_table', 16),
(45, '2025_01_06_055827_add_accident_columns_to_accident_person_data_table', 17),
(46, '2025_01_06_091921_add_columns_to_spot_data_table', 17),
(47, '2025_01_06_113355_add_road_details_to_spot_data_table', 18),
(48, '2025_01_07_052711_add_seating_capacity_to_driver_data_table', 19),
(49, '2025_01_07_063417_add_columns_to_owner_data_table', 19),
(50, '2025_01_08_042852_add_no_occupants_to_accident_person_data_table', 20),
(51, '2025_01_08_073957_modify_columns_in_accident_person_data_table', 20),
(52, '2025_01_08_082555_modify_gist_fir_and_gist_chargesheet_columns_in_accident_person_data_table', 20),
(53, '2025_01_09_051938_add_name_complainant_to_accident_person_data_table', 20),
(54, '2025_01_10_071754_modify_fir_vers_accdnt_in_accident_person_data_table', 21),
(55, '2025_01_10_072159_modify_claiment_vers_aaccdnt_in_accident_person_data_table', 21),
(56, '2025_01_10_073041_modify_chrgesheet_con_diff_in_rider_ver_injured_in_accident_person_data_table', 21),
(57, '2025_01_13_094023_add_form_columns_to_spot_data_table', 21),
(58, '2025_01_14_052856_add_columns_to_accident_person_data_table', 21),
(59, '2025_01_14_090108_add_columns_to_owner_data_table', 21),
(60, '2024_11_21_040328_create_fields_table', 22),
(61, '2025_02_05_060845_add_columns_to_accident_person_data', 22),
(62, '2025_02_06_040615_add_columns_to_driver_data_table', 22),
(63, '2025_02_25_043153_add_columns_to_accident_person_data_table', 22),
(64, '2025_02_25_063300_add_columns_to_garage_data_table', 22),
(65, '2025_02_25_091335_add_columns_to_owner_data_table', 22),
(66, '2025_02_26_100327_add_columns_to_owner_data_table', 22),
(67, '2025_02_27_041106_add_columns_to_garage_data_table', 22),
(68, '2025_02_27_095048_add_social_status_and_migration_after_policy_detl_to_owner_data_table', 22),
(69, '2025_02_27_095557_add_columns_to_driver_data_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('001231314ee843fb2fc752a82ed09708698ceaca05091b4cde65cfe543f9587e8f19518c1311a4b6', 16, 1, 'Insurance API Auth', '[]', 0, '2024-10-18 01:40:13', '2024-10-18 01:40:13', '2025-10-18 07:10:13'),
('04e749d5af27c099be44f44e0e21aab20c91effc63ec35241632fc27a294528d6b7c8425c88da2da', 29, 1, 'Insurance API Auth', '[]', 0, '2025-07-14 01:54:41', '2025-07-14 01:54:41', '2026-07-14 07:24:41'),
('31e7c2f7808c0405ff9bdbfa80b3a0fdcec5ed997b057ab2a4decdf07ea07ddebb5a2473433b4742', 26, 1, 'Insurance API Auth', '[]', 0, '2025-03-13 00:34:08', '2025-03-13 00:34:08', '2026-03-13 06:04:08'),
('3a1c2a0548103e9b574221881c849b96b01455afe16281fc1f94d314a9723253c6a0670fcec3f2b8', 2, 1, 'Insurance API Auth', '[]', 0, '2025-07-16 03:53:08', '2025-07-16 03:53:08', '2026-07-16 09:23:08'),
('5015c9da4a709737d6c3df638aaff44d4eda33855bc4cc45e6824899cad0e699e05ffb24716b2d7b', 5, 1, 'Insurance API Auth', '[]', 0, '2025-01-26 23:03:48', '2025-01-26 23:03:48', '2026-01-27 04:33:48'),
('566fb9e583265b69aa1f282b99b91c0a37eebca15b74e065fdf95ac1eace366b84c826eb51b6c5c2', 27, 1, 'Insurance API Auth', '[]', 0, '2025-06-04 02:03:50', '2025-06-04 02:03:51', '2026-06-04 07:33:50'),
('6fa88dfbe68d016a302d044045c244999008ee44baf5f331e33b74c8c818ca4f2ff46424339b4553', 9, 1, 'Insurance API Auth', '[]', 0, '2024-10-22 06:17:24', '2024-10-22 06:17:24', '2025-10-22 11:47:24'),
('9a2370608b857e34b24e06b2b516f9c41e08c3600d4617b24458c5d96713a829a8f449031d6cc5b9', 3, 1, 'Insurance API Auth', '[]', 0, '2025-07-22 06:01:45', '2025-07-22 06:01:45', '2026-07-22 11:31:45'),
('9f2b0ef2e99ac5ffa771ac9c2800c2cce7d81463e52ccdd43d3f598d980ddaa66ed4792b5914fccf', 7, 1, 'Insurance API Auth', '[]', 0, '2024-10-07 00:29:19', '2024-10-07 00:29:19', '2025-10-07 05:59:19'),
('ab555968d30450086d93a7f1f439c0fd88d5c75a3ae36765d2f57c4c087e3e65674d656f2590be7b', 8, 1, 'Insurance API Auth', '[]', 0, '2025-08-05 03:41:15', '2025-08-05 03:41:16', '2026-08-05 09:11:15'),
('c87326c7d60d37ea0ebcabbbf192a059f4eff0f3f3de178792bf2ca4012ca27031f7effde10dd856', 18, 1, 'Insurance API Auth', '[]', 0, '2025-04-04 05:19:58', '2025-04-04 05:19:58', '2026-04-04 10:49:58'),
('c9e53e752412de37f5f977d5cf2bdcb3db4de09d7c4acd8490127281cd9ec7e2c7a7949b3e5dc4f9', 24, 1, 'Insurance API Auth', '[]', 0, '2024-12-10 02:16:26', '2024-12-10 02:16:26', '2025-12-10 07:46:26'),
('cb47f9b045da73b19f7275d9cc0e854784dfa191fe926c6fb37042d882ee599d6d6b88bf490b2eea', 6, 1, 'Insurance API Auth', '[]', 0, '2024-11-26 00:49:21', '2024-11-26 00:49:21', '2025-11-26 06:19:21'),
('f23287c428ed54c3587f050f408c38dea08c697ad2bbee57eeb17528aa916170f4e539542f0d86d5', 23, 1, 'Insurance API Auth', '[]', 0, '2024-12-12 00:30:52', '2024-12-12 00:30:52', '2025-12-12 06:00:52'),
('f741d0f22905e985d115063523c6785c8f797321c1d7b73a872882c17e3a86fa4a0d548f5feb54fd', 11, 1, 'Insurance API Auth', '[]', 0, '2025-08-07 22:19:38', '2025-08-07 22:19:38', '2026-08-08 03:49:38'),
('fbd00d037371904145c88489d2f0b8dae3f40c7e513d3f94157cbb8ad8c04e96a9876d65837251c4', 4, 1, 'Insurance API Auth', '[]', 0, '2025-07-23 22:44:32', '2025-07-23 22:44:32', '2026-07-24 04:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Dq2WEAwdzwOdRAUfgJxi7LqJlIPFoWax991iHSJq', NULL, 'http://localhost', 1, 0, 0, '2024-10-03 04:46:00', '2024-10-03 04:46:00'),
(2, NULL, 'Laravel Password Grant Client', 'u2vaZAb7Q3B81MEgtknU41fgcJmm642cLxoDOsb1', 'users', 'http://localhost', 0, 1, 0, '2024-10-03 04:46:00', '2024-10-03 04:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-10-03 04:46:00', '2024-10-03 04:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `odometer_readings`
--

CREATE TABLE `odometer_readings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `check_in_km` varchar(255) DEFAULT NULL,
  `check_in_image` varchar(255) DEFAULT NULL,
  `check_in_time` varchar(255) DEFAULT NULL,
  `check_in_date` varchar(255) DEFAULT NULL,
  `check_in_latitude_and_longitude` varchar(255) DEFAULT NULL,
  `check_out_km` varchar(255) DEFAULT NULL,
  `check_out_image` varchar(255) DEFAULT NULL,
  `check_out_time` varchar(255) DEFAULT NULL,
  `check_out_date` varchar(255) DEFAULT NULL,
  `check_out_latitude_and_longitude` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `odometer_readings`
--

INSERT INTO `odometer_readings` (`id`, `user_id`, `check_in_km`, `check_in_image`, `check_in_time`, `check_in_date`, `check_in_latitude_and_longitude`, `check_out_km`, `check_out_image`, `check_out_time`, `check_out_date`, `check_out_latitude_and_longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 18, '500', 'odometer/ublG0qPpRHfhzcnPdX7IMk0yxV4VOmokk9oh72EU.jpg', '12:02 PM', '18-10-2024', NULL, '300', 'odometer/XENxxbTyJ6BYvoLRNTtFztq6ygaghPgMzrmxKHo6.jpg', '12:50 PM', '18-10-2024', NULL, '1', '2024-10-18 06:32:57', '2024-10-18 07:20:22'),
(2, 8, '200', 'odometer/rMKBu59ldZ3TB9WvHH60ZHAJBNFtVnWTNukEKwfg.jpg', '12:18 PM', '18-10-2024', NULL, '300', 'odometer/pbWdAyuByITGXOkbOWogjeCFIYEBzCdoaEszZCtD.jpg', '12:19 PM', '18-10-2024', NULL, '1', '2024-10-18 06:48:55', '2024-10-18 06:49:09'),
(3, 8, '200', 'odometer/0ii1GM8Xlo1QRGyI50Wtz210l51MzRdgdGyY9Lpk.jpg', '12:34 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 07:04:48', '2024-10-18 07:04:48'),
(4, 8, '200', 'odometer/zY0yF4ZBrVqB5ipPhFXBJmMSx6F4mGvBF7UzKapt.jpg', '12:34 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 07:04:51', '2024-10-18 07:04:51'),
(5, 8, '200', 'odometer/GtFqGqZMYhALCIQdV4y3YSxna5DkqwIKvC0b5UWX.jpg', '12:36 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 07:06:58', '2024-10-18 07:06:58'),
(6, 8, '200', 'odometer/eZvJ9A6GPi0sK3bdcqtImnt8IcmctgUW2tlHPQdR.jpg', '12:49 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 07:19:08', '2024-10-18 07:19:08'),
(7, 16, '500', 'odometer/G85ZKBEer6jrFD6J1SlN2neeRDxDtDWmXpHluvbV.jpg', '01:14 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 07:44:47', '2024-10-18 07:44:47'),
(8, 16, '500', 'odometer/KoKMTi4g8ldR6vDcxg2ujVuOR8pnAj4AHYNKEzpt.jpg', '01:15 PM', '18-10-2024', NULL, '700', 'odometer/etIF6UZChlQq7NHpaOsBq564WKCHFjp8xGGW3NXX.jpg', '01:15 PM', '18-10-2024', NULL, '1', '2024-10-18 07:45:04', '2024-10-18 07:45:29'),
(9, 18, '22', 'odometer/lL5xaj7tgRmSF1IMmbCSKuKIwArs3HhvJIa9UOrF.jpg', '05:37 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 12:07:39', '2024-10-18 12:07:39'),
(10, 18, '22', 'odometer/LeALyM1Ot0Un7Chwvu2Mow62ZYPFGE9f3rT6MLj3.jpg', '05:37 PM', '18-10-2024', NULL, '55', 'odometer/NUZMKAscZjaZ2LdD3MWFxSCalKDo9N3VTQAey4QD.jpg', '05:41 PM', '18-10-2024', NULL, '1', '2024-10-18 12:07:46', '2024-10-18 12:11:18'),
(11, 18, '22', 'odometer/iaPnA7fy12BcCqTc7Aj3YFxdQfJIgvImOUWRM87p.jpg', '05:42 PM', '18-10-2024', NULL, '55', 'odometer/5ZBgHo2vwwZ0dbnpFsVIPQMQCqPEzIyTy4K2TvBl.jpg', '05:45 PM', '18-10-2024', NULL, '1', '2024-10-18 12:12:18', '2024-10-18 12:15:44'),
(12, 18, '11', 'odometer/wbJKQeHute0RUMhNvXMIF90pht9gmUEunK1vfdcy.jpg', '05:47 PM', '18-10-2024', NULL, '111', 'odometer/Oeload4lbMkn7egvfGGzbM2ftZcKTEE6VhvVsMfy.jpg', '05:47 PM', '18-10-2024', NULL, '1', '2024-10-18 12:17:31', '2024-10-18 12:17:53'),
(13, 18, '55', 'odometer/0nEFeTE7aOHTwZMhJidSJS6kXek3r6YPZr05Kd9j.jpg', '05:50 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 12:20:11', '2024-10-18 12:20:11'),
(14, 18, '55', 'odometer/sLqkzq09NuC61eyo2mPPBApfRn71GDHr1E4SiNgj.jpg', '05:50 PM', '18-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-18 12:20:27', '2024-10-18 12:20:27'),
(15, 18, '88', 'odometer/NTHFdQjAviQFNulPxPUDYyD9XYQy7twpuiYWK2Be.jpg', '09:45 AM', '19-10-2024', NULL, '88', 'odometer/Y5ZCzxmzG85SZWkuMkVr1QTS70fE6Qp6QbLBFSyA.jpg', '09:47 AM', '19-10-2024', NULL, '1', '2024-10-19 04:15:51', '2024-10-19 04:17:41'),
(16, 9, '200', 'odometer/Iy2QZ8G12NZsVGFKo9YuSbRuUcGjlTk5k86FNtuV.jpg', '10:36 AM', '19-10-2024', NULL, '500', 'odometer/hmESdXVTlyOKb8kFPsdS9s74mmJNdRX7AvjPAIgx.jpg', '02:04 PM', '19-10-2024', NULL, '1', '2024-10-19 05:06:14', '2024-10-19 08:34:57'),
(17, 18, '22', 'odometer/BYnryMEOVSzQDTdTn0KiI8UzgpBT1rLQeWoslkRh.jpg', '10:40 AM', '19-10-2024', NULL, '32', 'odometer/KYOdS83awYG8DsPGFWQKFx8UCVIqpRTMBhhKcVhs.jpg', '10:41 AM', '19-10-2024', NULL, '1', '2024-10-19 05:10:30', '2024-10-19 05:11:15'),
(18, 18, '25', 'odometer/LEqQ1MbhqP6x6rkW3t2oxZC3yYQd72kBhXIkaeLG.jpg', '11:32 AM', '19-10-2024', NULL, '88', 'odometer/o6OcWo2UXPfzGG38stumA2YWfQkM3KwCxv16SeJ8.jpg', '11:33 AM', '19-10-2024', NULL, '1', '2024-10-19 06:02:47', '2024-10-19 06:03:47'),
(19, 18, '55', 'odometer/Nn5HSNQu79qFB6tDPh8HxnfQcFO8g6wQbOQQEQQq.jpg', '11:35 AM', '19-10-2024', NULL, '8080', 'odometer/OOc5hP1eQfvwM2CiwaYhLGlnmd3ae1Z0WPeHjiof.jpg', '02:30 PM', '19-10-2024', NULL, '1', '2024-10-19 06:05:56', '2024-10-19 09:00:46'),
(20, 18, '205', 'odometer/na8n6aoGk2MNXsJFtMV6ZtZaTkngSO2hcXBmWMhM.jpg', '11:15 AM', '21-10-2024', NULL, '808', 'odometer/udZJ2VM7LlScMQFF3GJwetXlgA8ge8Fi1HZriziv.jpg', '11:16 AM', '21-10-2024', NULL, '1', '2024-10-21 05:45:54', '2024-10-21 05:46:32'),
(21, 18, '555', 'odometer/MFsvwhAEA7NGUb7jrmyGN5TzMa0ZrXSSvjkdWKAU.jpg', '11:19 AM', '21-10-2024', NULL, '600', 'odometer/fy0hLFa5XXA9c4gvWKf9ntLG9BSpP9B4IaAb4xre.jpg', '01:57 PM', '21-10-2024', NULL, '1', '2024-10-21 05:49:28', '2024-10-21 08:27:55'),
(22, 18, '500', 'odometer/pUA3LM9vulzzhWZAc9ogmWmJQFVJLjNxGe7Dt9BD.jpg', '12:07 PM', '22-10-2024', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2024-10-22 06:37:33', '2024-10-22 06:37:33'),
(23, 18, '222', 'odometer/eEFETfBsrnmxUzVZom3bi0aeUOHxEKY7uQqZpTGH.jpg', '11:53 AM', '23-10-2024', '11.1807508, 75.8545927', '8888', 'odometer/9m6LrvRcA6eoSp9p7UQqrm4pAihSIjSVFNFaeYn6.jpg', '12:01 PM', '23-10-2024', '11.1807573, 75.8546012', '1', '2024-10-23 06:23:15', '2024-10-23 06:31:56'),
(24, 4, '500', 'odometer/3t9oC6rcHHzoqFnwpcuSEzqK3rQjB0aQvbo6xeLV.jpg', '10:28 AM', '04-11-2024', '11.1807416, 75.8545779', '695', 'odometer/yXVO2Vx0AUQEdHVmJrqnxGxXrGartoDOF65LAKAc.jpg', '12:23 PM', '04-11-2024', '11.1807634, 75.8545941', '1', '2024-11-04 04:58:47', '2024-11-04 06:53:25'),
(25, 4, '200', 'odometer/5BuwdV0SS0saGjX53LGTlUc4QQLRcQ5uoydlOwVY.jpg', '02:51 PM', '05-11-2024', '8.5061135, 76.9535024', '500', 'odometer/jkGUZeX0A5duRExttGjhn9dBAVTEdY7TbQQGiu5w.jpg', '02:52 PM', '05-11-2024', '8.5061135, 76.9535024', '1', '2024-11-05 09:21:40', '2024-11-05 09:22:31'),
(26, 18, '500', 'odometer/Xxc7bdzkBsxmyrfu8jpnA4iFxCgOQTe0B9tv9gTW.jpg', '11:15 AM', '03-12-2024', '11.1807614, 75.8545938', '576', 'odometer/5sSFb5Lfn8KUJXynCiU4ycXhRO6JySKF7e3duBut.jpg', '03:31 PM', '03-12-2024', '11.1807608, 75.8545971', '1', '2024-12-03 05:45:49', '2024-12-03 10:01:45'),
(27, 18, '85', 'odometer/ile6pW4kCls0XYdiYRZD7JMqpLz5aFy9xuUmikaG.jpg', '06:09 PM', '11-12-2024', '11.1807736, 75.8546007', '222', 'odometer/cmMeZvHd35nM8yrkBEQ54ctshsHdt5NuDkygeLnN.jpg', '06:10 PM', '11-12-2024', '11.1807736, 75.8546007', '1', '2024-12-11 12:39:34', '2024-12-11 12:40:45'),
(28, 18, '200', 'odometer/PkfwxUajJ0EgeF9w5ELzPZIpd1msZd47v4Yjfjn2.png', '11:00 AM', '16-12-2024', '1.555,1.20215', '322', 'odometer/jFN9ZbwpERJVRBwCBzBmNsHNIo4ILsCYyIazZFae.jpg', '11:01 AM', '16-12-2024', '37.4219983, -122.084', '1', '2024-12-16 05:30:34', '2024-12-16 05:31:22'),
(29, 18, '123', 'odometer/muIDeUNsrcUM78x0TIHYFP8cw6VKdXQEiYgZY8rQ.jpg', '11:01 AM', '16-12-2024', '37.4219983, -122.084', NULL, NULL, NULL, NULL, NULL, '0', '2024-12-16 05:31:33', '2024-12-16 05:31:33'),
(30, 18, '12', 'odometer/PRCQs3tr2yz2chNfonjPw9sIlVtp8Y2OuKhDVFbQ.png', '12:25 PM', '06-01-2025', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2025-01-06 06:55:09', '2025-01-06 06:55:09'),
(31, 18, '12', 'odometer/LaztmZfDvATabdlFnbwQZSHiq2YgiPUioGiABCTX.png', '12:25 PM', '06-01-2025', '12,12', NULL, NULL, NULL, NULL, NULL, '0', '2025-01-06 06:55:22', '2025-01-06 06:55:22'),
(32, 18, '12', 'odometer/RTKI6gwsNjyc6U0BgvZBcxtk1BrTLObPKVMP2HYo.png', '12:25 PM', '06-01-2025', NULL, NULL, NULL, NULL, NULL, NULL, '0', '2025-01-06 06:55:32', '2025-01-06 06:55:32'),
(33, 18, '12', 'odometer/cueRhDmg4MZR5y3rWqGvbTEDSLZipfM953WoBDbC.png', '12:25 PM', '06-01-2025', '12,12', '25', 'odometer/q8zZzH4Vf8YPduViiMb51hlEJdkx8RMKhuxx16xC.jpg', '12:30 PM', '06-01-2025', '11.180775, 75.8545333', '1', '2025-01-06 06:55:36', '2025-01-06 07:00:00'),
(34, 18, '15', 'odometer/fjFazdB7vNZCu8eHsGDM9iHYEDkPR7zWGe8DSSar.jpg', '12:31 PM', '06-01-2025', '11.180775, 75.8545333', '200', 'odometer/Dn1UTajEZSpx86v5oSNlMQeiI9zns1MP4jxYHTuN.jpg', '12:32 PM', '06-01-2025', '11.180775, 75.8545333', '1', '2025-01-06 07:01:58', '2025-01-06 07:02:08'),
(35, 18, '11', 'odometer/rrFVE2LVXyUoWgZnJQvKq0RW16d8iosvstHaVJZ5.jpg', '12:35 PM', '06-01-2025', '11.180775, 75.8545333', NULL, NULL, NULL, NULL, NULL, '0', '2025-01-06 07:05:31', '2025-01-06 07:05:31'),
(36, 18, NULL, 'odometer/hExF7E0lt7FOUxpyfacMFwnxU2tx6SzY0MJi6JQn.png', '12:45 PM', '06-01-2025', '12,12', NULL, NULL, NULL, NULL, NULL, '0', '2025-01-06 07:15:31', '2025-01-06 07:15:31'),
(37, 18, '1234', 'odometer/4DEZKTDsJCKZQyxWGJdnojru8D60kvrXGUk07WQA.jpg', '10:20 AM', '07-01-2025', '11.180775, 75.8545333', NULL, NULL, NULL, NULL, NULL, '0', '2025-01-07 04:50:12', '2025-01-07 04:50:12'),
(38, 4, '81274', 'odometer/suQyE6FqhzZFzncnCPXSK2N7nEalqeqjjy7nfM72.jpg', '01:48 PM', '24-01-2025', '8.5061004, 76.9534973', NULL, NULL, NULL, NULL, NULL, '0', '2025-01-24 08:18:00', '2025-01-24 08:18:00'),
(39, 4, '81274', 'odometer/MxPnMm4lJ05KlNAf3Kr65PKjOFrGpc4HISkhAz1y.jpg', '01:49 PM', '24-01-2025', '8.5060865, 76.9535059', '81350', 'odometer/ZqA6b77xViTVf9IENQ9bHg6dSuC80GaccRdMNQ63.jpg', '01:50 PM', '24-01-2025', '8.5060865, 76.9535059', '1', '2025-01-24 08:19:59', '2025-01-24 08:20:24'),
(40, 5, '55', 'odometer/Bsvbop4yRYvndErSlZMHJK2CIipmvaYPx2uP2a4z.jpg', '12:02 PM', '29-01-2025', '11.1807892, 75.8545805', '55', 'odometer/TxdvoiPSmyOXqd2c9pP9Ylxz6FO8bkCk1E0ScEoK.jpg', '12:08 PM', '29-01-2025', '11.1807892, 75.8545805', '1', '2025-01-29 06:32:37', '2025-01-29 06:38:48'),
(41, 5, '22', 'odometer/RLnv0EHsJkh2LQvnrN3NWks1PO4i4gIq5QOuYM46.jpg', '12:09 PM', '29-01-2025', '11.1807892, 75.8545805', '33', 'odometer/LRh6sS9km24xmk7VQ9pQ5PpmFq051RCTqseTy1Mq.jpg', '12:09 PM', '29-01-2025', '11.1807892, 75.8545805', '1', '2025-01-29 06:39:27', '2025-01-29 06:39:50'),
(42, 18, '22', 'odometer/RUoORIWOvxSk9XxaaugslmGrEeK4IOJQntb75w6J.jpg', '04:45 PM', '03-02-2025', '11.1807902, 75.8545733', NULL, NULL, NULL, NULL, NULL, '0', '2025-02-03 11:15:38', '2025-02-03 11:15:38'),
(43, 3, '22', 'odometer/35opfzAQvCrI6ifPXms5aVCHaYtOsltifc7AXajJ.jpg', '05:03 PM', '03-02-2025', '11.180793, 75.854581', '56', 'odometer/fSOgha2FXzPnfRdYm95aFxLs6EKAHB67W0f91lDz.jpg', '05:03 PM', '03-02-2025', '11.180793, 75.854581', '1', '2025-02-03 11:33:30', '2025-02-03 11:33:45'),
(44, 18, '100', 'odometer/TGsUAYcyKP9sJWF1bpZdM8DkSn0yvyUuBlCEbTmO.jpg', '09:45 AM', '14-03-2025', '11.1807891, 75.8545831', '108', 'odometer/wl4db9hbiIlSH5LMSA8IjlhIvPebWOvwCuKjILI3.jpg', '09:46 AM', '14-03-2025', '11.1807891, 75.8545831', '1', '2025-03-14 04:15:45', '2025-03-14 04:16:08'),
(45, 3, '80', 'odometer/qGeTWRcjyGpjMVLMyTXNR2EqHyvQr8zZiFaD7on4.jpg', '08:45 AM', '24-03-2025', '11.1807975, 75.8545761', '780', 'odometer/z3uLCv8s1Syrjv8Xv9DlvYKRKttIyacJ7alRtezy.jpg', '08:46 AM', '24-03-2025', '11.1807975, 75.8545761', '1', '2025-03-24 03:15:45', '2025-03-24 03:16:21'),
(46, 29, '80', 'odometer/ftQBtseaCtLTKsxzjWuWxEhCRKqcFUbBq7KMxmt7.png', '12:56 PM', '18-06-2025', '12311223,456987', NULL, NULL, NULL, NULL, NULL, '0', '2025-06-18 07:26:32', '2025-06-18 07:26:32'),
(47, 29, '80', 'odometer/ndkjQWezAXBJUARtpyiS6I2VvYEv75H8yQ05I9cK.png', '12:58 PM', '18-06-2025', '12311223,456987', '151', 'odometer/poWIX31IdHPV81WRiBIenJ7BDnRwQYvxgfo5hv7x.png', '01:46 PM', '18-06-2025', '789456,321654', '1', '2025-06-18 07:28:53', '2025-06-18 08:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `owner_data`
--

CREATE TABLE `owner_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED NOT NULL,
  `owner_written_statment_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_written_statment_images`)),
  `owner_aadhaar_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_aadhaar_card_images`)),
  `owner_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_voice`)),
  `ration_card` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ration_card`)),
  `driving_lic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driving_lic`)),
  `latitude_and_longitude` varchar(255) DEFAULT NULL,
  `insured_version_acc` varchar(255) DEFAULT NULL,
  `insured_occupation` varchar(255) DEFAULT NULL,
  `rc_owner_name` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `made_make` varchar(255) DEFAULT NULL,
  `engine_no` varchar(255) DEFAULT NULL,
  `chass_no` varchar(255) DEFAULT NULL,
  `class_of_vehicle` varchar(255) DEFAULT NULL,
  `permit_details` varchar(255) DEFAULT NULL,
  `details_opp_vehicle` varchar(255) DEFAULT NULL,
  `owner_opp_vehicle` varchar(255) DEFAULT NULL,
  `fitness_validity_from` date DEFAULT NULL,
  `fitness_validity_to` date DEFAULT NULL,
  `polution_validity_from` date DEFAULT NULL,
  `polution_validity_to` date DEFAULT NULL,
  `doa_in_policy` varchar(255) DEFAULT NULL,
  `policy_comper_tp_liability` varchar(255) DEFAULT NULL,
  `if_goodladen_details` varchar(255) DEFAULT NULL,
  `damage_goods_transport` varchar(255) DEFAULT NULL,
  `details_damage_vehicle` varchar(255) DEFAULT NULL,
  `insured_advocate` varchar(255) DEFAULT NULL,
  `accused_admited_offence` varchar(255) DEFAULT NULL,
  `type_license` varchar(255) DEFAULT NULL,
  `vehicle_auth_drive` varchar(255) DEFAULT NULL,
  `mismatch_vehicle_in_dl` varchar(255) DEFAULT NULL,
  `insured_advocate_num` varchar(255) DEFAULT NULL,
  `all_liability_covered` varchar(255) DEFAULT NULL,
  `is_close_proximity` tinyint(1) DEFAULT NULL,
  `rc_owner_insurer_same` tinyint(1) DEFAULT NULL,
  `victim_is_employee` tinyint(1) DEFAULT NULL,
  `reg_valid_doa` tinyint(1) DEFAULT NULL,
  `fitness_valid_doa` tinyint(1) DEFAULT NULL,
  `valid_permit_doa` tinyint(1) DEFAULT NULL,
  `any_violation_route_permit` tinyint(1) DEFAULT NULL,
  `opp_party_insurer_name` varchar(255) DEFAULT NULL,
  `opp_party_policy_no` varchar(255) DEFAULT NULL,
  `is_opp_party_liabile` tinyint(1) NOT NULL DEFAULT 0,
  `opp_party_period_insurance` date DEFAULT NULL,
  `opp_part_class_vehicle` varchar(255) DEFAULT NULL,
  `opp_party_rc_owner` varchar(255) DEFAULT NULL,
  `opp_engine_no` varchar(255) DEFAULT NULL,
  `opp_chassis_no` varchar(255) DEFAULT NULL,
  `cc_vehicle` int(11) DEFAULT NULL,
  `opp_party_cc_vehicle` int(11) DEFAULT NULL,
  `address_mobile_accused` varchar(255) DEFAULT NULL,
  `accused_dl_vaild_doa` tinyint(1) DEFAULT NULL,
  `rel_accused_insured` text DEFAULT NULL,
  `opp_driver_dl_valid` tinyint(1) DEFAULT NULL,
  `accused_accident_before` tinyint(1) DEFAULT NULL,
  `dl_no_owner` varchar(255) DEFAULT NULL,
  `dl_no_opp_vehicle` varchar(255) DEFAULT NULL,
  `opp_party_class_vehicle_auth_drive` varchar(255) DEFAULT NULL,
  `accused_first_issue_nt` date DEFAULT NULL,
  `opp_party_first_issue_nt` date DEFAULT NULL,
  `nt_validity__accused` date DEFAULT NULL,
  `nt_validity_opp_party` date DEFAULT NULL,
  `badge_no_accused` varchar(255) DEFAULT NULL,
  `badge_no_opp_party` varchar(255) DEFAULT NULL,
  `accused_tv_first_issue` date DEFAULT NULL,
  `opp_party_tv_first_issue` date DEFAULT NULL,
  `accused_transport_validity` date DEFAULT NULL,
  `opp_party_transport_validity` date DEFAULT NULL,
  `interact_no` varchar(255) DEFAULT NULL,
  `accident_hapn_nat_hoilday` varchar(255) DEFAULT NULL,
  `date_claim_intimated` date DEFAULT NULL,
  `reason_late_intimation` text DEFAULT NULL,
  `insured_profession` varchar(255) DEFAULT NULL,
  `is_neg_area_address` tinyint(1) NOT NULL DEFAULT 0,
  `pan_no_owner` varchar(255) DEFAULT NULL,
  `aadhar_no_owner` varchar(255) DEFAULT NULL,
  `hyp_details` text DEFAULT NULL,
  `vehicle_damages` text DEFAULT NULL,
  `comercl_vehicle_details` text DEFAULT NULL,
  `material_loss_accidnt` text DEFAULT NULL,
  `material_quantity` decimal(10,2) DEFAULT NULL,
  `is_load_recept_available` tinyint(1) NOT NULL DEFAULT 0,
  `fitness_details` text DEFAULT NULL,
  `area_covered` varchar(255) DEFAULT NULL,
  `prev_insurer` varchar(255) DEFAULT NULL,
  `prev_policy_no` varchar(255) DEFAULT NULL,
  `policy_detl` text DEFAULT NULL,
  `social_status` varchar(255) DEFAULT NULL,
  `any_clain_in_prev_policy` tinyint(1) NOT NULL DEFAULT 0,
  `is_prev_claim_photo_available` tinyint(1) NOT NULL DEFAULT 0,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `owner_downloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_downloads`)),
  `sp_case` int(11) DEFAULT NULL,
  `owner_full_name` varchar(255) DEFAULT NULL,
  `vehicle_usage_type` varchar(255) DEFAULT NULL,
  `what_is_garage_badge_name` varchar(255) DEFAULT NULL,
  `who_did_you_meet_regarding_the_accident_name_role` varchar(255) DEFAULT NULL,
  `what_was_discussed_in_the_meeting` varchar(255) DEFAULT NULL,
  `date_of_the_meeting` date DEFAULT NULL,
  `was_any_agreement_or_document_signed` varchar(255) DEFAULT NULL,
  `next_steps_discussed_in_the_meeting` varchar(255) DEFAULT NULL,
  `owner_ration_card` varchar(255) DEFAULT NULL,
  `owner_driving_license` varchar(255) DEFAULT NULL,
  `what_is_owner_license_number` varchar(255) DEFAULT NULL,
  `owner_10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owner_data`
--

INSERT INTO `owner_data` (`id`, `assign_work_id`, `owner_written_statment_images`, `owner_aadhaar_card_images`, `owner_voice`, `ration_card`, `driving_lic`, `latitude_and_longitude`, `insured_version_acc`, `insured_occupation`, `rc_owner_name`, `vehicle_no`, `made_make`, `engine_no`, `chass_no`, `class_of_vehicle`, `permit_details`, `details_opp_vehicle`, `owner_opp_vehicle`, `fitness_validity_from`, `fitness_validity_to`, `polution_validity_from`, `polution_validity_to`, `doa_in_policy`, `policy_comper_tp_liability`, `if_goodladen_details`, `damage_goods_transport`, `details_damage_vehicle`, `insured_advocate`, `accused_admited_offence`, `type_license`, `vehicle_auth_drive`, `mismatch_vehicle_in_dl`, `insured_advocate_num`, `all_liability_covered`, `is_close_proximity`, `rc_owner_insurer_same`, `victim_is_employee`, `reg_valid_doa`, `fitness_valid_doa`, `valid_permit_doa`, `any_violation_route_permit`, `opp_party_insurer_name`, `opp_party_policy_no`, `is_opp_party_liabile`, `opp_party_period_insurance`, `opp_part_class_vehicle`, `opp_party_rc_owner`, `opp_engine_no`, `opp_chassis_no`, `cc_vehicle`, `opp_party_cc_vehicle`, `address_mobile_accused`, `accused_dl_vaild_doa`, `rel_accused_insured`, `opp_driver_dl_valid`, `accused_accident_before`, `dl_no_owner`, `dl_no_opp_vehicle`, `opp_party_class_vehicle_auth_drive`, `accused_first_issue_nt`, `opp_party_first_issue_nt`, `nt_validity__accused`, `nt_validity_opp_party`, `badge_no_accused`, `badge_no_opp_party`, `accused_tv_first_issue`, `opp_party_tv_first_issue`, `accused_transport_validity`, `opp_party_transport_validity`, `interact_no`, `accident_hapn_nat_hoilday`, `date_claim_intimated`, `reason_late_intimation`, `insured_profession`, `is_neg_area_address`, `pan_no_owner`, `aadhar_no_owner`, `hyp_details`, `vehicle_damages`, `comercl_vehicle_details`, `material_loss_accidnt`, `material_quantity`, `is_load_recept_available`, `fitness_details`, `area_covered`, `prev_insurer`, `prev_policy_no`, `policy_detl`, `social_status`, `any_clain_in_prev_policy`, `is_prev_claim_photo_available`, `executive_id`, `created_at`, `updated_at`, `location`, `owner_downloads`, `sp_case`, `owner_full_name`, `vehicle_usage_type`, `what_is_garage_badge_name`, `who_did_you_meet_regarding_the_accident_name_role`, `what_was_discussed_in_the_meeting`, `date_of_the_meeting`, `was_any_agreement_or_document_signed`, `next_steps_discussed_in_the_meeting`, `owner_ration_card`, `owner_driving_license`, `what_is_owner_license_number`, `owner_10`) VALUES
(1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 11, '2025-08-07 23:41:20', '2025-08-07 23:41:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '786', NULL),
(2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '786');

-- --------------------------------------------------------

--
-- Table structure for table `owner_data_old`
--

CREATE TABLE `owner_data_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `owner_driving_license` varchar(255) DEFAULT NULL,
  `what_is_owner_license_number` varchar(255) DEFAULT NULL,
  `owner_10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owner_data_old`
--

INSERT INTO `owner_data_old` (`id`, `assign_work_id`, `executive_id`, `created_at`, `updated_at`, `owner_driving_license`, `what_is_owner_license_number`, `owner_10`) VALUES
(1, 4, 11, '2025-08-07 23:41:20', '2025-08-07 23:41:20', NULL, '786', NULL),
(2, 5, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, '786');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_requests`
--

CREATE TABLE `password_reset_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(255) NOT NULL,
  `request_date` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questionnaire_submissions`
--

CREATE TABLE `questionnaire_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `full_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`full_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questionnaire_submissions`
--

INSERT INTO `questionnaire_submissions` (`id`, `case_id`, `full_data`, `created_at`, `updated_at`) VALUES
(1, 5, '{\"id\":5,\"assign_id\":1,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 05:31:20', '2025-07-14 05:31:20'),
(2, 5, '{\"id\":5,\"assign_id\":1,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 06:13:17', '2025-07-14 06:13:17'),
(3, 5, '{\"id\":5,\"assign_id\":1,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 06:14:04', '2025-07-14 06:14:04'),
(4, 5, '{\"id\":5,\"assign_id\":1,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 06:15:25', '2025-07-14 06:15:25'),
(5, 5, '{\"id\":5,\"assign_id\":1,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 06:16:50', '2025-07-14 06:16:50'),
(6, 5, '{\"id\":5,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 23:15:00', '2025-07-14 23:15:00'),
(7, 5, '{\"id\":5,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"garage_name\":{\"name\":\"garage_name\",\"data\":\"suuu33\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 23:16:30', '2025-07-14 23:16:30'),
(8, 5, '{\"id\":5,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"garage_job_card\":{\"name\":\"garage_job_card\",\"data\":\"suuu33\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 23:18:12', '2025-07-14 23:18:12'),
(9, 5, '{\"id\":5,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"garage_name\":{\"name\":\"garage_name\",\"data\":\"suuu33\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 23:19:25', '2025-07-14 23:19:25'),
(10, 5, '{\"id\":5,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"garage_name\":{\"name\":\"garage_gate_entry\",\"data\":\"suuu33\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 23:23:23', '2025-07-14 23:23:23'),
(11, 5, '{\"id\":5,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"garage_name\":{\"name\":\"garage_gate_entry\",\"data\":\"suuu33\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-14 23:33:29', '2025-07-14 23:33:29'),
(12, 5, '{\"id\":5,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"driver_name\":{\"name\":\"driver_name\",\"data\":\"sam222\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"abc\"},\"garage_name\":{\"name\":\"garage_gate_entry\",\"data\":\"786786\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}}]}', '2025-07-15 00:01:23', '2025-07-15 00:01:23');
INSERT INTO `questionnaire_submissions` (`id`, `case_id`, `full_data`, `created_at`, `updated_at`) VALUES
(13, 6, '{\"id\":6,\"assign_id\":2,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581562025-07-14 10:25:38\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"mishaal\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"9048007933\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":0},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581562025-07-14 10:25:38\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"sarbath\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_e41e2225-46bf-4954-b7b2-5186e8689c0b4121007485831862300.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"123345\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581562025-07-14 10:25:38\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"kuruppath\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":0},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581562025-07-14 10:25:38\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/ADmMqzG4ItMVkGRRBrBil4BE8paaAnAIwKmi+a+CekdN+L6L+\\/6yIAB1xA4s2zqc+OY0dXLse2DJv+LAxugb\\/n4MABSfPH8k3lAhS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBS\\/\\/AEGMqyUdkkQ2AFJWWqqsTAAQkq8i5zuPPPLjkiRohYPUOIdU+Lbc2ZwamOSM0JZRs+qz1g2SvVmQMuH+U0DDIVmIoiyktXhdLJ8Vn3i0oeFsldfujjj3U6fE8rYJKZaIRQMpClNqYMzue21Mj6pEaK5Y62p7wnftMlYsN1WKdVLR9zWusz9IprlE5hZRMmCCyhEjGghZeM11WZMC1cH\\/\\/FgQBa\\/\\/AEcUqDMpFkdBCFuLFquKiTLlSCSoVKDnQIjhxwmjVeIm+WfZ97jXLYqUZ59NlR8jyGnPW8yMuVMk0vZWaTtXQC3vM0G9ca9xVUiZ1y+CcRfm1n2sA\\/mAH1ODxoHPlds33EJfV+aUfgRHVxr2SaQkyiY20f0tupV0ff3ostqVMCxVtK7bfcm0sIrIOvyYO3Bm1KbPn8\\/IAFTBqBAYAMsHrrteBAI1AYAGABBZQ+oHP\\/xYEAX\\/\\/wBJJpteB15FSROYSxGpFtD6SxCVtSFZXCpO7ZKm71V5d0prmJ1iqRTUhGosC\\/H5JRukKJkI2WXXOlMdNFydqc2PiJ5\\/2PIScPLGDEhOTkY0aaAlyriS7DU5HygLdYDKWRfZRAfp8eon3\\/yiDs\\/mRj+kYwBqGgCu\\/wVUdg0F9dvRjSa7l\\/xi3AtDvUH8PFoYAEHbudNjPcBI9ko1o9wEiPX8XOFWNbWeA53T+L6dOqUXKAvVSoYi4iO\\/\\/FgQBS\\/\\/AEs8pkJNhiUgiFkq4SlqlQQKJIsYAC9BD5HWEea0NJVuS5q9tJJGEQHZqCaW0cnBL14v14sXe2zBHU7oZm2XkjpIKiySVlVDuwDB46KClid9bdvCHr93ywoD5QDPYUFfaS3Q8O6JlTTlOJLWkiw4SCUQdJmBucEBG9\\/XwfktKftklIUyJgxZKwNStVcV9Jz592uotpmh7oRLHbaesBw\\/\\/FgQBTf\\/AEwMpkpciCFha6ub6pSSl1JVUlyWpQADnIJlKQOum6ButhRouG6KSzZFwEkoUOXlwBNOyLzB2DoqDvmkD0j+m4hM6SmZpC123QHFU9FDcC0Q4NsgwM069aCoAt8WyaLN\\/pUJFBCVByR5W6w0vWHVVigUKGuDvCTVEjwymae\\/AFhBApg6xEZVvNrTedbK1pTNOno4sQw9fSiz3Xvmv4wOP\\/xYEAUP\\/wBLjKUTFRJLQZCErnVSXdSrq6XMWE2uLtQBwT5M51xTlJf3zGcjTQq3FDYFpNegF7+7w4QHdScNhVMy5DlNb2v\\/3NM2zDNGvdP8oOuGXKnR0D3ym\\/GvCAOE1g2j0zbKFzz944dc2XE8rQSaMCZMsgRRnBpzJO4t78IgDFNrrkv4JMpP3HA6\\/Qhe97+GP8vBh5wHPHSl4RQrQDg\\/\\/FgQBL\\/\\/AEwMpkI0lCYiSripdETNCKkjVKlAAKY16TTVWTSEK52BELSwSlVUKyC40vghQyNfDsMUMTIf3eZZnkENlSFirDTUwy+yApKSPajRqzGCroFTKo4oxT+K7OV3Z9+fzRXN2c6fl9QY2HwxopA35XXpWQVxVRnOBnQMx5s9Jpz\\/erjGfDLSGuDdXkwt9VpvTbqB\\/\\/xYEARX\\/wBLDKaBNFCpAupAgkCpIRUgAColHXZ7Krpu9\\/D52doNTuaSEyBTwoURopIoeDSCGexYYgnaWIhqmEUCucDeA\\/69Glr\\/W9p91GiL4sRhzIChvvWkCmKzqNe42KPYkDloLMhSmvosKK\\/MrFtlqS0HAVSSJysBLrMpwvNY2uaoKUzxXKAOP\\/xYEAS\\/\\/wBLFKYqPJQnbJWq4q6uqklZosqSIlKAJbQJ5S2UWone8d\\/Uw0POy1n7h1BnwsdEeYkjEVbA\\/S1bEGFKuSLsB2LrZuaNiPrpVV8XmREregyDehgfK6qZpfI9+ha5T7Ym\\/0rowZw2qBFAZi8eKRamdT9ZVEK3mhYtemzFLGhTFo9Om0vGpwpVG1fsyT\\/OC9KgcD\\/8WBAFd\\/8ASybmZD5GLiE\\/Rofl8L3K4qvFc3KmFpVZdLrGst6\\/WqukeNddekVIyqoUB1SVCgR7AMBLKf8pcGD8L2oVIFqjwSDSA\\/OQBTqAUgT+gUN+oebEQcEZYf396\\/XsZ6J4Egwqei0IJs7gnaM7+rq8sz4uhiP5vr5Uy+JvxF4FNIHJ7f0PRMJq6nh8nU4Qikus19eNaQMEjyXS\\/vYDrQAfDbj175QM6FQlcf\\/8WBAER\\/8AS7ykOWBM7h1zJrvilSVJMJRKu4VgtHw+J0cXUT8+NAjWfgPaKjTOWduSdtXgbF0wbfcODkmE5pZlYpJNlqhOZ0H3O5QsLgpnlPtc9Wyfgs5p0nLI3bpGQzGMX74zs+OD5gtqUh3AOsuBY2zk7IE6aJ78nb6ffRr73XeiFenN1A4\\/\\/FgQA\\/f\\/AEwMphogpiMAiNVaKjjnVAlQlERNbUAB3C\\/JzSvj1VhOsF3of2\\/NESZcsSQNKzbHVV1X+Q7OciNBNg4EismMYQfB605nf46M1QEycoQlQOrz7bccozNe\\/+OggrmMmFKnJYnZZBjiXgEQghIEaSTJMdbZi+CFgHA\\/\\/FgQA+f\\/AEwMpjo0YiFLm9AiBFQliqABaKzSRK8JLzzaP5YrpyXK4r90czu+mL8\\/vTWES5AZXxj6uny6lphzhJ5crGMkDrIusdf79hbhPhRUr1pOHllfjWvGOHNs9E9tIQNZ+Va0LqgpewIKLSRFmsLVO6YIiR3QrAA4P\\/xYEAPH\\/wBMDKYyMGapUiFWIJKIIaqoAACUOXNoqzsobqkvOYZ2ObhA4qP9Te3Z2dQpBhhR1KTclarhRr3cGaBSlNDoUr1nqYI8ErIUtcdoWjWCcK72Q8\\/qZXT34l53BNpxhOXWxSQLyLn4rLFZwCBMjaFFXQAHP\\/xYEAP3\\/wBMDKYqNGZl5qpxuLC8kirVEiAAAhRZ6i4XnTXId8ptWDt8OnEwDR7aO8t6fMHLgyWu8Z8+espZUbMyiNocfEmlSk48MPqg6V+q6QMmmlsdLEbOOvIWlp8IXjIpVWUq0otKvr\\/UiTleTPBG17liiRkYxyksikA4P\\/xYEAPv\\/wBLlKZRFUQ0ZKqzWcCpKuokCSEqUAAJTORBeuIVtVKEDyCdasgyEdQI4TAibHmsFxW7ZkjHtZh0p2IgxyWlGXH3Rr5a2xcr6+aeLx8pVlSka\\/C8Up6ZpwbqxsOcbEEqyTqlhAESSVEgvCqytzfA1Ni1oEC5MDg\\/\\/FgQBb\\/\\/AEomzWY9wx7hPYSxkVHJLjeuL551\\/HmqqrHXM9SShIjrIU531rrlVFqo6dUAgaqqeBguwRdyRBUcRFI7i1BwrQNAEItnGMQNDz9ZxBUive5NQfJRdFzwsuV+x7PDSPzfxoHzfhXqo9DZLg9dBE2cdSj6nt2IDEhORTgX+Xh7fA1aTxrkmAAOns7ezHcUBNO\\/39\\/Z\\/19RYBV7C+aywLp0QvDB3mTKuCzGC0hhL0ogiA4\\/\\/FgQA3\\/\\/AEw8pDkg4gESM3e+r8cXlJRFRQkJLqsD88ftiITU0xuy2y04bmDTUVfihudgRYSQejDqkpuAyhQNNlryjdMTV2k+LrM\\/fybresW3tyYOGVHKQCBBa6DEM4QghawRMoUvBUguEpkKuoH\\/\\/FgQA8f\\/AEwMpCFcVG61k65vfTJVQlFSLJJTA\\/Ibibg4tq6H9amrO4\\/TSWD2ZORbJdxjqdUEvtShM6xetkaQJApmKbTpXofYKkGbxfYtr0Ve2tlsVlMNsQg8GJSzEwSpyLRVvAAEvEkKLDtJqVJUTRRqgLTikBw\\/\\/FgQA4\\/\\/AEoMpClAWgERPV4nnu7zTFRKkKSQkmULNZ+xriUlLjO0BBO16nMM\\/vVAfJ2sigMdGxCfLAOUqmPWs3KYBLVYKinIz96lh5q4+GQcvcKyoyLqENd2ieYjWS1idQpVbjRMxFoJxAqmUkIogf\\/8WBADj\\/8AS4ykOTxevupLrVTjdSpFSCrhJVsgfkIR2EaJWm29qAsCie5CqoLaqvPnBCHfekFjYojnOZApQlKWGQGml42euJLdU15Lt\\/wqgXr8J87kHGYxximMBIXSFwupKUgzBSdTGGOIsOdlPuAOP\\/xYEAPn\\/wBLjKQxVFIBO0SccdkzS6zgotpUhQfhaeqrmVTrdtp8N959K0Pvc9ZkndhURSc07AJ7DEKTofZDzZgdAgETypBLMY4YN5lmuzOZXGwwZravrSj9mNLvYvS\\/VjhJCMC9p7nRE9uiZqeJZY4kqWiZaKJVWxQtFz\\/8WBAD3\\/8ATBSkSURWv1K1U4qJSSK4qrzVLuUlSg\\/gXQeHrtrPEHGikEM0pUzcmTMpd3QDRrOeLTPl9ERK5oV7WLdQ\\/GDXMDqg8KH6BEw+xjToS9LcrWbQqPAwoIotsIyAd1l6ilqlGqNSV7VpVdyyBGWB6neNZCcwOD\\/8WBAEb\\/8ATKbNZj2zKDmKo+2g9PbSt3XHXzmv44xXHfW69u+eMqUtJM9f5qKtS7YlSZqQkqSoAuyXBLjFzSUk+801SwXBtEog0DHU2duVe2+qyUVxp2wuYduLOPw9cYPpoP\\/1R9NOtOSax6\\/ihqg6TcBOVADAAGmHRIVkCqRAQeOy6yYlMTMIKn4AOD\\/8WBADn\\/8AS7ykQSBgARIwqKnG4lJUEESSlKD8iz0bzHV+xaC+kKI3+SpPheTY0yVqP9Jy7RXu8gZM6SNzzCdFqQlSmKVYeRTJaV6SrsIZPDgWn3ybIbwFATVIUpLh1QElKqiL5SgHUi3al+knnp3KEgO\\/\\/FgQA+\\/\\/AEoMpEE8XPSo1K1nGN6qSrqJSWAwPx1fJ9Q8nudIxyXo1g8qkT6T3RIX6a4MgaJABYZvL2N3A5wLTDImX28ARSVoYnHLUdecYrpefHfrGkVoMF2MlC6dgMblL+GagAUfuQtFsaZOVBqvupCa06p3x9aXYadAOD\\/8WBADz\\/8ASoylEhiaMHjWSI1vVSrVdQhEkpKUDcQ88VAUh8t\\/LJu+BYuXBs7pfNxaufOnE5Q1gKkchHSOJWIlCfDsOeLYdK9V\\/g50iaPRXDFDesNjswUirWxMYSLSmIJhWXVcXrQJTKlzHHVdP1r09F2esoe42Ac\\/\\/FgQA9\\/\\/AEsMpkIcji9zKRciFRcqVZCQSgABoCb3zAs1GuWqghGU5gog2SZK1WGikgwlfI5eq5NKa5BXGgjGL5JLCtV7r4MZMR2zh+csid9dzvUwGtAWhYjjLAtHNIHJkRwzqE5cZQ7XHDtGjleSs7TWOQXnCUEWADg\\/\\/FgQA9\\/\\/AEqUpkoYbO4iVpWoyRKtVogQYAAZgDVPUlo5Vg7ZCtBFmpgqzRCKTy5UbUJm\\/cOOYP4I7eJ0827TXDk10erW2Jx8HFNgvwfa2iFcNrMN17l72tKVYCWDggmK1pCjaknYSgcJCKdbqgS5J3ooQlSraXmEbgc\\/\\/FgQBRf\\/AEmm6WQ+Mj8ajzUWnGrrL43xcV\\/T2zWXVTXMv9PPN1Wm5b1rWFJdXX5QVIyqoUBw7z7YkZa6mHB+d5Zn3vyQEHRahKSCKw3BprGk6iwOQoE\\/ZLI+UzuVyOJdotQhIuFmgFJwGuPDVdRnbRm+XCJBJdTHrLlr4WBI\\/aOKr9VBJkl4UX+3mdnQcoROoifT26C1T4n1nMGbz3+lBAH\\/\\/FgQA\\/f\\/AE48pGE4Vt3NZJc3qqlQqFaVLqRMotgQnnBZO60FkPqkQ0o6QQgqDKEtFGQmHygunx4Uvn\\/KDOw1w50jKv0HdiyYUuhJtWNexBjg8NzDpCnY0ZskWlPCKumgtbyxpImjEqsSIpEZwsdSc+kRlvGVEZpkYBCUwHA\\/\\/FgQA+\\/\\/AEmMpklEVvUy7rjnVNYIvIkERKAA2cDzZQpW8LG7K4FRFxIHEiWd1BMktSuQTm3fmDumzLUR3wrm1LUGf7qCgt+uzuOEysSlMqFRBB0QLM5wrTGRgnWCpmMomfaCsoFbEIriVofaKiNsSqJWcqq3wQuVFUFAOD\\/8WBAD5\\/8ASoymMhSeK3iVa2ty4yyUkLqIhUoAF6A0wqgVahycIpVcioiLb33x1NQftg7tgmWeHdUgkeYnqt8VwMLzqmo2pbR4nOay8K5NpgZKwoFIjFlZy\\/lmvfIEyk60ATpIvcrSALGZH3a5CdAg1TsWrqyGr0RTABw\\/\\/FgQA8f\\/AEqMpko4WgFuQi6SUtSEQguZeAAOeG858yyk7GkqHXXQ1BWFimeeiIZYXGTmbJvXmMM3QZa1mGIdJYxYlaXeXdq+9FUKn1VHxshvFXJs4b2V0Jpl7E7RmJSimTgFQNLsUiVNpIAcSgjKcOqk7rXUEcH\\/\\/FgQA+f\\/AEsMpkosYAFuyRFaURKRIQS6QAAzoX9H1VVSehd+G7aiRLtkiM5pZaAz1El65b7hHjVtuQzo9cwCAf+Gz1ZzWIl5m2cMcxM3bAjqMNdHF5OaWV0shfHWxDbPaoQSaBKtyJaARFCN+NAY\\/jcRqCCiacboh0i4P\\/xYEATX\\/wBMlKYyKKaBEKpSRLRrKiLUkq4qSigABPEZVRGNC30luZjPApqmke5PbU6rJcle+BdBpqshTsrLeN9OG+xaU03b5DiPhSfoeQu3c+z1Dk7Q5TvJYmtLFaWar72qIOoRHAMhJjgaUagc6Tz1MOtMAMBDgtf0QTzx1GcG7znno70YJBgltb0lTToudVrX6+vwV3bAOD\\/8WBAFl\\/8ASSbjYox6ZD5DKjYU6CrEpCVc6ZP6a1FN+dd969avFXnGa5m7iYXD+EKqdAGqgXPFYDNrebcp0VoLbhDlK2tELzHgIzTNYIyAjCoN4qZvOeKtbp2WJKi5H0BRCYu7TQgllSy8FjJithMvWemSy5Xzn8q0OEv7r4rGT7v8sx0YjoeUHU90F9\\/smWts\\/UrWKMVI6MYg\\/\\/v59HTQD4fDg+rgABhG+z6wsIkdABw\\/\\/FgQA\\/f\\/AEy8pjEgzoYVMuqXresSiLyVUJEkvZsAEUtHMIpQGwN5gUImaKI2n+JVQ2\\/Da7y7RKoamv7zm7d44bVLoy318pOxzo57G6VagmG4ThoYiMJVb2C5nVuSLpPDSlIi6FWBKRMJWHAvUz1tKwK1ElFTLbLgKKkvWAO\\/\\/FgQA+\\/\\/AEsMpTk9CCoAu9VxzLVLoICkSStTAGOw9d\\/OO7uxz5bvd1zk5xwcUrt1mrq6Zix76lY3VnXscEnElGaCNxp0jrmDZhRPXDGgoeNkvMb4l7Elqqfi+Xp527weKUPWqnso5FmbIFYLrwTCMZJC9hKxILpqpQuWDj\\/8WBAEB\\/8AS4yoQiSUKlTNZIutVVRCUQupUgsOdCpYKApT4QwQ1wScwSjPOJW+5uUiZQ+\\/a044CxwUkI50sLV86jLWmDUs4ZOgDox2DxMlZmB2tnHKmbZX06eM\\/QQFLd4MlYarBAa+tK3YHKVr1AAjdCMrBSQK97LlhFTikVAcP\\/xYEAO\\/\\/wBLDKZCJGhVXUSWoSpBURFTVIABFjDozranb3OhvbPFOVFFEkSzTOaJUAUaujjmDAgglhP0enu2W0AIcqD4XxGhGZ+OG7fD6M5phu4l\\/PjXmw4L0shQvIVvYqX3+EX6zAtNUStMLAaBCqNhF1xAqAc\\/\\/FgQA\\/f\\/AEuMpklIVNyrir1eFSVEgklRIAAHFE7gILZVCi2mLDumWLSInxAZDQoLXM31VOgj32vQpn1cPPleptG1NAVUfxW45zndSYx0kpbCtD8fKjvIGPaZA00QVcw31x3rK1WO3RaiY4IEEwnVbvC1qzvkMV08wosCoBw\\/\\/FgQA\\/\\/\\/AEoMpjoklCoAvFkS0SquJS6hcqVYgALhSNoNB3yJCljMwWOUlLyGcorcKR8IKU6xVqdc0Kn4maEEmOFjXDV\\/4U2n3gy9+8lJQcHbTDKnA5iS2PQ15KEvWq3s5VazPSkFxjtiz5S6t1xLTJ03zuOCai61KfGQTvRwP\\/xYEAQ\\/\\/wBLDKZKHJIsbiEkkoiFpUq4F1FAAGWB7yaiK6VI7AYLKwhVspvg1xQhuyICAPVx8JR1ZS8G1vymXu1meK3y149Pcialseytw3xIP5sIUi7QohN+EaJVpx2pmA2k4q\\/VtKx\\/eVON5e6Cd4XhmWqQrITvCFzVtWZLhlwTm1u1pgBwP\\/xYEAQX\\/wBLjKZCHJQsbiUuRKlWSwWIRFAFuNhXeCtJRUucmc+AT257MMzF2uF1tcgXpFUUxWuC9nvXFU1BfBzZrPIsMTa0HbzBh8GHV3uyE6WJosizG6Hjq1Xw4mM90bSJ2td666AvFEZKyWDqgF8pW45YMdUsmWItFRATROFgHD\\/8WBAD9\\/8ASgykoMW6qLq9UlJUSEiQiUmBxwPo2T6nc+QfS7k+3bDU4n+jgXFLSMYbnAVGj6QW0XK6YnIHUVs9pZRmlWr1md0swj455bR9NLy+CKdPTUXh77gpH5yZ1kJZO2rZMjltcLAkXpZ2qw1gEr5u21Gdbc4Lh3SABw=\",\"file_name\":\"recording_1752558368983.aac\",\"mime_type\":\"audio\\/aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"you can\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-01T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"hello\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581562025-07-14 10:25:38\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"nthg special\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_77041554-66e1-44b6-999b-b0b078a4e2b61916789946436736431.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-15 00:16:50', '2025-07-15 00:16:50'),
(14, 5, '{\"id\":5,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sam\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-15 00:30:08', '2025-07-15 00:30:08'),
(15, 7, '{\"id\":7,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver949762614472025-07-15 04:33:59\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"hello\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage949762614472025-07-15 04:33:59\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"hii\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot949762614472025-07-15 04:33:59\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762614472025-07-15 04:33:59\",\"questionnaire\":{\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBF\\/\\/ADsMqysNGDFkmUqVKIVKcbvd5UvHCm2sFKXRE8haf7E\\/O\\/z+SvTP1neEe7jpNRmPpjwzxv\\/z6qToIJ0ztmluj59VgmwAUW4Eca7IIFD15B6QhLxD6n\\/z\\/rmgFOIrh62W1BEkoZ3AfIHAJfhmaRYlFYLDSlEAJ6EAAUzaChpABm\\/wAQBwP\\/xYEAXf\\/wBHjKUVGVhHYSCIaCEJBKhKhSJRBAhgL9HZd1G72QAMPxgd3j3KRw0TuK2wrDObTluNIv79WjcfPsu+GwvoTejXPu5\\/C976WtYl0Zu1nWcotFHLMwXy\\/M4ALqdW8hC\\/ZPn\\/eraXfs\\/k1P8P8qUcSFS4sVtEdRKtlsROwN5IgBy5YhP0vQyXvfR4o8C24Mg8wswhTSZTvzPjTEOn8QNBgzO+dvfqGKkfPqFauVMoSD7XmT2AcD\\/8WBAFb\\/8ASoymQjSKgiIhBCvuSZNJaZK1SSYqVC4KABGFMg5XzJQqyu0T5977DTX6V3oB6XT\\/L7881UAjLI6ogPvhFLV2rzik4yIBrUJIr50Zj1iEfpBj90GSpSCe8N+pKmCQ\\/mdCTfR9zPxOSaL7sJCDY\\/IG7qYWnMntHy82TqqDO8MoQsV8cZFx09eWC0ck0WTS8ZXLJqt6s4+d3ancoITy1crktP0+uDsB\\/\\/xYEAT3\\/wBLDKRpXELe0urcRV1KuFrqslXJAD1gAL\\/U\\/coaSRaal4yfjAmNjiXOLSQ9fd0DA3lR\\/0zu6lTM+F3cfS488S7Or599i+x9c2p9SWuTJ3p3uvh36aPGGXD9rHQ24Av1Y1+vX0OZ6mmDiSJ3Wzul9RpHcAhKvlome\\/H9v0MRhfdslM0aGf\\/ce92lFDmvowufaM7ux07SiBw\\/\\/FgQBIf\\/AEmUpkIsliYAu8yXUmkEIkqyiSEBVFZJha9myq5fFtRHFsvUWEaDoviff74v6OfjJGwyan4mU0YcqkXAC0NyhWHt921GSKkt+xrtDqAwslwONqEvLbH4B3Fqa18KeuZXWk\\/P6SEiQzTOC2ORCTt1P0OHa+YT+9Yw4buEe0Y2l5WMXh0T96kaw6u\\/\\/FgQBYf\\/AEumzWg9My7ZJyyEsyg4823cVLnfrq5zzCMi5VUtHrrOteNYqrbVSKam7gJIvNrLpaAYyVBm6fCckRcwBsjxELSDPYibErhpkdmSxLqpryZOSUALJHpf5YHXcEuyryLeU6SqUcw2rt4KDxz+zzgeBrcmv78OV1bgIBPdStV14OZxXAhhhGcKNAqYqCRABlLVhZkSJTBZ9jd1RMKKkTAGpD7OXz4fnrKAcD\\/8WBAFX\\/8AS6bNZl0JZj20LIhLUaiEpxFVe4VvPjaRzw2pwVkiK7vWKvdyAb0Wa\\/jUtdNkUf5cW8pnAQXI8G5LrOk7GIlk\\/6xDSiWFN51HbCMLqIhpUB\\/9uTdZhdPqapqGCaEMaYas\\/5H5ATpNv9QDM\\/zYqVlMHZlCM0QhnOrM\\/GS6tlp2TuTiWoFKG\\/ZJLMzzzqbkkpPD7U0qREMl13hCNw1hzS8q804Mxz\\/8WBAEh\\/8ATCbjZj2yKjoZQdCUn2nDcXV83fi4y6dZjX6cbpqi6rm72kvnV5XuhUmaoJEhcL6ryqarRkcyuzv5ue\\/rLCX+SaIYCAUJeG4MBIKwADO6uSpu8lEZlUDqMuIlC2LbvmkHYRny4EU2Y0U49dwTgWPz9gfnT\\/\\/0f28kYDqvuYMcQvXUAtm1wDQAHD\\/8WBAD7\\/8ATLykQSxk8ZWqq\\/OZxKqpFXWqIUglB\\/An17ogN7D1CRAMgO616ez78nAMjb2Ymo5gsU9yiRPcQXnzqVLQY1mKYsRWXqwy7yKRpRyl9AO2J5InhUxta00HiiWlWTkWwd\\/b+C2lg+zjsXj31NVnRzcCGFOp3QA4P\\/xYEAPP\\/wBKjKRQ7fapKXcy4vCVcQSoFQHhfivM8eQBmowDpyXU0QUODpDUKce3Pdho\\/1vyOzjx4xvtZb48uybRzLz6ztRsSYOkpkjzBhJ05Yrqty0KTg8sJo2lfbXddEyVK12o0lEvvjluK2hRS7Fr3Avq4sZcBz\\/8WBADj\\/8ATAymQTBgAWZTVLJdBUstGEXiAEh6IQquIz058b158QKGk10uLXNz4RIL+bzU8ATD48jmjq9WMpSwyAlfyjNOpK9+isoyC+CTSCUz8SJGoatdgoayicRKCgQUTWlWDrxQpXAneKlIpLBwP\\/xYEAPf\\/wBMjKRhKFwBVsuk63Lq6VKuyLwkKgt5yQ6DtGnub\\/rv0z+rk7onoorT5DpENDAUEqAHmQ\\/epdasZiSHL\\/QEZXdAQsoARMgn4E7TsVn0N7YvdZOm\\/ZFkdfoWswSF4us4l0k\\/Ve6YQX00Ga6YhLtet\\/yzFRPl\\/\\/xYEAOv\\/wBMlKZSLF4BKqRVxCVCriVIJKqoAA66lHtl4WhGX+PhM9nPCd6VoZvBND1O4u7UhRgnXDXiNErcOOAMyO\\/mEV1KdTWCFt2COEUbVoVWkCNkqhJYmnDqWLpkYwkAFJyvBcIlE4ExbvFeW\\/by6hQOP\\/xYEAR\\/\\/wBMJuNkPiUeWp8snJ9uLKOJKr+L9ptxWNePP9OvPhs04eL45yqlarjfSFSKakIiKz6BnJzOp30\\/XJHbtrV2dkKALzksQBkuAgcwmNA+gbSfnWtZEKtKYpqqBFVezx8VPrP7gMAEEvVSxFJtNM08Lrg\\/\\/VH96OpOUb0\\/4XSQ6LADqQN7pANsAHA\\/\\/FgQBA\\/\\/AE48pCFgUAFm8nn1c8jW2ay4xF1ckVlh\\/ZtdweJV8RwG7R4Q3DwO9b5OPh59PcakKjIZmMvdFPpiEjo0HbGLvaH7RFEPQ6kd\\/OGqsc4WeQoJZVXnHT4YNkUZQZGH8Ci6bfpsJne2Gb7RpirnYIyqm+nhlYeTlihiIIO\\/\\/FgQA\\/f\\/AE8MpklIVOPFTVVfFXUKiSiEq0AAAJnKEeYDQ9UuchDQKukoytIC1uAasyPpkRX3Av4cVQAN81kTZpnpVL7TSLmUadxPFwCGxjZ5cjqiXBgBQTU6yaXvhGRa11sKpxRIQuKEZjzwJ2hZSJX7XCD26E9s0AUIgMH\\/\\/FgQBG\\/\\/AE4MpljEykQwvJNU1hKIVCEQFsHcgAOADunZmVMnrbcleBQaodxFWcivQggxgjCTeNdn+vPXIy\\/fSOaC4ywSvbcevmxUpl5Kxden+sY9\\/Ke\\/V6NcrKRL3lxUBUgNjAncsjv\\/q3watBXd\\/akexLwh9U1now6lf+NtpbRk7vWEBldqJKAAAMH\\/\\/FgQA9\\/\\/AE8MpEFEVgFipeTqpJhIKgi6lEgcfZ8Cn5M1o+qDmE3Atc1BuxdPh4lCdFamGBPgW0OVstj8VBCUqANSCG+CAgZHAopVpM7bLAo5sy3dJGHhkRXS5ClfnC07UgKRfgjDVRTF42TGt9fJxSW2o4GvnYUvOde\\/\\/FgQA\\/f\\/AE8MpDEsaJykqcRJtKWJMhqsglB+3NiDfvcrP6vT611hVXtN9juOp86ErXFGKH\\/u+1QeFxfnWNVUYM+NLdlKz2Ck4w0KfaNis6RPfeUBBQK5Ir4ZU8OTtt2ztjylSvklDD7sPFWDyIxl9\\/R4bJqFRHHRZdLDUBw\\/\\/FgQA9\\/\\/AEuUplkoYOcVcTWQlEQiVJQhAAWmolfLRJsjdLsPmdW+gc0rFzPOywRNTA4RjU124GrxvR\\/dFVTiA0Gyq1TYDmDnbSrdCi2wskfgySgVuqSliT6FghSIT2WTnOkqRgktfLq0EimqxcUsEJpbhZZJInTpcDg\\/\\/FgQBHf\\/AEwmzUo81EwtkfjMeQS9KvfEyK\\/SJl83F4Td4rqt\\/W96u+Obnc8mosqRTUhEHv\\/Ed\\/+vVgY\\/jiLu2JCAYxgYhH6TCtSCbMJyMcSc\\/9vH2AFAAMH4hLSH0Xkbj4TvOn\\/lH9Kf+KeoHKNg2QbqIZYWArm5oE8IAH2HGMHUiBVaHSrXEtcCQxRcP\\/xYEAQP\\/wBKPKYiIJwrfNIqXZJSpF0yTVQhGADAZXZtBMTx2VjG35wkb5WGiFinN3vJsfDoUY9CmdJrW2a6LHQr0S7ixTxo0BglLgug6m6fPIbNzA3KDuoV51Ry8IJkLLsTNmlLcNk2iAM27qJjWhUKb5G2VGZ9LybnWFr2t2AcP\\/xYEAQv\\/wBLjKZKFJoqc83FXJeapWqiSqkWJKigBhNIDjfsR2PCSdGuacWrix8ROHCYW6mQ3mub5UgajP2zK42r\\/0W07xsmH7Qe20yQQCdFp\\/Ayv9msuh7X1UGdOypQ3TOLwyrRhAuv7ib1IiydzNpmsgmrbEaHBGFiZVWuRZCtmJNMBz\\/8WBAEB\\/8ATQymQhyULFZWm7uS6QhZCREVAAB3peK0MUlNmyzKFaumKbDOrAoj0RjBmP0UDLx9mXDsHMjiSo4W5Cev7esUbpV10uJaSIukZWcb2M6EeT5kJZEa2owXIA82Q6QrFOdO9ghGaKnGQskIE4QgsGqdbruMAg74qqgOP\\/xYEARP\\/wBOjKQ5XE5zWqrh0SZdXIiFlyiAfvk1b79TBNuAUozZOeMxMg6lzp8emndb4+fL6sh\\/Qvmqk7DbM8gywzzmohvqvWu9aD4peWx8jA0LmLEAyl39RwAEo79j8bV7ph3npAtO1Yhs5kNVImqNN94\\/KZrrZGvulWF7\\/szRspXkfSsUQMH\\/\\/FgQA7\\/\\/AEwUqEIsYgFVZIkupFSVElILSQgGtuWM5WHKKhfZXoy9NLKOCqpQihasmYC4jSfMEk7nivMgX9KRByu0XsfdpZ+TzUNc0+ceTCC2t4qWIo2SOpyLoQQmawolYFKJUTRTXNMwAiWblZlBOUkghFGIDj\\/8WBAF1\\/8ASibsZD5RZD3fjES3SMSziknWaua\\/pVktabn24FpvhX9\\/wimNVevyhUWVM69SCkmEbRznRJ5pvpiymRfcpbcWXukEUgREWUC3YFxADe3avxfyeqrKSxYVSdkPY2wpOK9C5eVpifUFc8ZgMqgBlCxG2t\\/RNm731R2\\/\\/NpjL9X6Mo\\/PXhnieo+YKR\\/X5mzhbeUI5stQVV62z5veQd9N1XgV90mvqQ0PX4YSU7a4UAglfSCibj\\/8WBAED\\/8ATzymSURWrJErjd9bbVZFEQRKmAAeQXCuWZBNtUsCFyohA8JWYpEIzwRBMY3pqnSZoOkMXfdb7kcHaYGYEgZgn09yb8bVbk7ctETuK5u+ffgjE8kapFvEAe\\/F4\\/cUMOPCqFMPkjEiqsME36RpCSi5dOM9cIQXXjjwgf\\/8WBAEd\\/8ATgykGxiegRYrMlypqra3MsiskkuZBMDpKEhjsEbSpq4mbUrOwnQq1Ixr12q0IuomdMolO2J+hMzptURhWq\\/c8yIp4yHNot\\/R1tw8aSpTZT+G+SOHm5MXjtS\\/aObRfZUtdHvPgy4sNJQlPHLFFJWmGIIeFimUhCC8sGCVZ1pZqwGndPKygMH\\/\\/FgQA7f\\/AEwMpkocaAFtuytJIUQipKurmLqAAdZGO\\/EJp8NftwOZdvNaLy66l0GlFqQjy4U8MaQFDKCPOu0yJ7a95LNf5Py7LFOuGN7N95\\/vhn+utSZ+9\\/giiuctiQRqUDTukSuZYZaAEwKiFoopBMkhedVR\\/\\/xYEAQP\\/wBNjKZCFJ4oAJlNUlxBFS5QtBdQAALCaiNDhYtO97xUSvE4gb2zGCqmHmZ1xQwD7vSRk71JQnHA6NMySZ09xgV3kBUgdLZRQvUqWri\\/UhuwWhCMUsvXW5GJWWM+mNuvW\\/l\\/jITtnvNMBknz2RxgssnCclMNdC6eMhFPv\\/xYEAQ3\\/wBODKZKMIwqXzlytNZJrKl5FiJdVaVIAC8IEbdUiz3Bom35Wvsdb6HUJYMq4FcE2NHkDIWRF9mnnPX2iucHJXJGqy8VPUXPcd7enMZTciCCZ1+DnhhN2hvoPrDLqN1bzkM9wrLixg5ZbKVKGoSgxrAgWorlWSr9ClZXTEoFwHA\\/\\/FgQBB\\/\\/AEqMpkoMmIEWO9xVrTNFSUgi6XSCwAM2xO3HuMumrfjvt8OcD85QpW3dRLK8VwYHhOY7\\/B6E9rLhq12fay5kKqcbB9EG7DciS2cejbpj7RLivUERAa9p8w5wFmhqoK0bUkxzmEV0QVneIzj5f4Si7x\\/oVWn+OfQLhIroA7\\/8WBAD\\/\\/8ATIymQjhcAWVUJFqtUKukTjd1U1sAAVszTX1Eefjlfg0\\/ddPxnmu58uLbLh+\\/1beAZImhtHP1Ksc9XsDrBcT44VXwQX6L+8ntzeiH48ay43WhPG8eT257eGvlC25RQTqA3BaGOAS6gBVxiQtXLeK9ipX15WWGGgH\\/\\/FgQA\\/f\\/AE2Mpkk0WGIAq3S6uWupUJEotBV0AAGdiiPcSaKXlbndEizTDgyV4u8RejRuxG9WUpKRyLyIXrXUwkwqPWs8as8lYU7aYmqqaFu3Ripft1MzXeVYSIFIqlUU6whrTc9BUI3xGLmslr67O3oqIEV83t9m\\/VzRuIc\\/\\/FgQBBf\\/AE0MqEow3gEpWstJrJUVVyoiQlSgOceEyk8MwzJNOZWh8S0qRJV4phxVUAkqU5Bg5N00AvGHWTh0ty65qdJTrHrobSLAi3pRTsYmMM9qvjXvacyuQt21eqoXRjEIRM6YZ+BQIXg4rm5BFVImSLXvay99KgtPna\\/cM5JwA==\",\"file_name\":\"recording_1752559385209.aac\",\"mime_type\":\"audio\\/aac\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident949762614472025-07-15 04:33:59\",\"questionnaire\":{\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_9bd23f3c-884e-41c2-ae18-be6f3add1319897875521034631000.jpg\"]}}}]}', '2025-07-15 00:33:23', '2025-07-15 00:33:23'),
(16, 5, '{\"id\":5,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sameer\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-15 00:38:36', '2025-07-15 00:38:36'),
(17, 10, '{\"id\":10,\"assign_id\":6,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"7510895815\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"boss\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/ADiMqzIQEqEIkyc0lRrCil8BEAATyFLguLH4xpmiO9jzHlP6nofxj\\/h4ZYcO4xjx3vLM+wOj4Pw4HUXA+fwQhvMBClpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWl4\\/\\/FgQBQ\\/\\/AEGMq1MoYAE1VN6VUKigEmJUFrYU08A8gjqFvyGXp7bbkU\\/4bE8YdsP6xscNN3zZ4cc8pxXVUZ8VVgOKVRz04JpMYkd03JApx2RpNvvt45yQ8I83jpDOrJuHFzdEVelUK+XOWfIFApyhjFCuOZjRPHVxVhfH3\\/STInS1E7RCxGaIagW9FxYsneYopa4JWoXRjMmLpRSTjK50Dj\\/8WBAFl\\/8ARZSqOzkISRGmyb1JLpKQQhKgJgRDTlM6mNJS7imb5\\/k5uB\\/Z26sNDRpUtwU2TN7e\\/oOf50LB5XH05WZZHStczSZRPMXVOQOF8k3vPmEqEeRgCsSVIqlArhMIFCXbwMFFHKJ6J8MnCymfu523mVQVAJFNi8zSPv53ssNSLK6lh8pzLdKP1MZmM3pHB2QrWoJ9OiiBmWZShOiTeNrnJS3EZMfFwp0v4Vb9gBw\\/\\/FgQBaf\\/AEem7GQ+Qh8tt0Jr0Sqy+LzVJ+V1dTNVF+9cZrCLf6\\/WrFZK1X\\/CBUzL1IKLaGSUrlgX4XtNWH3jLNa5NZYvVjmOCCgifeYgEC\\/MBGCFjWERAksV4NE8Vc2V2EYh+wbphKYHB2A7V+4BbYZjlQD6SPDXRf4vMaxsp8ZNhumco7u\\/Ztz3\\/tN2dHJs15rirXrphkqDaiKhrKQ2ppF9kproYtq1YiTy+yypKtTWpFw\\/\\/FgQBU\\/\\/AEq8pHEpGGF3VVeS5Wql23CpdRvUrVVe9jvQYQ0a5nxmTmhRUPCApLOIEPlU6ItbYdVW3g1kj4s0CI7zs3xuJzzNooxq2V8+jJ7+nrmACrHFmujLp0boKCKCp0spXwicKikIpKyjHHkVg0ESktlNPdzI3ogx0NUJM1qw2WW004qpYuGJqQFcUFE0EohCaAjyNm18cV1tlvjcwiOt1XSu7ADB\\/\\/xYEATn\\/wBLjKY6FK6BMJuqk0XBaqSrQpYSqAARlMrdrqNcldHTqBAMd2eCnRr+K84NOtoWT3pnRyhFzbEajRPpWdtPTCh33dx1eMfp5r+c3R2dFHeDvprmXYJmOGtL0aO3d2L+\\/W8Aq5DiZ0MzkHJU8mgnoE+fJBKgyUANq9OBdCsQo3p4FcIb82e7QLDKNxmeLl5Ctu0+6miB\\/\\/xYEAUH\\/wBLjKZCGKZkTlmqvVWmavJlalSGSXkSqAATCdSXUNrGtMPDOgwvhdUWRTXA2ZR4z1wCTeAiBrl9uLtdSnU\\/smO08+Xo+fVaexs6BAjhB+P6jESgyloP0GTu8SyOHnDUHcRVSwZHRWYgto2K7XseIFHoHWcG+dqDBXoceM6Q0vY7vU2513V97ZuOt4rTODqtU5CnnOXn1cHEBz\\/8WBAEt\\/8ASoymYiRgrnFpqVcq5k3ckqXVSCKAAhnWuKDO4YDT6sJiHflNbM8uL2xZSjwIOaNijIrnbRv1rQYmfqWhGKTPDJPeugH+ARTI6Dbvqjfvxiw0r+CcmV6JU5wer5o0Y3a5dirRRvy6e2AR1ULWZtnq28728ez1OlVpa5+nZ2yfpJdgoUVrLZ+Fn37Gt0nhA7\\/8WBAEd\\/8ASwyoQiGKMCq3qSJIFUXYRCpGBy3PuU2yolxT7YpubPLHDvikVDhLEBhJGA8IIRmNQW4oRzohS0d2dHPTHZfLLKBEa\\/KVYo55\\/jgRkN7mAIQRzsnul3cz9LoWcuPu99OdimWWpot0ywsaMgFipNcI17U2S3pzpGlJTuESVFUhFy1wQlaRG4H\\/\\/FgQBE\\/\\/AEqMpkolgmQXPV5l2uRpTc3NXYtBVlACcgA980rgNUuHVeEBuzeWTKyp4EcnIHxkR8ysWSpyyRqSTstxYZ\\/8Dm9y6ZqLb20Y7Kvg8xIUtmhdg6ktKqsWxO9JaKRvVBYM07o1qI4usuLYWjbHmadebG2t\\/sy2JxtLQESqNgtbUIqAcD\\/8WBAEP\\/8AShSmSjBg5zM1qpIuZMqru4RJKVJMAATiciK5TJddK\\/fQMZVTMtk99DI6xPdFjwlrBViZZGKJczOM8NgDrjoRrNnyuj9Jcs6LUOPDVOuT\\/SM77MRaMn4Wj0tCZGFhcrCBWMrSxdkCkVSyN+kZXsqlMwVtFi5bYzASDOW0bEZAHD\\/8WBAFD\\/8ASibpZj3RSjxVTGmh9K4vnfnpHD+nGSbmtVlPfhGVcq6+epKW2W+yCpFNSEQDjWWKXmWiBI2lDrzilO2NBCggMZWDACiSSwVnAWuAib4jSP8\\/Qs97XNhStYRQHYltBYa0wj0OZVRQZe5Ofj1ZeUlkf8+fgQAAA1\\/T6hfhrTd\\/DpJWw14Gn\\/Kv5hgy02HRf0R126I3kItIIwBwP\\/xYEAQf\\/wBNvKRRPFYBTxm71w1vjdkyrurm11pN6jYs0xJv+NWEOE9Yss6cpFfKkEQfjImpVxNIW5CY8PMtLSR6JHOAEoSEfBlrrNbCtEZ0Px5ieKqFvF1yB4Sa+6SvIRz2pGVk\\/5v8YHGa8luskMssq3fvZPs7RT+2ErfFf9J4asH\\/\\/FgQA6\\/\\/AE2MpCQJBEpAjEAlTvVpLm4a3UkUWSk4rYf3sNjY\\/kAeNiHPlQFlGu+EFtaS6kzolG8CTnuHbelJ7khZTi4e8acUuxJIrCskNHxyzzs9nGi9al6d4iNEqAH9r5VF5Ql7SuhEGUBU3tQ04xSPYDg\\/\\/FgQA5f\\/AE0MpiQJBko4gFGd6uyQRSS6xLpKOqwAZ1nAg7TuRv4K\\/X+GjzWgDSY00+h6TztHupELg9s2yZ\\/2UFD1tEBk2I\\/unRNZQii0LRfUrL+Dp3qlESiZiCIKEg0CNiXO1w4IATXuKqhEMosSSMH\\/\\/FgQA5f\\/AEwMpBQYlIEYAJdZmqi0qVFQlDVKlTig\\/cIQu4myeLDL3p98ve+XFkEJKhRs6wpYMrPmv1v6GJC0QZPc\\/QnUw1HudBJC9EFBD85DbBRah7F3HBMqmaFUp3NMigWDSOoMJTzqwBYDP2QE1VO\\/\\/FgQA9\\/\\/AEwMpiWJiIoYAEmZGkq6ioqBGlZdNAAL5hAqrKK7T06Pa7cb\\/RvF9jPC8JNVb6pKRNleYmtTAXu3l2LYDcTOSV7LY6JVWUdgyG4FsR2H3iJOHY82772rD2VUmRFvKC2UpSKQUCIeGh1ksCAEL9AIp7wTEMH\\/\\/FgQA4\\/\\/AEwMpBUNXjAAozw6l1IAQJw5uVJdB+CkHCrTapYKybGKb6mO4WXz5\\/H8YrGNcenoLhM3pkuLQMZpRMRBaNlkEps1uvVSzrHNp5QH+uwbIwSTqXuBxTmpGSihvAtMbQFYCcLgGBZQBTeIhz\\/8WBAD3\\/8AS5SjDRGMqheAUrOXVwlQqKsJpkvckge1BGRXnO4FWCMbx+tWz2hWdRiuSc5Z54FysdFznB7ckNpttJE5tu42LEQihkxlUdnJnKV\\/Pr1KugbkuB8axqiiqjvSHK43ihSUim6gBa1iE0wrO6lAWRMwWVFkHD\\/8WBAFp\\/8ASCbshj3SVD1SHy7XAlvgJOMnH2pda3xEx71eqmLkV737VKprLf8ICpGRxBqA09jS5yu8TfME04\\/LrHeplYMJG6qIFedlFk5SLHKgkAACRie5Pg6chgn9jC9UQgvV3cOycy86pBCacMoCn3xXAloAHyHm\\/6OeKnhtOSlJpW2XxX\\/L8SEbHirv7D4J9ouH9vSY6aMhZ+tqu0f9n9Cqz7MSgy1\\/VGZSVWObesoXi7\\/8WBAEZ\\/8ATKa2bExjMkPMJEPT0IMIMK879\\/p8VW2XLvOc83l7OLZ819OsTGpCQA+jqkrwsxiRXpNommnYQNDn6I5BH0F6pzzIQsWzWyKXqhRWU8JnY1JrsJCQCe24JdAuAeFbQcExehcA7Pq2qKYtyWYrTu7G2AEFyZOA5BvquEZAOR3hd1BUKFTB\\/\\/xYEAPv\\/wBKPKYxSNrnnKvimkgXkBLSkgoESMxClo3ozB2ZZcOHCBgV\\/LNoGOOJra5iqNHEkh2Yiyy5l5yUHUrJv9yzNQtoSB6jJFZ0RPvX486eGFrXrOpjKY76PSmnWQ2KwSswkVqybc4FYzIHUI145CdJBBc1CNaKADg\\/\\/FgQBAf\\/AEmMpioQmDB3ve+OK1dXl1F7iLzQRKgCIUG4kNMSEl1Hl5HBXr1PRDWzSDu2Me\\/zVlxnqO\\/PafZIp\\/QCUoP0vpb91H0HiQd5QS+akpznHdGGWliVrRi8WWZT4Uwqy90MNZO0CpewUXkTTiir2Vik9cUilweqi1VgHD\\/8WBAD9\\/8ASoymQhCaLFd1mpqJA0VCVLSkCAAKaDWLRucDzqyn7aYAqbJ3iKYVsnEWU7nfEwR6YuEXm\\/92YIFlp5Lnq4jqfxWafouaxabMpJwm9TVtLdE8MgjSF9ZwFIpQqCXWpJdNiyx2lWtKShlvnHvg5RhIxMIxUvAUAf\\/8WBADz\\/8ASwyoKihqAUza9VIkpBVyoREq8ug5wSikCEyhoxLytRrZA9BgEax4jJu\\/efmNX1rszXsYYaUfoL97y4wTxN2SuvTqpOOX9rKU1O83KlkNE+TDOlG21pO4E5CFR1rEsBmhAs280UASzLIlCEHMAyElWlw\\/\\/FgQA9f\\/AEuMqEE0YJm2rqWggqQirq6QQOcssQBouiQpKTusqydoBxLVRTCT5NdFC73p+3m308ui5Qz+15Qno51c9HotF0oOFYE+n0jJbbRlGatZ2oZkz4DJcYOMSQhUukkF4pzU2\\/krcGKi0SthbznRnuVBKCwAOD\\/8WBAEB\\/8ASpSmQihmre60akklIlLRBKWKABazI5BDyIFlwpr0EMoAcZ9BITBjO57VKuNqug0+Oar7WW242SuXZCp3UQ8jRjjhtb7SofRfw4GuaUQwU33mUjDw0KZbGyF7F66pUebxtB\\/USmkISVhYpGW+V2In195FhnEq1XAcP\\/xYEAVn\\/wBJJuxkPllkPdeiW6GN9RUvWq1X9a9qY9uZmV6nkZcqP7ffiZlUXc+yBVDrmpBQ1Lah2XSGNuTDH35erdpeaZ4yOhYLEgiRlYrSghYUAGGoWvp9q6LhHqBlFVDkTvoIvWIhgEWSwJOARqpbeALEiWYOr8FS3PlGy\\/tuCZ0W8eD2r+hCwCl\\/YJYZobGWGxDJZhOaJt9ZYwJlZNaBDYPbICbJ3K0GZz\\/8WBAD7\\/8ATjylKVxS48b31eccFZUxAVLlrpMrkHfiZzqp5quei3pG8Wdrc19aLD+\\/7B3NoRkO85UaKtp1cL7kC+pRMpldyrlyV4J9+5CK6SlfzVcOZ208DoDEXqJhgXQrMLrWFzesoXHIBZSO65RTJS10G6MKZMswpEDB\\/\\/xYEAPv\\/wBMjKVJSEwBEasrvjXPHF1VXguqUalolVQOq5xdxrFNZ4Rfn0xFMsxzwLRLhka8E39baQ6TGEHSfAWkybIzoX6nYFQwyCUfgfe5ToS7RoqAmCveXlr25WgKVuYL1WLZiFEkWMFhUgvO8Hk4Vw2U1+\\/LcleqoHA\\/\\/FgQBEf\\/AEsMpilUVnvO+NU8pMWm6l4rUtpUMACtRCNzU7xIjgq+A1K4cMlBGkm5RJtcqjcotFatKaFij2634TrsqFKgeOiZdOS5N1j\\/fiUI9Onz6EG74Et15V2RN17K2unTS81bzM4tqrLdlTlALK1vX9KNWJinamWV6RTQ8jw\\/oxoWezoB\\/\\/xYEAQn\\/wBKjKUpQQorTuvHGk1UgJUqTdyREVMBiac730ZvhERT+3a0\\/WWg8evXRB+uBkDabwCihY1V1P9p2JWjJ\\/0TDAADGm5FTy3qSCLHnldS2ImjrsznU2pNylfqFqTywsPNdeh6s14nwSlcovU3RQhCUg2JXXW4P4ZnHGthw1A4P\\/xYEAQH\\/wBKDKZJLUwrZ23xeXwqEqUaUXIVAAGSqtTgd6wraFDuADhWA5VqQLCQlHn\\/ph7Su86EqfXkA73yWk9izcySO4yhSk6E3MlLRa8LgtKcq3gbum2lblcgsWuWHGwxTjFzGDLS8yyptkgmNELWR6dIN8YFr76qYao10AO\\/\\/FgQA\\/f\\/AEqMpBQNikpBC9WVVwuEqAlWxxdFaqrD+BQ2oiKnFgk5fZxatmv1oRbVrgpz5WgRBck8+xqH5Ie0bm4iTFGDYb7RGEDA1QiEM5cFYVbycaOhBgQjKn\\/cEwRiTkJcUrwFFCVqk7KokDTONuIRqsQLIiTSJhzsAHA\\/\\/FgQA8f\\/AEsMpBQYnC4AnM3qLNUlJUqLqrRJkug4klrc7+FxI8tmZ+MBYXQhM9GXhJOPpjg0MaQnzUfudgHw0b0M3citi9KXgTBk6jD3rCGVWFsdtV1PfKX2uhSBns1BElFVMEDgbinW4JsW7RWiCGcARjFmAWc\\/\\/FgQA+\\/\\/AEuUplksXjclXZEpAhKkqBFADvckoKyWLwK3d9dOaoIr2XIk+g2iAQRRr1eOsjRRJTvcUN\\/yBxFDMwP2YhpPJEq9RgpOT8KyRohr523RYI1LJIntJUKRlA3TkotOtCSlR7mohCE4CSt4pDtH9ZRoMmWcZXXAcD\\/8WBAFD\\/8ATSabZFRzMe36OMjJMeHtPPrjpvJWfp8dKrcpN5lhTVR8\\/zvq9qd\\/GsxqTKqAQIGctjZz7VnWKHC5EUSUzEvGVrwVhA6nVY4uhviLx55bXA4UDreVA6nrrK62w1da6Mdycnd\\/G9DpXhlnRH\\/fdGgP9VraYHBrfPAGEAQ7XPv2PjVKF3wW6jyls4GFMjYFL0SgHuIgW1iZUICB\\/\\/xYEAP\\/\\/wBLvKQxVFS\\/G84uHE3Iy4VKpa4hQHuDGkw4r\\/zP\\/Sub8dz39f303sXI0i62jQHUvrdEJyJLSwcxvONABB8PxUzoFQPLQxxa9zAIPB2KJGDxVldRPtL3F8JgXnWhRfJStOFBWtrCE41QwQjjivK0uNihBsgraxiAcD\\/8WBAD7\\/8ATQyjExEIUhS8+uWrTgKWiVRIuUgoPYu3jSqQF3n1waKb48WtbDQ11gTrLH52FtPUlm+iUCcBhzCdaZojlYlhrpA6J0wmI8db7Z\\/uQUVIPiMq3rk4HfYKBukqK1Smqf3qC4t+de8YrztgTkkvI3ZJz9FYSVADv\\/xYEAQn\\/wBMjKQbhYhVFDXPrU4aiVrcSVZKpcRCgs+Bg4zbfhB6fWLXMCUdUELTLIkfQIgfLFt48f2Ra9dhAUOmyOF6fSVKVgrWwxwBBHNb9FI4HC+6fxqrSzronWAycou4w034jIhG0RtKWJI5qx7zXEYiyTDKT6E43AiR\\/aU0qgBwP\\/xYEAPX\\/wBLjKhCEJQuAK9+tXa4ggQEQhAcoBYAgHOA68CHD0LHjMaEzXGaKQCBAJRG5xfRE4RtcM0j77+LtfjMuwX1qYha3LqEzYdoBUsqlWZGlJbqSzXzLaUdvrVpVRQUmsrJWEGSCCAnBZNACW2swRbVBWQucyn\\/\\/FgQBCf\\/AEyMpBuNCEsYL59dNNWkVdRUkKl0IkoP4Jsn8b4E1fautsXwd3KyQatRQSA9fcK4bmQ4Z\\/cKnmkGnwc6n6ECFLU7MFKYyTo2xngqXjZScGCuFO8o3jbEgtRW8fvFQrkm3R9NRsRthIk8kuMrJQrOEbwvkSE6CO\\/UjPSiVA4\\/\\/FgQBBf\\/AEsMpjIgki5WeOK4rS5KiF1EmXeREqAALMgvJTNO0AH1k0HU1Xa9Uf3AT8DvmOENsjK96sTuq1\\/fuTjSqFC+nKDHWSFEetiYwm9egUzRtnRM6FpyjWQghoSsYJ3FbwpCtNvCVF1NcllbWm2lW3hjVGhG1iCcFlQcrgDB\\/\\/xYEAR3\\/wBKjKZZPFad+\\/WrzVXcoiIiEqEJQAjaIYTi1QM\\/q01wXlJjAy2XVjZQDGJDbIRFZ34wqzduB8+HJ\\/W9VXt71bFSDd4EmOmLfOZUneswN5yqQyjGy1CUSirQl3TrJwc2qtL6cKV6ZNGy8T751FY\\/\\/9MIXhii2JX01cvbzvuNFRghsqIZivJnA7\\/8WBAEd\\/8ATpSmGiCYLlZ441fGXLl7SxJJUlBKkWwh24ABLLnnnnnmqy2WcDtAgVCOuichFJRpOnYe9gKFl6EQfOpQNYuGjfP7XICbuxhjGVowUvsvKBCPpm7aD2XYOUikYTzTUlSK05dv07YikLIbW2upXapc7kok\\/Lzuzz58Of3zZs0DkeJ0aNClwMH\\/\\/FgQBKf\\/AE8mtk4HKjyk4yPw\\/ldZzNc1xrGcZm6NDx+7zhvXjrpn7fVp44m3m+WpGVSCgH6z0g8QPqD7VnFUXEGPpi3PPVwcH\\/2x+FPih3TlHNPr3\\/KwEf3T\\/Wh+C7XsgO1w80AqAGrMw56AmZiwS+Kt+tw5IaF52FRG0yCKmlCpUALSCwsd75XsaStOEUEEkrJnP\\/xYEARX\\/wBLPKIbEJqFIonZzzOMrqarmSl1FSqJckSkA2U\\/B\\/yd+tkvoBGYIJGvAgh7NENJyC0qO6LKg+rxSlUszc4YhAMtldMCGj4onA3E0i9XB\\/Lio1DPe\\/u5Tvmz++KsbKCJPuHtwiypZPQrVGK5eYSPIsurHmrJ3U13Kz3XpKS69t0JVJgcP\\/xYEAQH\\/wBLDKZJUFDOebu8vhKKkzVShS7kCgAFREEtiGwnrOrbGWRqhiwLLAG6Q9\\/7X1Jcmif6uGN8B0SkkXA7RROysEZsZATmA5w\\/7fftx8rq0wzflBIoUe9vFp9JKYoz9SkeuH9DeTxCrLBNK1JFEAQWSkahMMARNl1CgHA\\/\\/FgQBCf\\/AEyMploYkoMUGcxxVtXNkitUlVV3LqCgAWoEKay3pAbSduq7YYLD2mtRxDyARnexiM+FewVTfIytG9HsKdRUigkG+T0R9AsBxvNWbMQ9QjUOiG5+xPa97jwRIrZacSJabIs8mYe+y4TRujioGlA0kFsdIDiEKCaQsbyCoBw\\/\\/FgQBC\\/\\/AE4MpkFMVLrdTjOEtStVESlRcRKmAAtCCG9a4Nqb\\/Ld0v\\/qgAIgUoeQsy6Kar3AhPeXkv3nVgzwJZUsktMXf\\/Xh41ojXCx7FRBjHz8KxA1KwjR70YeI8j1XNMBO5yeukPz0V0xQmje5Wmh0BeGpqi2yuynNJUnAtxrScCgBwP\\/xYEAPn\\/wBMDKMUHRBFF6pzV2uLKQgipLUQoP10e8wM6KxMcad+f1qw6gmDDFcVNMd4Yz6CvOEHck7chbPAl0GnZvKirxFVKbD02B46b6ELOSu1+GMVW5\\/qz9r7O0StWBrMK5AXAc6RFBIVVZ0lIXFHZFUMRat0pQdgA7\\/8WBAEH\\/8ATAyjFBlGSUCRRUAVTMu0S0olRKipqUpNbE\\/4s+9KfPTCkRf68iJT0BCA5SSRRQmGLYvR2QtUXi27YmnazZum774WvzLpRD5qOotQa6B8aUsbquPWkDidEzSW\\/JuNzs1IK1XRmoOU0U1Ys5QqtVeIzRFVIAVipGgoAq58P\\/xYEAQf\\/wBNDKZJRFaY8a4WvWIkpUulXdLqIoABSiYXsl87vLN5Mzt03nJOh0nICzmKKwvwuIxd2dX8PvNwo4iO0T+YSsBsep6z2EFhLPTGpaR03pb\\/H3eeQYwg5Ne+2hDnQjiqrZZhnM4WtJZGukCOrJJCMc2yCdxe0BZd6l6lgMH\\/\\/FgQA\\/f\\/AEuMowwlBE4VAFG93GokUiUhKuKtSWHtnCYgLLSbW3dU6y\\/oD1jigM9J40kkk5BCgnAMtBX7FV++rxlxJEutWIYjli6CD\\/eYeNsREGOg4V9kAqFvl8YZGDLzJIklI21CJXtETFalrGFQSLkp0yKgKHYyJUlaBXg\\/\\/FgQA\\/\\/\\/AEuMpBQZCE4VAFec1a7upCpFEEl1FSQPpCCVp8nnmRVqPS9KhDWsrCzXHXECcPzhRYxQNahmujybZ6Gv7prY3RwJs5KiZUYdXorZBiixPzdbfuB5pAJPHnUTBQkhUqdjtCkQZTgO9LrEisbm4BQhyZ040teIqlRwP\\/xYEARP\\/wBLjKITJJ4rPVZxxvWquSi1VEvLuguoA1ttGL+pLT15+uSuKsHqaicBllKKmeDsFKRZ5u0p1iQ7+X0ScotlhWl9YXZlg64T4u9FAQFkAtpGXRDxW2lOq0lLJVSUNWamq2ZUpbKbL6paV8MaxuneF768sgpihucpzQ1OtM4mosIEAMH\\/\\/FgQBB\\/\\/AEsMpBURiko4GYlqtEpV0gi1m0NBxH1No0TbAlyeqffzm1PJhkfo3S9KlWfZUV4DQ7321Ahr3BFDidQeOhoDKNyeJxTKYxygDJ+\\/R\\/C4Ka8GSttAzLxRTJRUEoVGVrEqztKIqEwwVSXrJFPny5Gnv8mfiwKkyob8QaYAwf\\/8WBAED\\/8ASwyjDR0QMSGATfPEirXSULqUki4zIB8RJHcmAnUlXzzofw6cN9EY2MYBYbSoulVSfsMA\\/lAY4nKpSdsy5ajWPKXNOcZ1nENj6ul7jm4+mzg2SggMEUzqIJkAZgIqhdEgsj+loDNnW4mtWapS\\/f0IbqSshD\\/COJDoA7\\/8WBAEX\\/8ASwyoQhSKghgAVc71cy7uMsJUIhBUBzkAmeXAkTQ0bmdTwk5DwG4JlQGmYBUvim8pVF7K0VUigSxo6w2QX1wrxavbImucVEozGmo1\\/52cqa66eccU8OeNZ4eS00JTBeJNGh2nsBMoqkOdM0ccVmOS9ddWyUp+iFH\\/N9ZT8\\/6me+vxS5u\\/\\/FgQBA\\/\\/AEsMpxwZCkkXK7aStSSolFXBEvBCA3akOJWTjd8Bu71TMiolJk1qTDZaiUMF87IS2Kt0GK05lK3yTy0JUITq9Z0ar6bFf7wtIyJrlnwY2\\/FLXEYZ9KF71yd6CvIimrMtZMCZWZWql7rqUd0N9e5A3zOaomgUCVE4pgO\\/\\/FgQBD\\/\\/AEwMplIsYJ3zq5nFy6lF1UkXS1qCwAGxIxpketA9DqOqgTw3Tk4RlaaGSLdfAi7QM5JqOWDN0COyImqs1P1VQy8puxOTe0hWK5jY0QhXpox9demXunNCfCZrnOHc8qW\\/STQ5HBBdEVL1snLlPUO3NPMxjBPWLkZN\\/O6Ut4xWQA4\",\"file_name\":\"recording_1752562708624.aac\",\"mime_type\":\"audio\\/aac\"}}}]}', '2025-07-15 01:28:40', '2025-07-15 01:28:40');
INSERT INTO `questionnaire_submissions` (`id`, `case_id`, `full_data`, `created_at`, `updated_at`) VALUES
(18, 10, '{\"id\":10,\"assign_id\":6,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"7510895815\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"boss\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815102025-07-15 06:55:55\",\"questionnaire\":{\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/ADiMqzIQEqEIkyc0lRrCil8BEAATyFLguLH4xpmiO9jzHlP6nofxj\\/h4ZYcO4xjx3vLM+wOj4Pw4HUXA+fwQhvMBClpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWlpaWl4\\/\\/FgQBQ\\/\\/AEGMq1MoYAE1VN6VUKigEmJUFrYU08A8gjqFvyGXp7bbkU\\/4bE8YdsP6xscNN3zZ4cc8pxXVUZ8VVgOKVRz04JpMYkd03JApx2RpNvvt45yQ8I83jpDOrJuHFzdEVelUK+XOWfIFApyhjFCuOZjRPHVxVhfH3\\/STInS1E7RCxGaIagW9FxYsneYopa4JWoXRjMmLpRSTjK50Dj\\/8WBAFl\\/8ARZSqOzkISRGmyb1JLpKQQhKgJgRDTlM6mNJS7imb5\\/k5uB\\/Z26sNDRpUtwU2TN7e\\/oOf50LB5XH05WZZHStczSZRPMXVOQOF8k3vPmEqEeRgCsSVIqlArhMIFCXbwMFFHKJ6J8MnCymfu523mVQVAJFNi8zSPv53ssNSLK6lh8pzLdKP1MZmM3pHB2QrWoJ9OiiBmWZShOiTeNrnJS3EZMfFwp0v4Vb9gBw\\/\\/FgQBaf\\/AEem7GQ+Qh8tt0Jr0Sqy+LzVJ+V1dTNVF+9cZrCLf6\\/WrFZK1X\\/CBUzL1IKLaGSUrlgX4XtNWH3jLNa5NZYvVjmOCCgifeYgEC\\/MBGCFjWERAksV4NE8Vc2V2EYh+wbphKYHB2A7V+4BbYZjlQD6SPDXRf4vMaxsp8ZNhumco7u\\/Ztz3\\/tN2dHJs15rirXrphkqDaiKhrKQ2ppF9kproYtq1YiTy+yypKtTWpFw\\/\\/FgQBU\\/\\/AEq8pHEpGGF3VVeS5Wql23CpdRvUrVVe9jvQYQ0a5nxmTmhRUPCApLOIEPlU6ItbYdVW3g1kj4s0CI7zs3xuJzzNooxq2V8+jJ7+nrmACrHFmujLp0boKCKCp0spXwicKikIpKyjHHkVg0ESktlNPdzI3ogx0NUJM1qw2WW004qpYuGJqQFcUFE0EohCaAjyNm18cV1tlvjcwiOt1XSu7ADB\\/\\/xYEATn\\/wBLjKY6FK6BMJuqk0XBaqSrQpYSqAARlMrdrqNcldHTqBAMd2eCnRr+K84NOtoWT3pnRyhFzbEajRPpWdtPTCh33dx1eMfp5r+c3R2dFHeDvprmXYJmOGtL0aO3d2L+\\/W8Aq5DiZ0MzkHJU8mgnoE+fJBKgyUANq9OBdCsQo3p4FcIb82e7QLDKNxmeLl5Ctu0+6miB\\/\\/xYEAUH\\/wBLjKZCGKZkTlmqvVWmavJlalSGSXkSqAATCdSXUNrGtMPDOgwvhdUWRTXA2ZR4z1wCTeAiBrl9uLtdSnU\\/smO08+Xo+fVaexs6BAjhB+P6jESgyloP0GTu8SyOHnDUHcRVSwZHRWYgto2K7XseIFHoHWcG+dqDBXoceM6Q0vY7vU2513V97ZuOt4rTODqtU5CnnOXn1cHEBz\\/8WBAEt\\/8ASoymYiRgrnFpqVcq5k3ckqXVSCKAAhnWuKDO4YDT6sJiHflNbM8uL2xZSjwIOaNijIrnbRv1rQYmfqWhGKTPDJPeugH+ARTI6Dbvqjfvxiw0r+CcmV6JU5wer5o0Y3a5dirRRvy6e2AR1ULWZtnq28728ez1OlVpa5+nZ2yfpJdgoUVrLZ+Fn37Gt0nhA7\\/8WBAEd\\/8ASwyoQiGKMCq3qSJIFUXYRCpGBy3PuU2yolxT7YpubPLHDvikVDhLEBhJGA8IIRmNQW4oRzohS0d2dHPTHZfLLKBEa\\/KVYo55\\/jgRkN7mAIQRzsnul3cz9LoWcuPu99OdimWWpot0ywsaMgFipNcI17U2S3pzpGlJTuESVFUhFy1wQlaRG4H\\/\\/FgQBE\\/\\/AEqMpkolgmQXPV5l2uRpTc3NXYtBVlACcgA980rgNUuHVeEBuzeWTKyp4EcnIHxkR8ysWSpyyRqSTstxYZ\\/8Dm9y6ZqLb20Y7Kvg8xIUtmhdg6ktKqsWxO9JaKRvVBYM07o1qI4usuLYWjbHmadebG2t\\/sy2JxtLQESqNgtbUIqAcD\\/8WBAEP\\/8AShSmSjBg5zM1qpIuZMqru4RJKVJMAATiciK5TJddK\\/fQMZVTMtk99DI6xPdFjwlrBViZZGKJczOM8NgDrjoRrNnyuj9Jcs6LUOPDVOuT\\/SM77MRaMn4Wj0tCZGFhcrCBWMrSxdkCkVSyN+kZXsqlMwVtFi5bYzASDOW0bEZAHD\\/8WBAFD\\/8ASibpZj3RSjxVTGmh9K4vnfnpHD+nGSbmtVlPfhGVcq6+epKW2W+yCpFNSEQDjWWKXmWiBI2lDrzilO2NBCggMZWDACiSSwVnAWuAib4jSP8\\/Qs97XNhStYRQHYltBYa0wj0OZVRQZe5Ofj1ZeUlkf8+fgQAAA1\\/T6hfhrTd\\/DpJWw14Gn\\/Kv5hgy02HRf0R126I3kItIIwBwP\\/xYEAQf\\/wBNvKRRPFYBTxm71w1vjdkyrurm11pN6jYs0xJv+NWEOE9Yss6cpFfKkEQfjImpVxNIW5CY8PMtLSR6JHOAEoSEfBlrrNbCtEZ0Px5ieKqFvF1yB4Sa+6SvIRz2pGVk\\/5v8YHGa8luskMssq3fvZPs7RT+2ErfFf9J4asH\\/\\/FgQA6\\/\\/AE2MpCQJBEpAjEAlTvVpLm4a3UkUWSk4rYf3sNjY\\/kAeNiHPlQFlGu+EFtaS6kzolG8CTnuHbelJ7khZTi4e8acUuxJIrCskNHxyzzs9nGi9al6d4iNEqAH9r5VF5Ql7SuhEGUBU3tQ04xSPYDg\\/\\/FgQA5f\\/AE0MpiQJBko4gFGd6uyQRSS6xLpKOqwAZ1nAg7TuRv4K\\/X+GjzWgDSY00+h6TztHupELg9s2yZ\\/2UFD1tEBk2I\\/unRNZQii0LRfUrL+Dp3qlESiZiCIKEg0CNiXO1w4IATXuKqhEMosSSMH\\/\\/FgQA5f\\/AEwMpBQYlIEYAJdZmqi0qVFQlDVKlTig\\/cIQu4myeLDL3p98ve+XFkEJKhRs6wpYMrPmv1v6GJC0QZPc\\/QnUw1HudBJC9EFBD85DbBRah7F3HBMqmaFUp3NMigWDSOoMJTzqwBYDP2QE1VO\\/\\/FgQA9\\/\\/AEwMpiWJiIoYAEmZGkq6ioqBGlZdNAAL5hAqrKK7T06Pa7cb\\/RvF9jPC8JNVb6pKRNleYmtTAXu3l2LYDcTOSV7LY6JVWUdgyG4FsR2H3iJOHY82772rD2VUmRFvKC2UpSKQUCIeGh1ksCAEL9AIp7wTEMH\\/\\/FgQA4\\/\\/AEwMpBUNXjAAozw6l1IAQJw5uVJdB+CkHCrTapYKybGKb6mO4WXz5\\/H8YrGNcenoLhM3pkuLQMZpRMRBaNlkEps1uvVSzrHNp5QH+uwbIwSTqXuBxTmpGSihvAtMbQFYCcLgGBZQBTeIhz\\/8WBAD3\\/8AS5SjDRGMqheAUrOXVwlQqKsJpkvckge1BGRXnO4FWCMbx+tWz2hWdRiuSc5Z54FysdFznB7ckNpttJE5tu42LEQihkxlUdnJnKV\\/Pr1KugbkuB8axqiiqjvSHK43ihSUim6gBa1iE0wrO6lAWRMwWVFkHD\\/8WBAFp\\/8ASCbshj3SVD1SHy7XAlvgJOMnH2pda3xEx71eqmLkV737VKprLf8ICpGRxBqA09jS5yu8TfME04\\/LrHeplYMJG6qIFedlFk5SLHKgkAACRie5Pg6chgn9jC9UQgvV3cOycy86pBCacMoCn3xXAloAHyHm\\/6OeKnhtOSlJpW2XxX\\/L8SEbHirv7D4J9ouH9vSY6aMhZ+tqu0f9n9Cqz7MSgy1\\/VGZSVWObesoXi7\\/8WBAEZ\\/8ATKa2bExjMkPMJEPT0IMIMK879\\/p8VW2XLvOc83l7OLZ819OsTGpCQA+jqkrwsxiRXpNommnYQNDn6I5BH0F6pzzIQsWzWyKXqhRWU8JnY1JrsJCQCe24JdAuAeFbQcExehcA7Pq2qKYtyWYrTu7G2AEFyZOA5BvquEZAOR3hd1BUKFTB\\/\\/xYEAPv\\/wBKPKYxSNrnnKvimkgXkBLSkgoESMxClo3ozB2ZZcOHCBgV\\/LNoGOOJra5iqNHEkh2Yiyy5l5yUHUrJv9yzNQtoSB6jJFZ0RPvX486eGFrXrOpjKY76PSmnWQ2KwSswkVqybc4FYzIHUI145CdJBBc1CNaKADg\\/\\/FgQBAf\\/AEmMpioQmDB3ve+OK1dXl1F7iLzQRKgCIUG4kNMSEl1Hl5HBXr1PRDWzSDu2Me\\/zVlxnqO\\/PafZIp\\/QCUoP0vpb91H0HiQd5QS+akpznHdGGWliVrRi8WWZT4Uwqy90MNZO0CpewUXkTTiir2Vik9cUilweqi1VgHD\\/8WBAD9\\/8ASoymQhCaLFd1mpqJA0VCVLSkCAAKaDWLRucDzqyn7aYAqbJ3iKYVsnEWU7nfEwR6YuEXm\\/92YIFlp5Lnq4jqfxWafouaxabMpJwm9TVtLdE8MgjSF9ZwFIpQqCXWpJdNiyx2lWtKShlvnHvg5RhIxMIxUvAUAf\\/8WBADz\\/8ASwyoKihqAUza9VIkpBVyoREq8ug5wSikCEyhoxLytRrZA9BgEax4jJu\\/efmNX1rszXsYYaUfoL97y4wTxN2SuvTqpOOX9rKU1O83KlkNE+TDOlG21pO4E5CFR1rEsBmhAs280UASzLIlCEHMAyElWlw\\/\\/FgQA9f\\/AEuMqEE0YJm2rqWggqQirq6QQOcssQBouiQpKTusqydoBxLVRTCT5NdFC73p+3m308ui5Qz+15Qno51c9HotF0oOFYE+n0jJbbRlGatZ2oZkz4DJcYOMSQhUukkF4pzU2\\/krcGKi0SthbznRnuVBKCwAOD\\/8WBAEB\\/8ASpSmQihmre60akklIlLRBKWKABazI5BDyIFlwpr0EMoAcZ9BITBjO57VKuNqug0+Oar7WW242SuXZCp3UQ8jRjjhtb7SofRfw4GuaUQwU33mUjDw0KZbGyF7F66pUebxtB\\/USmkISVhYpGW+V2In195FhnEq1XAcP\\/xYEAVn\\/wBJJuxkPllkPdeiW6GN9RUvWq1X9a9qY9uZmV6nkZcqP7ffiZlUXc+yBVDrmpBQ1Lah2XSGNuTDH35erdpeaZ4yOhYLEgiRlYrSghYUAGGoWvp9q6LhHqBlFVDkTvoIvWIhgEWSwJOARqpbeALEiWYOr8FS3PlGy\\/tuCZ0W8eD2r+hCwCl\\/YJYZobGWGxDJZhOaJt9ZYwJlZNaBDYPbICbJ3K0GZz\\/8WBAD7\\/8ATjylKVxS48b31eccFZUxAVLlrpMrkHfiZzqp5quei3pG8Wdrc19aLD+\\/7B3NoRkO85UaKtp1cL7kC+pRMpldyrlyV4J9+5CK6SlfzVcOZ208DoDEXqJhgXQrMLrWFzesoXHIBZSO65RTJS10G6MKZMswpEDB\\/\\/xYEAPv\\/wBMjKVJSEwBEasrvjXPHF1VXguqUalolVQOq5xdxrFNZ4Rfn0xFMsxzwLRLhka8E39baQ6TGEHSfAWkybIzoX6nYFQwyCUfgfe5ToS7RoqAmCveXlr25WgKVuYL1WLZiFEkWMFhUgvO8Hk4Vw2U1+\\/LcleqoHA\\/\\/FgQBEf\\/AEsMpilUVnvO+NU8pMWm6l4rUtpUMACtRCNzU7xIjgq+A1K4cMlBGkm5RJtcqjcotFatKaFij2634TrsqFKgeOiZdOS5N1j\\/fiUI9Onz6EG74Et15V2RN17K2unTS81bzM4tqrLdlTlALK1vX9KNWJinamWV6RTQ8jw\\/oxoWezoB\\/\\/xYEAQn\\/wBKjKUpQQorTuvHGk1UgJUqTdyREVMBiac730ZvhERT+3a0\\/WWg8evXRB+uBkDabwCihY1V1P9p2JWjJ\\/0TDAADGm5FTy3qSCLHnldS2ImjrsznU2pNylfqFqTywsPNdeh6s14nwSlcovU3RQhCUg2JXXW4P4ZnHGthw1A4P\\/xYEAQH\\/wBKDKZJLUwrZ23xeXwqEqUaUXIVAAGSqtTgd6wraFDuADhWA5VqQLCQlHn\\/ph7Su86EqfXkA73yWk9izcySO4yhSk6E3MlLRa8LgtKcq3gbum2lblcgsWuWHGwxTjFzGDLS8yyptkgmNELWR6dIN8YFr76qYao10AO\\/\\/FgQA\\/f\\/AEqMpBQNikpBC9WVVwuEqAlWxxdFaqrD+BQ2oiKnFgk5fZxatmv1oRbVrgpz5WgRBck8+xqH5Ie0bm4iTFGDYb7RGEDA1QiEM5cFYVbycaOhBgQjKn\\/cEwRiTkJcUrwFFCVqk7KokDTONuIRqsQLIiTSJhzsAHA\\/\\/FgQA8f\\/AEsMpBQYnC4AnM3qLNUlJUqLqrRJkug4klrc7+FxI8tmZ+MBYXQhM9GXhJOPpjg0MaQnzUfudgHw0b0M3citi9KXgTBk6jD3rCGVWFsdtV1PfKX2uhSBns1BElFVMEDgbinW4JsW7RWiCGcARjFmAWc\\/\\/FgQA+\\/\\/AEuUplksXjclXZEpAhKkqBFADvckoKyWLwK3d9dOaoIr2XIk+g2iAQRRr1eOsjRRJTvcUN\\/yBxFDMwP2YhpPJEq9RgpOT8KyRohr523RYI1LJIntJUKRlA3TkotOtCSlR7mohCE4CSt4pDtH9ZRoMmWcZXXAcD\\/8WBAFD\\/8ATSabZFRzMe36OMjJMeHtPPrjpvJWfp8dKrcpN5lhTVR8\\/zvq9qd\\/GsxqTKqAQIGctjZz7VnWKHC5EUSUzEvGVrwVhA6nVY4uhviLx55bXA4UDreVA6nrrK62w1da6Mdycnd\\/G9DpXhlnRH\\/fdGgP9VraYHBrfPAGEAQ7XPv2PjVKF3wW6jyls4GFMjYFL0SgHuIgW1iZUICB\\/\\/xYEAP\\/\\/wBLvKQxVFS\\/G84uHE3Iy4VKpa4hQHuDGkw4r\\/zP\\/Sub8dz39f303sXI0i62jQHUvrdEJyJLSwcxvONABB8PxUzoFQPLQxxa9zAIPB2KJGDxVldRPtL3F8JgXnWhRfJStOFBWtrCE41QwQjjivK0uNihBsgraxiAcD\\/8WBAD7\\/8ATQyjExEIUhS8+uWrTgKWiVRIuUgoPYu3jSqQF3n1waKb48WtbDQ11gTrLH52FtPUlm+iUCcBhzCdaZojlYlhrpA6J0wmI8db7Z\\/uQUVIPiMq3rk4HfYKBukqK1Smqf3qC4t+de8YrztgTkkvI3ZJz9FYSVADv\\/xYEAQn\\/wBMjKQbhYhVFDXPrU4aiVrcSVZKpcRCgs+Bg4zbfhB6fWLXMCUdUELTLIkfQIgfLFt48f2Ra9dhAUOmyOF6fSVKVgrWwxwBBHNb9FI4HC+6fxqrSzronWAycou4w034jIhG0RtKWJI5qx7zXEYiyTDKT6E43AiR\\/aU0qgBwP\\/xYEAPX\\/wBLjKhCEJQuAK9+tXa4ggQEQhAcoBYAgHOA68CHD0LHjMaEzXGaKQCBAJRG5xfRE4RtcM0j77+LtfjMuwX1qYha3LqEzYdoBUsqlWZGlJbqSzXzLaUdvrVpVRQUmsrJWEGSCCAnBZNACW2swRbVBWQucyn\\/\\/FgQBCf\\/AEyMpBuNCEsYL59dNNWkVdRUkKl0IkoP4Jsn8b4E1fautsXwd3KyQatRQSA9fcK4bmQ4Z\\/cKnmkGnwc6n6ECFLU7MFKYyTo2xngqXjZScGCuFO8o3jbEgtRW8fvFQrkm3R9NRsRthIk8kuMrJQrOEbwvkSE6CO\\/UjPSiVA4\\/\\/FgQBBf\\/AEsMpjIgki5WeOK4rS5KiF1EmXeREqAALMgvJTNO0AH1k0HU1Xa9Uf3AT8DvmOENsjK96sTuq1\\/fuTjSqFC+nKDHWSFEetiYwm9egUzRtnRM6FpyjWQghoSsYJ3FbwpCtNvCVF1NcllbWm2lW3hjVGhG1iCcFlQcrgDB\\/\\/xYEAR3\\/wBKjKZZPFad+\\/WrzVXcoiIiEqEJQAjaIYTi1QM\\/q01wXlJjAy2XVjZQDGJDbIRFZ34wqzduB8+HJ\\/W9VXt71bFSDd4EmOmLfOZUneswN5yqQyjGy1CUSirQl3TrJwc2qtL6cKV6ZNGy8T751FY\\/\\/9MIXhii2JX01cvbzvuNFRghsqIZivJnA7\\/8WBAEd\\/8ATpSmGiCYLlZ441fGXLl7SxJJUlBKkWwh24ABLLnnnnnmqy2WcDtAgVCOuichFJRpOnYe9gKFl6EQfOpQNYuGjfP7XICbuxhjGVowUvsvKBCPpm7aD2XYOUikYTzTUlSK05dv07YikLIbW2upXapc7kok\\/Lzuzz58Of3zZs0DkeJ0aNClwMH\\/\\/FgQBKf\\/AE8mtk4HKjyk4yPw\\/ldZzNc1xrGcZm6NDx+7zhvXjrpn7fVp44m3m+WpGVSCgH6z0g8QPqD7VnFUXEGPpi3PPVwcH\\/2x+FPih3TlHNPr3\\/KwEf3T\\/Wh+C7XsgO1w80AqAGrMw56AmZiwS+Kt+tw5IaF52FRG0yCKmlCpUALSCwsd75XsaStOEUEEkrJnP\\/xYEARX\\/wBLPKIbEJqFIonZzzOMrqarmSl1FSqJckSkA2U\\/B\\/yd+tkvoBGYIJGvAgh7NENJyC0qO6LKg+rxSlUszc4YhAMtldMCGj4onA3E0i9XB\\/Lio1DPe\\/u5Tvmz++KsbKCJPuHtwiypZPQrVGK5eYSPIsurHmrJ3U13Kz3XpKS69t0JVJgcP\\/xYEAQH\\/wBLDKZJUFDOebu8vhKKkzVShS7kCgAFREEtiGwnrOrbGWRqhiwLLAG6Q9\\/7X1Jcmif6uGN8B0SkkXA7RROysEZsZATmA5w\\/7fftx8rq0wzflBIoUe9vFp9JKYoz9SkeuH9DeTxCrLBNK1JFEAQWSkahMMARNl1CgHA\\/\\/FgQBCf\\/AEyMploYkoMUGcxxVtXNkitUlVV3LqCgAWoEKay3pAbSduq7YYLD2mtRxDyARnexiM+FewVTfIytG9HsKdRUigkG+T0R9AsBxvNWbMQ9QjUOiG5+xPa97jwRIrZacSJabIs8mYe+y4TRujioGlA0kFsdIDiEKCaQsbyCoBw\\/\\/FgQBC\\/\\/AE4MpkFMVLrdTjOEtStVESlRcRKmAAtCCG9a4Nqb\\/Ld0v\\/qgAIgUoeQsy6Kar3AhPeXkv3nVgzwJZUsktMXf\\/Xh41ojXCx7FRBjHz8KxA1KwjR70YeI8j1XNMBO5yeukPz0V0xQmje5Wmh0BeGpqi2yuynNJUnAtxrScCgBwP\\/xYEAPn\\/wBMDKMUHRBFF6pzV2uLKQgipLUQoP10e8wM6KxMcad+f1qw6gmDDFcVNMd4Yz6CvOEHck7chbPAl0GnZvKirxFVKbD02B46b6ELOSu1+GMVW5\\/qz9r7O0StWBrMK5AXAc6RFBIVVZ0lIXFHZFUMRat0pQdgA7\\/8WBAEH\\/8ATAyjFBlGSUCRRUAVTMu0S0olRKipqUpNbE\\/4s+9KfPTCkRf68iJT0BCA5SSRRQmGLYvR2QtUXi27YmnazZum774WvzLpRD5qOotQa6B8aUsbquPWkDidEzSW\\/JuNzs1IK1XRmoOU0U1Ys5QqtVeIzRFVIAVipGgoAq58P\\/xYEAQf\\/wBNDKZJRFaY8a4WvWIkpUulXdLqIoABSiYXsl87vLN5Mzt03nJOh0nICzmKKwvwuIxd2dX8PvNwo4iO0T+YSsBsep6z2EFhLPTGpaR03pb\\/H3eeQYwg5Ne+2hDnQjiqrZZhnM4WtJZGukCOrJJCMc2yCdxe0BZd6l6lgMH\\/\\/FgQA\\/f\\/AEuMowwlBE4VAFG93GokUiUhKuKtSWHtnCYgLLSbW3dU6y\\/oD1jigM9J40kkk5BCgnAMtBX7FV++rxlxJEutWIYjli6CD\\/eYeNsREGOg4V9kAqFvl8YZGDLzJIklI21CJXtETFalrGFQSLkp0yKgKHYyJUlaBXg\\/\\/FgQA\\/\\/\\/AEuMpBQZCE4VAFec1a7upCpFEEl1FSQPpCCVp8nnmRVqPS9KhDWsrCzXHXECcPzhRYxQNahmujybZ6Gv7prY3RwJs5KiZUYdXorZBiixPzdbfuB5pAJPHnUTBQkhUqdjtCkQZTgO9LrEisbm4BQhyZ040teIqlRwP\\/xYEARP\\/wBLjKITJJ4rPVZxxvWquSi1VEvLuguoA1ttGL+pLT15+uSuKsHqaicBllKKmeDsFKRZ5u0p1iQ7+X0ScotlhWl9YXZlg64T4u9FAQFkAtpGXRDxW2lOq0lLJVSUNWamq2ZUpbKbL6paV8MaxuneF768sgpihucpzQ1OtM4mosIEAMH\\/\\/FgQBB\\/\\/AEsMpBURiko4GYlqtEpV0gi1m0NBxH1No0TbAlyeqffzm1PJhkfo3S9KlWfZUV4DQ7321Ahr3BFDidQeOhoDKNyeJxTKYxygDJ+\\/R\\/C4Ka8GSttAzLxRTJRUEoVGVrEqztKIqEwwVSXrJFPny5Gnv8mfiwKkyob8QaYAwf\\/8WBAED\\/8ASwyjDR0QMSGATfPEirXSULqUki4zIB8RJHcmAnUlXzzofw6cN9EY2MYBYbSoulVSfsMA\\/lAY4nKpSdsy5ajWPKXNOcZ1nENj6ul7jm4+mzg2SggMEUzqIJkAZgIqhdEgsj+loDNnW4mtWapS\\/f0IbqSshD\\/COJDoA7\\/8WBAEX\\/8ASwyoQhSKghgAVc71cy7uMsJUIhBUBzkAmeXAkTQ0bmdTwk5DwG4JlQGmYBUvim8pVF7K0VUigSxo6w2QX1wrxavbImucVEozGmo1\\/52cqa66eccU8OeNZ4eS00JTBeJNGh2nsBMoqkOdM0ccVmOS9ddWyUp+iFH\\/N9ZT8\\/6me+vxS5u\\/\\/FgQBA\\/\\/AEsMpxwZCkkXK7aStSSolFXBEvBCA3akOJWTjd8Bu71TMiolJk1qTDZaiUMF87IS2Kt0GK05lK3yTy0JUITq9Z0ar6bFf7wtIyJrlnwY2\\/FLXEYZ9KF71yd6CvIimrMtZMCZWZWql7rqUd0N9e5A3zOaomgUCVE4pgO\\/\\/FgQBD\\/\\/AEwMplIsYJ3zq5nFy6lF1UkXS1qCwAGxIxpketA9DqOqgTw3Tk4RlaaGSLdfAi7QM5JqOWDN0COyImqs1P1VQy8puxOTe0hWK5jY0QhXpox9demXunNCfCZrnOHc8qW\\/STQ5HBBdEVL1snLlPUO3NPMxjBPWLkZN\\/O6Ut4xWQA4\",\"file_name\":\"recording_1752562708624.aac\",\"mime_type\":\"audio\\/aac\"}}}]}', '2025-07-15 01:32:45', '2025-07-15 01:32:45'),
(19, 8, '{\"id\":8,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver949762614482025-07-15 04:34:28\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"sisu\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage949762614482025-07-15 04:34:28\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_fb6b9dc9-1e8d-4ad6-8d6b-c2134c5628d38212605551056688145.jpg\"]}}},{\"work\":\"spot\",\"case_work_id\":\"spot949762614482025-07-15 04:34:28\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762614482025-07-15 04:34:28\",\"questionnaire\":{\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-01T00:00:00.000\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident949762614482025-07-15 04:34:28\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hello\"}}}]}', '2025-07-15 03:21:57', '2025-07-15 03:21:57'),
(20, 9, '{\"id\":9,\"assign_id\":5,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581592025-07-15 06:54:32\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"qwett\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"wertt\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"erggy\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581592025-07-15 06:54:32\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"qwett\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_12466d14-80ad-47f9-b5b4-18fd48141ebe762114854684273595.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"sfhuu\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581592025-07-15 06:54:32\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"qwerr\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581592025-07-15 06:54:32\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"etyuii\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/AFAIoCje1iFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0v\\/\\/FgQBD\\/\\/ADkMqzsQWA5I3kpGQCg1gxSd4ieQtcEsCTZIFhyG98Z8T15YPTxBKsFKThxaLXyjBEsZq4jAqO+LpmjPpaw3TwC2DkYpMz\\/jH5\\/nHgzxp9\\/8fMBhAB8TeMiFLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS8\\/\\/FgQBS\\/\\/AEKMq0wVjEUVgFUFVKtV5KFCKiAsHRI4\\/KWYE5FN5\\/v5i8\\/3FIfFPwm4+ypPBVWbO4KbzXPbDijo0doDYb595MshgSOQrlp9OW48riy588zkJZUrIiS\\/6PUBJPnymlx05ZWvPxeo1UrrmsqdIMp1V34lyeW94d3qg8gwafI1hlEooxzVzWzhKs86TerYgTCaKQKj7mggIhWM2l8gBfg\\/\\/FgQBXf\\/AEmMph0Vmk8AqXUW1mpu0irSCSogAAfZyeOR7PRv3OC65ZxEWgpIkxqvPYTKwsFBoP5zpkqywKnLit8AyvJRDrfpk0gUAt4RkpBZBOcrBOqHMtaEicmGLrIrmVc+phke1njsHj9I36j9X25G6JBOr2hXjV87sTZgJ7H5unu35UngW52dPMcSsm+s3Vi3eOuBjFpnkKe7ttODYFZuA2rqpqMTPEkoMZf\\/\\/FgQBWf\\/AEgMqEMxBkgTK3VxV3VzFyplwSrCEBzmiFoyJch2HRYe6m1WjrrcmT16Vxj+Xe5Fo9ZsFl7ml0wu2d5+6V23xctV3mrpMrfiS3cwKzVTvmaO\\/TSVz3pWNTC6i5Ie0wGnsMkPMELhFHOtqHw7GDAhSMtKoFB5I89vvykSNQMQGK+9Nc0pVL35SNmVmOmo\\/GO2EiCfn8N763puiZ4ytye5gbpkxeQDv\\/xYEAV\\/\\/wBJlKpLJRJEMysqC7RV1Eq6kEISpQOASOFydgjrBTgC3NsfWlAS++QfXia8jww15dG0XAi126CuzXJlZtWq4XiuOwCRK\\/XFlWazwrGHVeEThcljDcRIriW0IgB62Qny6kVDBZAjdLIYpM1KYth5PSyXb2xkzie886QGMjSwGgc6iYwKhbnbUaqygxwk7Bj9P3F7fT1HZdRn0ePrIQmOc2q41bQUIUVuBz\\/8WBAGL\\/8ASabshD5SUohxq9Gs1mZNSgXd2rX6aqVJJSV+muNZG+Eqe8UzNTJeIFSKakMkhAYgjvnhja9G8ttc\\/76IkaNxEguTJ2sXgCAmVAFakUC6kNU\\/uFmkAvfB\\/C80jK5yCfcJOytiKAdsgWzixGHQL7jQ+9P\\/7QDpPSz1TyNUiH3DvDwTT+4\\/wfsx7aZgFlry59nuy9\\/784st08SJ6ZaD07Ghg1sABTdaRXnOrNis6rTsEDadLPCfjP9yBG97W+gcP\\/xYEASH\\/wBNvKQxYE71N+bzL1lqm9VdWy5iLiVrKWwlYAAA6HtApOBWtlrS9Lqt2HvHZithI+RKhKEMxhR0ivJWAdsKSN\\/mSAOj71oAaCOpaaDnaNgDdTPrDdQctoBXuIGg7A+c7MDUQrek+pG3WqNjRhx14W3HaiUo1l+1Z\\/TopMfjVbDyUcvH8usMGsDB\\/\\/xYEASf\\/wBNjKZCMI6BFLarlScburpai5SpVxImUAA6JheDe8O627HwatrZqoTnDVElwIy4zKjiEUY7AqlEPu7LEhBSSlxzZSg1oOLKXLZWtyG45qGYpDDO8zQOBK40OaZMyOyGDoXrTx8Ozh\\/E\\/Wq1euG6YdRVKlfPRePOn8MBuYcNQvjhjrEuaJd7x3XT5TA4P\\/xYEARn\\/wBKjKMTHQhQFD1taLtV1FzKtF4XTVXVUH9T8BwaB08lpzjF6wO4LK1G4DZ6DO5Hl98TzKRn0IgTZBX53mVCxhmgwyhzLiB5hjic5gkUhDDmI6iOUz7zH7TMEdYr6\\/sO7ngyKaNudUabT6IKZtySNYG2nQnCE52Xflo6V5VkrO1Hezha6IH\\/\\/FgQBF\\/\\/AEwMpklYzOWLvJqrCSUiSkq11UUABL64bnZUld4yVW0V2yEjmlhyO1sNKnYypzaX4HblCdxJaN+z6\\/T2n7qmbwrjz5fF4Z1JSDAzFJPGRHEQfrCRhSgzPZSgq37gWooBlKFBIhW8i0EkqXEJISm8zicmVVNOTE0TDo8oJ6JPs9FJpTAcP\\/xYEAPX\\/wBKDKZJLGLxMklJIlElSVEJVwSgBVB90wbsg6fn0+2Grw6S59yTebVGWEoCtWQTCFD356b5aX52vnpn2Hfvgphg5lGVdcwpm7w4CqxPVTJ6q2irHtiUTP0qyhSZIDDMhzSCQgI1R+SwQySJAYCaIkc1gMH\\/\\/FgQBBf\\/AEyMpiowlCkAt1U1UkXMhcqSLoul0kAAFl1qJNVyXlThL3zzynTP5alreQL5DSOiEMpfGZmQs\\/LHtv558qOBo6yZ2lPljtVcnFKJTHE7ErOYYipGE5JEJJ0kHQmITOetZW5aWBhLr0pWy2dOCbGpKiCUxinHajeKhAo4P\\/xYEAQ3\\/wBOFKRpLFqeKu7ydbvVLJl8VGsgl1AOIbNoNi1l\\/a51EWQBlnSI7gKclwmJAVSY7VUDFrbPP7QF5Y3pStFCjWEMbA3Cv8CYyFT5YXIJpXfTrByStsrWnZ9sVc1IUsR+LLJLT3XxIwn\\/0HgkXghO\\/Am8+mVke943pGafFo5K3A4\\/\\/FgQBP\\/\\/AEwm5rLIe6xNmJhIR7P5NQarmK8cRKxZPnq5M4a8Jec6Wh5kraqTKqHXNSVVJUZKSNT8n\\/DmXQZbie9QT+Fd8n4SUEAIyBAC33\\/yBftEAn+5llr0rlGHkmsNYJOYaMjFdMlFWAiUhMsVVqgd9gMDmY6C3hD31QJro8GNBDuvJGe5JbV3byMq4QXWxAeEAP9JxRlSZcggVTH\\/\\/FgQA6f\\/AE08qCokjisAiRN1cmXMuVJUIsEq5Rgc5aL8AgUwsQHmaILJNE43gNK3fiALJzAqY9G3g3uS4ACrOloesNYrezKDmDS05CpxTZFzRkhUvgpZJg3EkLCxVEnSZWJZJUZKlQEiuMGVUWBd+gGIDj\\/8WBADz\\/8ATQymQiRork0OMsXWqq0gEupUAAG2hnHI77uTUlW9LWXKNmsJqlWJGbb4DZUXa79VcsBXKJDsehMYSNyV6RneMcUNHnI2kJJyilJWkhTk5UcF77awtS8ZCv9WkBOSXOBexODOSoAXvik6Kq3d+RAdgHA\\/\\/FgQA7\\/\\/AEiMpkIYbvturvJNEq6WLiJVRdQoAwwYG95xZJPTwWuKlvVIQ8qmEWG61wIowYyx94fRgx+nCtIflycJ305p0l0aYic7LjlFdhBQJBZSNM79EC82CeBAgkY1ZQKhSMsicyAEJ0jkj33P0ay0cCgAwf\\/8WBAD3\\/8AS4ymSiSMLAC55XeS9Uvd1qpIkEJdSoAC2JSqt+lQLrt6AWSW16msrsujCLicbElxB0+sjmJgFCFY+u5kezmTOw+FnWDLlUvkmBWVyCkSHMuomMzOgvqvXOubChEo4UoFSZInmGygqZ1aUuHcoGACMppkXD\\/8WBADr\\/8AShSmShxoAXqqtVyLpKgkQkSRVgCugjRJ58ORaNv92fvj1ltQKM9Cb7Kr0nGRW1UK4tyEGBtN7RIg+KIAtzvR82v2R02M+b9pW66sCTEgCCKAQCUBCxbWAw3kWWyzLRA+yN6MCMFhZK9QXs9IU7\\/8WBAEr\\/8ASybjZlBzMe6LQeWZ9nETLuarPtqXxyde83VVLNZVXjLXqs1zOt+kqTKotUhEBD+iJ5HcM5Z2mQYlLzRrWQWsllg77QaQPtXuB6o5gCm4rna6Y80Jo1g5woklQeurVsyrLLKvOdHytP4yjfFsTF9819tmv9xVk8JkBA\\/Sk8Lig7AiV+pArQWMDAJKAEQB\\/\\/xYEAN\\/\\/wBMvKZCJGYBMq1LurURCQSEQoABWOKlJppKrr7N2maS7TcpP5Vnt3Qb\\/QgtMGeCUiu37bLe0Zx4noytFVEgd3EN6kVICE6kgL0msLqX3LoOKquIBiLISJirJKkgoAR55tqEgJ3UIqquP\\/xYEARH\\/wBLDKY6GJIvZ3zqI43qVUupERFSpdELYSWAkAAHgA5bVcZZGXachS0QM7PQh319fmz3eE3N3WomIwLb5o5ErWVVQ213hQKfmLx6krMqZLGuidhh7BRWp2v9O3NYvtvtm5PnThYsA5d8F4K0EqZuuijQfjZen5X2tNKiMpJm\\/esAwf\\/8WBADr\\/8ATYymQPVZUQtcypIJUBSCAAE+gGbJHmvsyxKcxHAiiyIWmo64cXb75pZClr5\\/yOXvvgT9yU1EhKkYyBYVBAuneyw8IsxYZ5WSkss4ZYKGC8PJv3QpUhsm9V2DUt\\/DzVMOHV4ZgXrSmOmFcjZUBz\\/8WBADv\\/8ATQymSiBomZqoXmiCECFRCQAEVyI0aXAfmXFHoudkHqOLMMnuqIZStfrsOX1cwy6Ssf1IAi9GMymzzmts3id6IxIaqArCyRbJffK3GRcCoNPkz7KYtUQncTxZqCXyYDbOkoVTDRCaMtUS413LpFQOP\\/xYEAQP\\/wBOlKZJMGC91dJesurSokSKkqoupIAAKxBmvnytwu8ErjO6WS50oC470VGuLHhQGWk\\/b8VBp7rym8X+nspbjkRj1kV4N0lhWnYx2WBcleu6C6jKSYq11KzrOem239oMFZ2Rkl6EM24tKeplXIBrX2UKKWtegUkQvCoHP\\/xYEAVv\\/wBLJuxmSHmyyHuvRLRMLV0Rqay7\\/q6pJrHKvE6qorij+377aZQudoFSZqQicm1j4UGlOmEiU3JT7m3yvbrolIWRE6CNUrlqtYHcHGJiAGCwv3fL2dGyKcSCwWhb5VvqdKJ2pMEoErXA3XnjAhkoFRt\\/EsJbNz6pXatWBxL9M+GwiEvK+\\/6pxhKrVKCFZBDMaUbNAyyLYwd1TEtI9VcrqUVWqn6LSXO\\/\\/FgQA8\\/\\/AE28pDkkat4l1Gt8CtVKSpSriSZBbBlgAE8IiJrceQt7n79eLSquHxXVoKQdYzpq+tjtljaJmNxZC9HOM4XrTNMhaivIu\\/DKtK0bZtnfM5aDH2itCxfkjKF4KhcDDvOtqGsvWkoC7zHxrOEkx2TJAyxB\\/\\/xYEAPf\\/wBMjKRJNF7lltY1WsaIElZaSShA\\/aerLjn+b9d0BugnWxCilR+rQxxV\\/+347Kg1Ghld7tB+Q6klbtbfIKT4ZO0AyJVzOZS9723crShrq6VMBD9VHGkcLsw0ktwEwDBReSkkm8u8XigyoDLCGAgLJZ1ruoBwP\\/xYEAPv\\/wBNDKITIJYwZmaippJUQaqVFSVIlAD9k+8VPdEkqSxKq1rJOWCpwveKiB3Ogt95XdpSUUln+ATj7GULVAFFblsxgZzq7LyoRwiWyOyPtiip7iFvPGq0qReCE66h5xbYBesrEHSdiJonKsA1T1SCLXOKWyItEDg\\/\\/FgQBOf\\/AEwMpUEcwkgUIQQu9ytVWtJSksiVBKWVC2FNZ4IA4i+jXRXvZ4cc7lXLeEZpzVxlWqHH1DXWKYkIrKaS+9v5\\/fcaZKzVJozDO+Ggha5ZlrVKksliF7o12\\/ZLdgYZLUlkaZW+qM2j+igjDTtKJ2nwBTiJUmFuFgOB3QnAAgPlsnjxtCHtgP\\/Z5SIe7iduN547f6Sp6gc\\/\\/FgQA\\/f\\/AE6MpjqMkC4iCFSrqStZ1ilRC81bcqUJgAA3cx3W5PlnrvmA8aYlVAhnkudJcVD+Lb6JnkXX6zqShvDbCgGZVMgSBIldShAXXAJSTFT5LWvaUUOncCXKLuFmyhIpS\\/T79Z2o142sYDoE4iQc3XEDGyOkP5aFiAH\\/\\/FgQA+\\/\\/AE4MpJC4hCN2sidbkVESC1SUougft+SsbFaEfLPEvgWOPa9Lvt73a71jcb2HMMETmSWJU6mp5obGlkIsqVJctatMpjovxTbAUraBFHuUFjzUvAMg8UAwYF8rrt6hTk6qxkGGa3RMg0V7xpKDBky85jETQgoAwf\\/8WBADv\\/8AThSmShxoAUqoWi5QhCIvK1gsABbjY+e+fy3ct3q0zrzwryvFdk1tMtkX20gQkigEpgAgZGNW04z8K+FQx6s+aDd779N1ows1aAksI0VKKlm0ZFQe5gJGWAsCC\\/mxxrVqrWMut8E6QKQkTkgDXUObv\\/xYEASX\\/wBNJuZmPcIqOZPwMZj2vjWLzzje\\/nV3TSqqZiFJdHv7Xxc2LsRUjqqBQICKU\\/19XyleoYCg6In+dfXLf2FrlEoAJRBc2gQpcAlmLqKml3a6rjLL0VRgSu7lnqFtX7hgLfB4gjhckJgNOA24hly0HieP4nTkSHp\\/INXPKBjwQAMwAPCjElx3iXIxFAc\\/\\/FgQA9f\\/AE28pkogaFVCSJKQQES6AoAB3yhcvfJTd2W53+SRppRe22yaoZcIN5hzdorCCEDxe3xZlXL8MpqfLEhgq6qfkbY9NUaQw44xtlhPJDL3WYYJzpdawrM7SIlYiBQVJQkR7JlMgVoypWouayCtNMbisAWAwf\\/8WBAEH\\/8ATQymIiiOMFbq5V1xVipELEC6lAADMWselL6KZOFonfEPlV\\/v3KjivVSPjck+WRKqOu3Nuj8KjwGz3E8df4nATcpCi6eySmZGKl3RXMxsav5RMiFJDLC9aUXz+BC\\/uSTkr2EIXnNvwVSxlpcKxXJXY5yQnwN8IJEpuwDB\\/\\/xYEAP\\/\\/wBNDKZJPFqd1claixKkiSoRECgAHRIZlQ8Z7ylBULsmeJikscW0A6zhjBs2R\\/fwT6OeHDoQtPnBWZE1B1+sYVyl4mS4s6pY8UiQdzDBM627yi07ao92sgrISthJ67KCIxPYQ9ejXybqarYhWiPFG8TYvFCHcAnABz\\/8WBAD3\\/8ATIymSiCMLQCjbWS5VyhIJEq1cYAABxuPGTU0F3Te06PoJTRRXXg\\/st3TPLXYqdvwR2sMRg8F0sdj0S3Dzfuq4de3xlVRqEzubv9ZiX6iiI6EEVQrQtUWi4oVOI2XJrJSV0KBe4E5CUWFSkQq5iAvEWgoo7\\/8WBAEH\\/8ATIymQihm3Ny2cayXuXVwkJBEEAAM05C2N1PPPXF1+w42YUCclR8LhH0DRsuEVuc3FHoI19r0h9niR3O\\/RoMX58aWs5SledaRutZMn0pPJCFJx7E6QktCVpzcInrTunePshHXqJwjUrWt6Lqsl4oyCKaiVxIflNpICIDB\\/\\/xYEAQP\\/wBLFKZCKGbvaXMvVWqLStZLSpAhBCRFADHgZPjnRLTxYMGFXaKZCzgZ2Zd92PefWF+bzSuIY7BCDH1Xy7kD5aczCiXS6eTll1v55\\/wq7YrI75QiUhK1lILzrJgqaqJJI3pnnQlsmoSXjjVCdjgTr4guxXF0flLKgJgB\\/\\/xYEAVX\\/wBJJuyEjHmGPdse70YSQuS4uftaV1zxvV7rwq2n0+TO+Jo3cqP0QVNzVIpEPwESukcoq8UoBvlqsMDiwfdYglBnAIz4gVQJKEQQFwnJw3V3YS7IdGsrUFPLjAt7fXGuiMxkomE4gzAre\\/7ANWcAiOf+T1Q4eDwxiqJZ9kCkBTl\\/c9N4u+6U9Y\\/IcWTCvfOCoxJP9\\/38OrbRvzTxRgBAgxMmEHA\\/\\/FgQBEf\\/AE6mtoqQYzHtmSHgCfYNko4b3+OZWr14u+c40ynDcTvzw\\/PFrwzTUhkASbDRqWWSWWekkfUoFEuUxLjJX3lhhK5EuR0OAevQ8vmw\\/eCyEAnaaCI01VBBzAqKBIrqtleW45u54iYZReXu\\/lc0brj1EAkToBBFETQLF+\\/+xx685FkXP\\/xYEAP\\/\\/wBMPKRJSFTe0qVfFXUqrEkqqklwUoPfuB393lCP9Y+LwaWMhF\\/yNX3\\/WU9\\/VLhbys0mSQhta+rDw1YxMWvKY\\/9zpgBrFPJXquBHC+g5kI+OboxNHrSn+JNgQXCqSKgdAbrFy52QRgSgQOqFsVdyFhfns5dJyQ40A7\\/8WBADv\\/8ASoymQihkAXdVELrSkqSoQS0lJsABPpropK6\\/7606VY0kWVz+fKXdEmeRQ7WtDT8YoNCZIQOo7MwlLNWbv53cVUP4i05mqBVPne\\/aKuK85y6zl76fxWqe+EqpXSbAUmmFQIwuXiESEQBEpUtZLAWcP\\/xYEAR3\\/wBJjKRZSFD7ctVlzzlolXqpWqqtSRKiqDjJJfjVQ5oBER15R8On1tWkXSFQd\\/rKdzOrB+vHL\\/Smp6UgdyxilhS5MFQcHDKV9WNQmWBA4uBK4fHo\\/Fyk0flbYjVnCo7TRQnWNe+U06rPD48GcVrPqOflcvlUk8WdKtI8ulVoTwbYV6ywp3TJAf\\/8WBAED\\/8ASwymSihiAW6y4q4sJV1ElEllSYAAHRruW+ih\\/QWm3ly7S6ynLpZD6p8Qs1Xnvx4Xu\\/OdvwauW1gD14wafw+F1QmbCJdQMgn6drTwT38damRCc5EuMM\\/smrr5PcQrKHO6MACdKCMYyKcQoTFHMSZIIySsvKzGEpFry7\\/8WBAEX\\/8ATBSnGxkITBYza6vLtJV3klSQiSkSoBhutjo\\/InU0HxxuvVzCk7bBmWQJVkWRN2m1QN8aVdTD30vf+a7pn3dPNKrwgZF40yoWhw4k0+ZimUKQmj2XodT5uyIcvDmW+icGK8EFzf3tUHO12ueStbrqpVnWNxEmsJ\\/leSys+kJxVVluAMH\\/\\/FgQBR\\/\\/AEum5mo8sx7ZJRbISnA5XtrcXbVX798GNS9+Pj7X5rkqI8OuqzPL589sRUmQNrVkPhHB5RmJjW43SwUIldHrW\\/UkCWWIFE6TuAGtQBIVWDjOcbY9E1ZojSgEEsbd01yLPT3vYgyFJoNYHsToBFG2RsGsI5fxAQjGd7ATkgmyC91NtW45IpqVb7WAwBAQPsPcdOHnFKYEzFHf4NVR\\/\\/xYEAQH\\/wBRPKYiHGqDESpIlX1vVYIESuKMKSgAJN7SUKk5S+Fsy6Yn6iDjf+X\\/YxKAB2OaezfCvbFx0dX93inVayPAulfeoVhcKlLQgtMVAvUAJykEmS9HGJTyd2sAesTsKLRTtALeKWwYkZUKmXqtxQpqr0ig7\\/wZSj5SYwO\\/\\/FgQBA\\/\\/AE+MpkkgYIEhCELiNbkyStVUupRaMqFAAfb2qC3xz33bo7x1KQgpoMUuzKquqe3JV5th3GozGzRXQscuOsgtbGcLQRK0mTldeEUGMZQlOALgiMoD7UI9X6Yuz6fvvhgUicQ4vVsE2+Dp92s6FHT0HS6RrRURjBqqVA4\\/\\/FgQBEf\\/AE+MpFk4SkQRq26y6nFXfN3l3TRV2lMxFh4nm2EO52BPdQi4CgAthpPmLQTeQGWIDSifNi3b+QkRkQWt+5tESHBEpaUvj1ckWeA7POYGCtGDizjZFDHHHusDBkQlOgErQIB+e2aSElAFU+ElhASevFP2MquH6Jc2XWxMTVLHaiIHP\\/xYEAQ\\/\\/wBNjKQhVE5EELfNasvVXMS10vVCyqouC08hJIqwv7jnqnltg\\/1sZYtq1lwADiE\\/g1D0Bsv7MKFIbMG2CkJcnQtQrUeNZlMfqSrs5k3ame8tz9o0tFMtkb1i+KvooSKRwJuSqFJZNDylnV\\/0YvsQBzJTowpnwHbwDZ6JUlnYYfYB\\/\\/xYEAPv\\/wBNjKZKMGBlWiWikkI1UQhRYATjelLX0XFzkznio6EQaMFRa51I1yi4D3kjOYkaoUvLR1QRUDLBFeGdmWy22JeOCCV7MLfF4YDF5rp0tZLRW+LUCthMFI5v3Mcl6tQpNSi2VdinCDH3tXarG3M726gsJrEsAA4\\/\\/FgQA8f\\/AEyMpkowXgFK3cEllSrELgvIpAAPnVTnGQt6\\/LL\\/KV+NVnHq4WeN2YDJfKNV7dmxL3V82SqCiWDyitWjwCBAp\\/UGi6p5UMTNkBPDB1KRM8IoB3RQrArJaNy9lCaClBESSIolFoJykhGR3AEY1myEoBw\\/\\/FgQBA\\/\\/AE2MpkI4XlVJUvVSVUsiQiVqhFgASwjC3PYo+WYjxurvkV3NdNtZVFshM7EJQkzic0fPz+za6THe+4DsZJr1uJcFpGSVOxR+2bMaKEvC0E\\/NJDiM0mSCTSoRIaYBKWRW9Fqk49g6k7C2ZQwMa8KFpcKyXskmoC0UwMH\\/\\/FgQBF\\/\\/AEuMpEFcTPHK643xGqlXJSS10tAIH95YvUUxn7cGWbFDWz6msY0o+mqQ23jU9y6mleWHwUfdbWw0IDfBNPGkGXKtFXvzGcWcHTjUfaLvsLQgQRHygizndbCTgMsmQs58am8d+wrnXuh2TX7MexL24d2KPfHLq2aq4UYs2VhnAeTLacwOP\\/xYEAPX\\/wBMDKUUHQxHFwBTeS5UiIIQXEzVawgHt7GbmEpWlkHPNbCcckEGDVahK7oUCAEGJQ8g13SP39RoXf7PWpef2oVhN20ribI5K5IeZVVA26dVrzJVTuldI4CJGcl6KDAoJIUVVci3JQL0OIjOgM4LyIpgQKu\\/\\/FgQBCf\\/AEwMpkockixlblo1Vyq0IkXUJEVKAAzsFk0PbEYfSrtWhZnQ6MBsHEp0aeiLzeTK\\/tEhoSG6iLByBaLlOgh0yUcz6zK4p7I3s7jGdrCrp0qUKAm+C+eS9+Ix0VnbCX63lF3thnUiS1h+5VBFYHXDdKkbE6riuAgjW5QIJAH\\/\\/FgQBC\\/\\/AE0MpkowYJvLRNVaVF1EkiIqLyAALaFtEcHe7Dch7LKY2aKTeyTRIj8JnvD62qXHSLkOLL7JOI7Isf3jLlgWBD1KkT+9kgrXLDJ5OPjSHeE\\/TPvSqHKFIWtTDFfnE15paURGl0aApQjKSd12RduZo2RI0UnufQFJl0qqAcAB\\/\\/xYEASn\\/wBODKSBUEJvOsVrWaris1FXdazQEupQf2owbrZfzfMa1+uBESfa1yDOARkaCq0lWXxsZwEfhmThk3a1ZkheBgc0y311Nioy1GNWtFKhsCKwcKYrXg6tZUJV7G8N57K7jbd96fBLTI70UimA+MYVfVgjXCE2sqWEDVj4OGmSIukJZ4T0xG2qBLhHne0QOD\\/8WBAEB\\/8ASgymUixeAXeVqi4kCKkREpLyIAZl+vMuvv+o3\\/r2aVu+2y6iiVJdb+HTdQkWzIlhkv26+QgPc0\\/By1l7pyO29xiOQibYYtwJZ5Z2lKz3sXiKsdvhay61oSZ+fWxEJQSI4wyUkKIRRkyrBJzMVteoHEslpOgiT63B\\/\\/xYEAPv\\/wBLDKhKKOIBVlS1RIq6BCzSqiTA5wKotSStPJysx\\/yKjLi9qWitmYXFLoR6gpcCEHEfJX9ot70t4Ky2Hxu06r+m7h80CKg7AkOxd71XOfrw8JJKM4cMqiUYLCK9ZGsWAK2rdMgrqF1Qok0pYgTKKtsEjWCFEAO\\/\\/FgQBAf\\/AEwMqEsZCjAApiREQqCrLy6utEqA5S8DxrNXy0jIZfWiS4+tusgjbqTNAhdEykoiRF9MkKHoWuCnC8BYBMHncdN4PRmkzFwXuYZMu1l7LbfEypHVHTWK9cKyyAkWcJAkgra5kTMhCQqkU7iis16A1RQDsXQJ0WCIcD\\/8WBAEf\\/8ATYykSTDCRxQnO5LleaWiuMupolWQl0D8uppjwNob\\/fpElF0bs4ODEPuJp4nHnEpSi3yP89yck2X5Vq4mfTxg8WzU76YfLZ7EEp9JVqnPNVL9A6kvNvBjCOfmBB1JSIVo10+888UZauEYJFZMVn6c6tzh71NLp9v+wtz7SRKdoHpb797PFKABw==\",\"file_name\":\"recording_1752569851222.aac\",\"mime_type\":\"audio\\/aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"sdfhhh\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-25T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"wer\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581592025-07-15 06:54:32\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"qweee\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_36100fa6-df8d-4788-bc4c-95a35ed754493967968585142980970.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-15 03:28:23', '2025-07-15 03:28:23'),
(21, 5, '{\"id\":5,\"assign_id\":7,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver751089581552025-07-14 10:15:40\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sameer\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"0987654321\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage751089581552025-07-14 10:15:40\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_d2e80df6-56c8-4e93-8563-8f1dcc4dc7b11069445900572198070.jpg\"]},\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"suuu\"},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot751089581552025-07-14 10:15:40\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"123456677\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting751089581552025-07-14 10:15:40\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"hello\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752490842979.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"hello\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-26T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"how\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident751089581552025-07-14 10:15:40\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"hihihiii\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_be04b2a0-b5e6-4b6e-aac2-1b582a4260054497351122190860126.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-15 04:19:12', '2025-07-15 04:19:12'),
(22, 12, '{\"id\":12,\"assign_id\":8,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver9048007933122025-07-15 10:14:52\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"hello\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage9048007933122025-07-15 10:14:52\",\"questionnaire\":[]},{\"work\":\"spot\",\"case_work_id\":\"spot9048007933122025-07-15 10:14:52\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9048007933122025-07-15 10:14:52\",\"questionnaire\":{\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"}}}]}', '2025-07-15 04:55:58', '2025-07-15 04:55:58'),
(23, 11, '{\"id\":11,\"assign_id\":7,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver9876543321112025-07-15 09:47:20\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"setyy\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage9876543321112025-07-15 09:47:20\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/cache\\/scaled_9a083c00-1c1a-40e7-ad6f-ef1aecd6b7de5621400229169496683.jpg\"]}}},{\"work\":\"spot\",\"case_work_id\":\"spot9876543321112025-07-15 09:47:20\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9876543321112025-07-15 09:47:20\",\"questionnaire\":{\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"\\/data\\/user\\/0\\/com.example.flutter_insurance\\/app_flutter\\/recording_1752576625036.aac\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-19T00:00:00.000\"}}}]}', '2025-07-15 05:20:30', '2025-07-15 05:20:30'),
(24, 13, '{\"id\":13,\"assign_id\":9,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver1236544879132025-07-15 11:10:47\",\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"wht\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage1236544879132025-07-15 11:10:47\",\"questionnaire\":{\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/xnJkhu9qhP8MUMXBsxqWeJTD6VLvrqRtkZNuTYj1.jpg\"]}}},{\"work\":\"spot\",\"case_work_id\":\"spot1236544879132025-07-15 11:10:47\",\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting1236544879132025-07-15 11:10:47\",\"questionnaire\":{\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/VunMdvl5U2t4Kfb5Z7bqt8p0salHJ9QharvFc3ll.aac\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-16T00:00:00.000\"}}}]}', '2025-07-15 06:50:58', '2025-07-15 06:50:58'),
(25, 15, '{\"id\":15,\"assign_id\":11,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"sheela\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"thomsan\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"hello\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"Madhav\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"okdaa\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing spcl\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-15 07:01:28', '2025-07-15 07:01:28'),
(26, 16, '{\"id\":16,\"assign_id\":12,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815162025-07-16 03:42:08\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"test name\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":0},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"no offence\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815162025-07-16 03:42:08\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"garage\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/vqglpZ0MOGalLsDGQl6FJVN4q3ax32AalJw9iso9.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"12345\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815162025-07-16 03:42:08\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"ramanattukara, kozhikode\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":0},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":1}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815162025-07-16 03:42:08\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"person who see the accident\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/GOkkD7lxO7fwXeQoxZPKtMhJBfoXqptyJaLS6YEb.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"about the accident\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-10T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"about the insurance\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815162025-07-16 03:42:08\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"small scratch in the bumber\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/4YeCOB8p9CvwNcuTScu0SToLP4HldEKTDZLmHsb3.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/G5OlKjT3Zx6bNLK3bSEqLs7GoqYHzoXoSkqkib7e.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":1}}}]}', '2025-07-15 22:31:39', '2025-07-15 22:31:39'),
(27, 17, '{\"id\":17,\"assign_id\":13,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raju\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"Yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-15 23:12:28', '2025-07-15 23:12:28');
INSERT INTO `questionnaire_submissions` (`id`, `case_id`, `full_data`, `created_at`, `updated_at`) VALUES
(28, 18, '{\"id\":18,\"assign_id\":14,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raju\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"Yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 00:30:16', '2025-07-16 00:30:16'),
(29, 18, '{\"id\":18,\"assign_id\":14,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raju\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"Yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 00:44:17', '2025-07-16 00:44:17'),
(30, 19, '{\"id\":19,\"assign_id\":15,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raju\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"Yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 00:44:45', '2025-07-16 00:44:45'),
(31, 19, '{\"id\":19,\"assign_id\":15,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raju\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"Yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 00:48:52', '2025-07-16 00:48:52'),
(32, 19, '{\"id\":19,\"assign_id\":15,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raju\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"1234567890\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"Yes\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 00:53:41', '2025-07-16 00:53:41'),
(33, 20, '{\"id\":20,\"assign_id\":16,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raja\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"9961242775\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"No\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas Das\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 00:57:09', '2025-07-16 00:57:09'),
(34, 20, '{\"id\":20,\"assign_id\":16,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Raja\"},\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"9961242775\"},\"was_the_driver_under_influence\":{\"name\":\"was_the_driver_under_influence\",\"data\":1},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1},\"list_any_previous_driving_offenses\":{\"name\":\"list_any_previous_driving_offenses\",\"data\":\"No\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Anas Das\"},\"upload_a_photo_of_the_garage_sign_or_front_view\":{\"name\":\"upload_a_photo_of_the_garage_sign_or_front_view\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/Kg28hsVEMzP0vktLEYyIO79L20izorp96IBUMUae.jpg\",\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/v8261aMhEodm2NXHPahDh43pjchLNZvWrqmc8Led.jpg\"]},\"what_is_the_garages_registration_number\":{\"name\":\"what_is_the_garages_registration_number\",\"data\":\"QWR544\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"nothing happened\"},\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":1},\"was_there_any_police_presence_at_the_location\":{\"name\":\"was_there_any_police_presence_at_the_location\",\"data\":0}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"who_did_you_meet_regarding_the_accident_name_role\":{\"name\":\"who_did_you_meet_regarding_the_accident_name_role\",\"data\":\"mISHAL\"},\"record_a_summary_of_the_meeting_conversation\":{\"name\":\"record_a_summary_of_the_meeting_conversation\",\"data\":\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/I3iByjL6f5YVN8mc30zjlD7hn1CBxyl71UUGBybg.aac\"},\"what_was_discussed_in_the_meeting\":{\"name\":\"what_was_discussed_in_the_meeting\",\"data\":\"Approved\"},\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-07-18T00:00:00.000\"},\"was_any_agreement_or_document_signed\":{\"name\":\"was_any_agreement_or_document_signed\",\"data\":1},\"next_steps_discussed_in_the_meeting\":{\"name\":\"next_steps_discussed_in_the_meeting\",\"data\":\"nothing occuures\"}}},{\"work\":\"accident\",\"case_work_id\":\"accident7510895815152025-07-15 12:27:22\",\"questionnaire\":{\"describe_what_happened_in_the_accident\":{\"name\":\"describe_what_happened_in_the_accident\",\"data\":\"last upload\"},\"upload_photos_of_the_vehicle_damage\":{\"name\":\"upload_photos_of_the_vehicle_damage\",\"data\":[\"https:\\/\\/insurance.niveosys.org\\/storage\\/uploads\\/uU29uMZ9JHhWVaVWzuKbsLRdOAwpUqSB3HYvIWJr.jpg\"]},\"was_anyone_injured_in_the_accident\":{\"name\":\"was_anyone_injured_in_the_accident\",\"data\":0}}}]}', '2025-07-16 01:01:10', '2025-07-16 01:01:10'),
(35, 23, '{\"id\":23,\"assign_id\":19,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver9656521221232025-07-24 04:11:52\",\"executive_id\":4,\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"9961242776\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage9656521221232025-07-24 04:11:52\",\"executive_id\":4,\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Garage786\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot9656521221232025-07-24 04:11:52\",\"executive_id\":4,\"questionnaire\":{\"were_any_traffic_signals_nearby\":{\"name\":\"were_any_traffic_signals_nearby\",\"data\":\"1\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9656521221232025-07-24 04:11:52\",\"executive_id\":4,\"questionnaire\":{\"date_of_the_meeting\":{\"name\":\"date_of_the_meeting\",\"data\":\"2025-01-12\"}}}]}', '2025-07-23 23:03:41', '2025-07-23 23:03:41'),
(36, 52, '{\"id\":52,\"assign_id\":48,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver9497626234522025-08-05 09:16:31\",\"executive_id\":8,\"questionnaire\":{\"full_name_of_the_driver_at_the_time_of_the_accident\":{\"name\":\"full_name_of_the_driver_at_the_time_of_the_accident\",\"data\":\"Asad\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage9497626234522025-08-05 09:16:31\",\"executive_id\":8,\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Garage333\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot9497626234522025-08-05 09:16:31\",\"executive_id\":8,\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"102.45,115.76\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9497626234522025-08-05 09:16:31\",\"executive_id\":8,\"questionnaire\":{\"owner_ration_card\":{\"name\":\"owner_ration_card\",\"data\":\"uploads\\/zhjn6hCrav3vQOY6LitVLVh9f4B358SifFpX4Vum.png\"}}}]}', '2025-08-05 03:56:47', '2025-08-05 03:56:47'),
(37, 53, '{\"id\":53,\"assign_id\":49,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"driver_appointment_date\":{\"name\":\"driver_appointment_date\",\"data\":\"2024-04-05\"}}},{\"work\":\"garage\",\"case_work_id\":\"garage9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"what_is_garage_pass_number\":{\"name\":\"what_is_garage_pass_number\",\"data\":\"Garage333\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"what_is_spot_locations\":{\"name\":\"what_is_spot_locations\",\"data\":\"Kasargod\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"owner_driving_license\":{\"name\":\"owner_driving_license\",\"data\":\"uploads\\/zhjn6hCrav3vQOY6LitVLVh9f4B358SifFpX4Vum.png\"}}}]}', '2025-08-05 04:21:49', '2025-08-05 04:21:49'),
(38, 53, '{\"id\":53,\"assign_id\":49,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver949762632022025-08-06 07:31:04\",\"executive_id\":11,\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"9656523475\"},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1}}},{\"work\":\"garage\",\"case_work_id\":\"garage949762632022025-08-06 07:31:04\",\"executive_id\":11,\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Garage432\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"what_is_spot_locations\":{\"name\":\"what_is_spot_locations\",\"data\":\"Kasargod\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"owner_driving_license\":{\"name\":\"owner_driving_license\",\"data\":\"uploads\\/zhjn6hCrav3vQOY6LitVLVh9f4B358SifFpX4Vum.png\"}}}]}', '2025-08-07 06:29:19', '2025-08-07 06:29:19'),
(39, 2, '{\"id\":2,\"assign_id\":2,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"driver\",\"case_work_id\":\"driver949762632022025-08-06 07:31:04\",\"executive_id\":11,\"questionnaire\":{\"what_is_the_drivers_contact_number\":{\"name\":\"what_is_the_drivers_contact_number\",\"data\":\"9656523475\"},\"did_the_driver_receive_any_injuries\":{\"name\":\"did_the_driver_receive_any_injuries\",\"data\":1}}},{\"work\":\"garage\",\"case_work_id\":\"garage949762632022025-08-06 07:31:04\",\"executive_id\":11,\"questionnaire\":{\"what_is_the_name_of_the_garage\":{\"name\":\"what_is_the_name_of_the_garage\",\"data\":\"Garage432\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"what_is_spot_locations\":{\"name\":\"what_is_spot_locations\",\"data\":\"Kasargod\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting9961245512532025-08-05 09:47:04\",\"executive_id\":8,\"questionnaire\":{\"owner_driving_license\":{\"name\":\"owner_driving_license\",\"data\":\"uploads\\/zhjn6hCrav3vQOY6LitVLVh9f4B358SifFpX4Vum.png\"}}}]}', '2025-08-07 06:30:00', '2025-08-07 06:30:00'),
(40, 3, '{\"id\":3,\"assign_id\":3,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_garage_id\":{\"name\":\"what_is_garage_id\",\"data\":\"Garage345\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_owner_license_number\":{\"name\":\"what_is_owner_license_number\",\"data\":\"ALX123456\"}}}]}', '2025-08-07 22:25:57', '2025-08-07 22:25:57'),
(41, 4, '{\"id\":4,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_garage_id\":{\"name\":\"what_is_garage_id\",\"data\":\"1111\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_owner_license_number\":{\"name\":\"what_is_owner_license_number\",\"data\":\"786\"}}}]}', '2025-08-07 23:18:06', '2025-08-07 23:18:06'),
(42, 4, '{\"id\":4,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_garage_id\":{\"name\":\"what_is_garage_id\",\"data\":\"1111\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_owner_license_number\":{\"name\":\"what_is_owner_license_number\",\"data\":\"786\"}}}]}', '2025-08-07 23:41:20', '2025-08-07 23:41:20'),
(43, 4, '{\"id\":4,\"assign_id\":4,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_garage_id\":{\"name\":\"what_is_garage_id\",\"data\":\"1111\"}}},{\"work\":\"spot\",\"case_work_id\":\"garage949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"enter_the_address_or_coordinates_of_the_accident_spot\":{\"name\":\"enter_the_address_or_coordinates_of_the_accident_spot\",\"data\":\"spot44\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762614432025-08-08 03:49:22\",\"executive_id\":11,\"questionnaire\":{\"what_is_owner_license_number\":{\"name\":\"what_is_owner_license_number\",\"data\":\"786\"}}}]}', '2025-08-07 23:45:23', '2025-08-07 23:45:23'),
(44, 5, '{\"id\":5,\"assign_id\":5,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage949762680052025-08-08 05:19:50\",\"executive_id\":11,\"questionnaire\":{\"garage_10\":{\"name\":\"garage_10\",\"data\":\"Garage 655\"}}},{\"work\":\"driver\",\"case_work_id\":\"driver949762680052025-08-08 05:19:50\",\"executive_id\":11,\"questionnaire\":{\"driver_10\":{\"name\":\"driver_10\",\"data\":\"2025-08-04\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot949762680052025-08-08 05:19:50\",\"executive_id\":11,\"questionnaire\":{\"spot_10\":{\"name\":\"spot_10\",\"data\":\"spot44\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762680052025-08-08 05:19:50\",\"executive_id\":11,\"questionnaire\":{\"owner_10\":{\"name\":\"owner_10\",\"data\":\"786\"}}}]}', '2025-08-07 23:53:45', '2025-08-07 23:53:45'),
(45, 6, '{\"id\":6,\"assign_id\":6,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage987654678062025-08-08 05:47:09\",\"executive_id\":11,\"questionnaire\":{\"garage_10\":{\"name\":\"garage_10\",\"data\":\"Garage New\"}}},{\"work\":\"driver\",\"case_work_id\":\"driver987654678062025-08-08 05:47:09\",\"executive_id\":11,\"questionnaire\":{\"driver_10\":{\"name\":\"driver_10\",\"data\":\"2025-08-08\"}}},{\"work\":\"spot\",\"case_work_id\":\"spot949762680052025-08-08 05:19:50\",\"executive_id\":11,\"questionnaire\":{\"spot_10\":{\"name\":\"spot_10\",\"data\":\"spot44\"}}},{\"work\":\"meeting\",\"case_work_id\":\"meeting949762680052025-08-08 05:19:50\",\"executive_id\":11,\"questionnaire\":{\"owner_10\":{\"name\":\"owner_10\",\"data\":\"786\"}}}]}', '2025-08-08 00:20:38', '2025-08-08 00:20:38'),
(46, 6, '{\"id\":6,\"assign_id\":6,\"works\":[{\"work\":\"profile\",\"case_work_id\":null,\"questionnaire\":[]},{\"work\":\"garage\",\"case_work_id\":\"garage987654678062025-08-08 05:47:09\",\"executive_id\":11,\"questionnaire\":{\"garage_10\":{\"name\":\"garage_10\",\"data\":\"Garage New\"}}},{\"work\":\"driver\",\"case_work_id\":\"driver987654678062025-08-08 05:47:09\",\"executive_id\":11,\"questionnaire\":{\"driver_10\":{\"name\":\"driver_10\",\"data\":\"2025-08-08\"}}}]}', '2025-08-08 00:24:07', '2025-08-08 00:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `input_type` varchar(255) NOT NULL,
  `data_category` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `unique_key` varchar(500) DEFAULT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `input_type`, `data_category`, `column_name`, `unique_key`, `file_type`, `created_at`, `updated_at`) VALUES
(1, 'What is the name of the garage?', 'text', 'garage_data', 'what_is_the_name_of_the_garage', '#Z1TFK56', NULL, '2025-07-14 04:20:07', '2025-07-14 04:20:07'),
(2, 'Upload a photo of the garage sign or front view', 'file', 'garage_data', 'upload_a_photo_of_the_garage_sign_or_front_view', '#W51CC53', 'image', '2025-07-14 04:20:23', '2025-07-14 04:20:23'),
(3, 'What is the garage\'s registration number?', 'text', 'garage_data', 'what_is_the_garages_registration_number', '#PWVUC36', NULL, '2025-07-14 04:20:41', '2025-07-14 04:20:41'),
(4, 'Full name of the driver at the time of the accident?', 'text', 'driver_data', 'full_name_of_the_driver_at_the_time_of_the_accident', '#VF9PX29', NULL, '2025-07-14 04:21:02', '2025-07-14 04:21:02'),
(5, 'What is the driver\'s contact number?', 'text', 'driver_data', 'what_is_the_drivers_contact_number', '#VHPBC88', NULL, '2025-07-14 04:21:19', '2025-07-14 04:21:19'),
(6, 'Was the driver under influence?', 'select', 'driver_data', 'was_the_driver_under_influence', '#JEHGC60', NULL, '2025-07-14 04:22:01', '2025-07-14 04:22:01'),
(7, 'Did the driver receive any injuries?', 'select', 'driver_data', 'did_the_driver_receive_any_injuries', '#X1AYM80', NULL, '2025-07-14 04:22:15', '2025-07-14 04:22:15'),
(8, 'List any previous driving offenses', 'text', 'driver_data', 'list_any_previous_driving_offenses', '#OIQQS34', NULL, '2025-07-14 04:22:27', '2025-07-14 04:22:27'),
(9, 'Enter the address or coordinates of the accident spot.', 'text', 'spot_data', 'enter_the_address_or_coordinates_of_the_accident_spot', '#W3MNC28', NULL, '2025-07-14 04:22:46', '2025-07-14 04:22:46'),
(10, 'Were any traffic signals nearby?', 'select', 'spot_data', 'were_any_traffic_signals_nearby', '#CABAG37', NULL, '2025-07-14 04:23:29', '2025-07-14 04:23:29'),
(11, 'Was there any police presence at the location?', 'select', 'spot_data', 'was_there_any_police_presence_at_the_location', '#Z4G3045', NULL, '2025-07-14 04:24:17', '2025-07-14 04:24:17'),
(12, 'Who did you meet regarding the accident (name & role)?', 'text', 'owner_data', 'who_did_you_meet_regarding_the_accident_name_role', '#ACR6T82', NULL, '2025-07-14 04:24:51', '2025-07-14 04:24:51'),
(14, 'What was discussed in the meeting?', 'text', 'owner_data', 'what_was_discussed_in_the_meeting', '#1YFG798', NULL, '2025-07-14 04:25:19', '2025-07-14 04:25:19'),
(15, 'Date of the meeting?', 'date', 'owner_data', 'date_of_the_meeting', '#J5S3K32', NULL, '2025-07-14 04:25:51', '2025-07-14 04:25:51'),
(16, 'Was any agreement or document signed?', 'select', 'owner_data', 'was_any_agreement_or_document_signed', '#RJHTY73', NULL, '2025-07-14 04:26:36', '2025-07-14 04:26:36'),
(17, 'Next steps discussed in the meeting?', 'text', 'owner_data', 'next_steps_discussed_in_the_meeting', '#06ZFM79', NULL, '2025-07-14 04:26:52', '2025-07-14 04:26:52'),
(18, 'Describe what happened in the accident', 'date', 'driver_data', 'describe_what_happened_in_the_accident', '#7LJFW41', NULL, '2025-07-14 04:27:09', '2025-08-04 23:48:43'),
(19, 'Upload photos of the vehicle damage.', 'file', 'accident_person_data', 'upload_photos_of_the_vehicle_damage', '#FNSPL22', 'image', '2025-07-14 04:27:26', '2025-07-14 04:27:26'),
(20, 'Was anyone injured in the accident?', 'select', 'accident_person_data', 'was_anyone_injured_in_the_accident', '#WYU9469', NULL, '2025-07-14 04:27:42', '2025-07-14 04:27:42'),
(21, 'owner ration card', 'file', 'owner_data', 'owner_ration_card', '#XVCI533', 'image', '2025-07-24 00:32:04', '2025-07-24 00:32:04'),
(41, 'what is garage id', 'text', 'garage_data', 'what_is_garage_id', '#9Q2GS63', NULL, '2025-08-07 22:11:07', '2025-08-07 22:11:07'),
(42, 'what is owner license number', 'text', 'owner_data', 'what_is_owner_license_number', '#0LXJD43', NULL, '2025-08-07 22:11:36', '2025-08-07 22:11:36'),
(43, 'garage_10', 'text', 'garage_data', 'garage_10', '#YKE7X47', NULL, '2025-08-07 23:46:03', '2025-08-07 23:46:03'),
(44, 'spot_10', 'text', 'spot_data', 'spot_10', '#6WJ5U79', NULL, '2025-08-07 23:46:35', '2025-08-07 23:46:35'),
(45, 'driver_10', 'date', 'driver_data', 'driver_10', '#XM6R117', NULL, '2025-08-07 23:46:57', '2025-08-07 23:46:57'),
(46, 'owner_10', 'text', 'owner_data', 'owner_10', '#MYDGZ51', NULL, '2025-08-07 23:47:19', '2025-08-07 23:47:19');

-- --------------------------------------------------------

--
-- Table structure for table `re_assign_work_data`
--

CREATE TABLE `re_assign_work_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED NOT NULL,
  `garage_gate_entry_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_gate_entry_images`)),
  `garage_job_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_job_card_images`)),
  `vehicle_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vehicle_images`)),
  `garage_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_voice`)),
  `driver_image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_image`)),
  `driving_licence_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driving_licence_images`)),
  `rc_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`rc_images`)),
  `driver_aadhaar_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_aadhaar_card_images`)),
  `driver_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`driver_voice`)),
  `spot_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spot_images`)),
  `spot_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spot_voice`)),
  `owner_written_statment_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_written_statment_images`)),
  `owner_aadhaar_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_aadhaar_card_images`)),
  `owner_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`owner_voice`)),
  `accident_person_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_images`)),
  `accident_person_aadhaar_card_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_aadhaar_card_images`)),
  `accident_person_written_statment_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_written_statment_images`)),
  `accident_person_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accident_person_voice`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `basic` varchar(255) DEFAULT NULL,
  `allowance` varchar(255) DEFAULT NULL,
  `bonus` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `month_year` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `user_id`, `basic`, `allowance`, `bonus`, `total`, `month_year`, `date`, `created_at`, `updated_at`) VALUES
(1, 18, '45000', '3000', '2000', '50000', '2024-10', '18-10-2024', '2024-10-18 08:46:49', '2024-10-18 08:46:49'),
(2, 9, '15000', '2500', '2500', '20000', '2024-10', '18-10-2024', '2024-10-18 09:35:52', '2024-10-18 09:35:52'),
(3, 9, '10000', '2000', '1000', '13000', '2024-10', '18-10-2024', '2024-10-18 09:36:48', '2024-10-18 09:36:48'),
(4, 2, '21212121212', '12122112', '12121212', '21236364536', '1221-12', '21-10-2024', '2024-10-21 09:55:16', '2024-10-21 09:55:16'),
(5, 4, '10000', '1000', '100', '11100', '2024-10', '21-10-2024', '2024-10-21 10:38:35', '2024-10-21 10:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `spot_data`
--

CREATE TABLE `spot_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED NOT NULL,
  `spot_address` varchar(255) DEFAULT NULL,
  `spot_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spot_images`)),
  `spot_voice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spot_voice`)),
  `latitude_and_longitude` varchar(255) DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `road_details` text DEFAULT NULL,
  `investigation_date` date DEFAULT NULL,
  `investigation_submission_date` date DEFAULT NULL,
  `op_no` varchar(255) DEFAULT NULL,
  `advocate_name` varchar(255) DEFAULT NULL,
  `court` varchar(255) DEFAULT NULL,
  `case_title` varchar(255) DEFAULT NULL,
  `case_claim` varchar(255) DEFAULT NULL,
  `cause_loss` varchar(255) DEFAULT NULL,
  `od_claim` varchar(255) DEFAULT NULL,
  `spot_downloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`spot_downloads`)),
  `sp_case` int(11) DEFAULT NULL,
  `investigation_bill_no` varchar(255) DEFAULT NULL,
  `investigation_report` varchar(255) DEFAULT NULL,
  `loss_minimization_sheet` varchar(255) DEFAULT NULL,
  `policy_copy` varchar(255) DEFAULT NULL,
  `driving_license_extract` varchar(255) DEFAULT NULL,
  `permit_copy` varchar(255) DEFAULT NULL,
  `fitness_certificate_copy` varchar(255) DEFAULT NULL,
  `rc_book` varchar(255) DEFAULT NULL,
  `insured_statement` varchar(255) DEFAULT NULL,
  `claimant_statement` varchar(255) DEFAULT NULL,
  `seizure_memo_copy` varchar(255) DEFAULT NULL,
  `arrest_memo_copy` varchar(255) DEFAULT NULL,
  `mvi_report` varchar(255) DEFAULT NULL,
  `age_proof` varchar(255) DEFAULT NULL,
  `income_proof` varchar(255) DEFAULT NULL,
  `occupation_proof` varchar(255) DEFAULT NULL,
  `family_photograph` varchar(255) DEFAULT NULL,
  `spot_panchnama_copy` varchar(255) DEFAULT NULL,
  `accident_site_map` varchar(255) DEFAULT NULL,
  `inquest_panchnama` varchar(255) DEFAULT NULL,
  `paper_cutting` varchar(255) DEFAULT NULL,
  `fir` varchar(255) DEFAULT NULL,
  `final_report_charge_sheet` varchar(255) DEFAULT NULL,
  `death_certificate` varchar(255) DEFAULT NULL,
  `post_mortem_report` varchar(255) DEFAULT NULL,
  `viscera_report` varchar(255) DEFAULT NULL,
  `od_status` varchar(255) DEFAULT NULL,
  `tp_vehicle_insurance_details` varchar(255) DEFAULT NULL,
  `tp_driving_license` varchar(255) DEFAULT NULL,
  `tp_insurer_confirmation` varchar(255) DEFAULT NULL,
  `notice_u_s_134c` varchar(255) DEFAULT NULL,
  `accident_location` varchar(255) DEFAULT NULL,
  `date_time_of_accident` date DEFAULT NULL,
  `enter_the_address_or_coordinates_of_the_accident_spot` varchar(255) DEFAULT NULL,
  `were_any_traffic_signals_nearby` varchar(255) DEFAULT NULL,
  `was_there_any_police_presence_at_the_location` varchar(255) DEFAULT NULL,
  `aaaaaass` varchar(255) DEFAULT '''''''NULL''''''',
  `what_is_spot_locations` varchar(255) DEFAULT NULL,
  `ffdsf` varchar(255) DEFAULT NULL,
  `dddddd` varchar(255) DEFAULT NULL,
  `fdfdf` varchar(255) DEFAULT NULL,
  `spot_10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spot_data`
--

INSERT INTO `spot_data` (`id`, `assign_work_id`, `spot_address`, `spot_images`, `spot_voice`, `latitude_and_longitude`, `executive_id`, `created_at`, `updated_at`, `location`, `road_details`, `investigation_date`, `investigation_submission_date`, `op_no`, `advocate_name`, `court`, `case_title`, `case_claim`, `cause_loss`, `od_claim`, `spot_downloads`, `sp_case`, `investigation_bill_no`, `investigation_report`, `loss_minimization_sheet`, `policy_copy`, `driving_license_extract`, `permit_copy`, `fitness_certificate_copy`, `rc_book`, `insured_statement`, `claimant_statement`, `seizure_memo_copy`, `arrest_memo_copy`, `mvi_report`, `age_proof`, `income_proof`, `occupation_proof`, `family_photograph`, `spot_panchnama_copy`, `accident_site_map`, `inquest_panchnama`, `paper_cutting`, `fir`, `final_report_charge_sheet`, `death_certificate`, `post_mortem_report`, `viscera_report`, `od_status`, `tp_vehicle_insurance_details`, `tp_driving_license`, `tp_insurer_confirmation`, `notice_u_s_134c`, `accident_location`, `date_time_of_accident`, `enter_the_address_or_coordinates_of_the_accident_spot`, `were_any_traffic_signals_nearby`, `was_there_any_police_presence_at_the_location`, `aaaaaass`, `what_is_spot_locations`, `ffdsf`, `dddddd`, `fdfdf`, `spot_10`) VALUES
(1, 4, NULL, NULL, NULL, NULL, 11, '2025-08-07 23:45:23', '2025-08-07 23:45:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'spot44', NULL, NULL, '\'\'\'NULL\'\'\'', NULL, NULL, NULL, NULL, NULL),
(2, 5, NULL, NULL, NULL, NULL, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\'\'\'NULL\'\'\'', NULL, NULL, NULL, NULL, 'spot44');

-- --------------------------------------------------------

--
-- Table structure for table `spot_data_old`
--

CREATE TABLE `spot_data_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_work_id` bigint(20) UNSIGNED DEFAULT NULL,
  `executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gggggff` varchar(255) DEFAULT NULL,
  `zdsd` varchar(255) DEFAULT NULL,
  `what_is_spot_locations` varchar(255) DEFAULT NULL,
  `ffdsf` varchar(255) DEFAULT NULL,
  `dddddd` varchar(255) DEFAULT NULL,
  `fdfdf` varchar(255) DEFAULT NULL,
  `spot_10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spot_data_old`
--

INSERT INTO `spot_data_old` (`id`, `assign_work_id`, `executive_id`, `created_at`, `updated_at`, `gggggff`, `zdsd`, `what_is_spot_locations`, `ffdsf`, `dddddd`, `fdfdf`, `spot_10`) VALUES
(1, 5, 11, '2025-08-07 23:53:45', '2025-08-07 23:53:45', NULL, NULL, NULL, NULL, NULL, NULL, 'spot44');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fields`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `login_request` tinyint(1) NOT NULL DEFAULT 0,
  `imei` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `place`, `email_verified_at`, `password`, `role`, `login_request`, `imei`, `status`, `create_by`, `update_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '7708782197', 'admin@mail.com', NULL, NULL, '$2y$12$6hERzWTNcZaQLzgkm4ea.uFsdz1kLmbKVvsAgXz3WXxwiKjthYAqa', '1', 0, NULL, '1', NULL, NULL, NULL, '2024-10-02 22:11:07', '2024-10-02 22:11:07'),
(2, 'NivTest Mob', '9048007933', 'test@gmail.com', 'Kondotty', NULL, '$2y$12$kGwXWtszf2BlzX5O1uKb9./yn4exNIxFiryA1Ka4XeAaViHoni34i', '3', 0, NULL, '1', '1', '1', NULL, '2025-07-14 04:31:36', '2025-07-22 03:11:00'),
(11, 'Abc user', '9497626678', 'abc@gmail.com', 'USA', NULL, '$2y$12$LUV.KOo5AG0QvAqi3GREzOFYut/3RUS8QVMPeqMb/y6r6c8RKW1H2', '3', 0, NULL, '1', '1', '1', NULL, '2025-08-06 01:58:24', '2025-08-07 22:20:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_person_data`
--
ALTER TABLE `accident_person_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accident_person_data_old`
--
ALTER TABLE `accident_person_data_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_work_data`
--
ALTER TABLE `assign_work_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assign_work_data_case_id_foreign` (`case_id`);

--
-- Indexes for table `case_assignments`
--
ALTER TABLE `case_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_assignments_executive_driver_foreign` (`executive_driver`),
  ADD KEY `case_assignments_executive_garage_foreign` (`executive_garage`),
  ADD KEY `case_assignments_executive_spot_foreign` (`executive_spot`),
  ADD KEY `case_assignments_executive_meeting_foreign` (`executive_meeting`),
  ADD KEY `case_assignments_executive_accident_person_foreign` (`executive_accident_person`),
  ADD KEY `case_assignments_company_id_foreign` (`company_id`),
  ADD KEY `case_assignments_customer_id_foreign` (`customer_id`),
  ADD KEY `case_assignments_case_id_foreign` (`case_id`);

--
-- Indexes for table `company_logos`
--
ALTER TABLE `company_logos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_logos_email_unique` (`email`);

--
-- Indexes for table `driver_data`
--
ALTER TABLE `driver_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_data_assign_work_id_foreign` (`assign_work_id`),
  ADD KEY `driver_data_executive_id_foreign` (`executive_id`);

--
-- Indexes for table `driver_data_old`
--
ALTER TABLE `driver_data_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `final_reports`
--
ALTER TABLE `final_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garage_data`
--
ALTER TABLE `garage_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garage_data_old`
--
ALTER TABLE `garage_data_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance_cases`
--
ALTER TABLE `insurance_cases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance_companies`
--
ALTER TABLE `insurance_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance_customers`
--
ALTER TABLE `insurance_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `odometer_readings`
--
ALTER TABLE `odometer_readings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_data`
--
ALTER TABLE `owner_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_data_old`
--
ALTER TABLE `owner_data_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_requests`
--
ALTER TABLE `password_reset_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionnaire_submissions`
--
ALTER TABLE `questionnaire_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_assign_work_data`
--
ALTER TABLE `re_assign_work_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot_data`
--
ALTER TABLE `spot_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spot_data_old`
--
ALTER TABLE `spot_data_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident_person_data`
--
ALTER TABLE `accident_person_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accident_person_data_old`
--
ALTER TABLE `accident_person_data_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_work_data`
--
ALTER TABLE `assign_work_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `case_assignments`
--
ALTER TABLE `case_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver_data`
--
ALTER TABLE `driver_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver_data_old`
--
ALTER TABLE `driver_data_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `final_reports`
--
ALTER TABLE `final_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `garage_data`
--
ALTER TABLE `garage_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `garage_data_old`
--
ALTER TABLE `garage_data_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `insurance_cases`
--
ALTER TABLE `insurance_cases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `insurance_companies`
--
ALTER TABLE `insurance_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `insurance_customers`
--
ALTER TABLE `insurance_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `odometer_readings`
--
ALTER TABLE `odometer_readings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `owner_data`
--
ALTER TABLE `owner_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `owner_data_old`
--
ALTER TABLE `owner_data_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `password_reset_requests`
--
ALTER TABLE `password_reset_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questionnaire_submissions`
--
ALTER TABLE `questionnaire_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `re_assign_work_data`
--
ALTER TABLE `re_assign_work_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `spot_data`
--
ALTER TABLE `spot_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spot_data_old`
--
ALTER TABLE `spot_data_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
