//
//  ImplementingPartnersDetailsData.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import Foundation

struct ImplementingPartnerDetailsData : Codable {
    let ngoProfile : NgoProfile?
    let ngoProjects : [NgoProjects]?
//    let ngo_portfolio : [String]?
    let keyManagements : [KeyManagements]?
//    let ngoCertifications : [NgoCertifications]?
    let ngoCertifications : [String]?
    let ngoPhotos : [NgoPhotos]?

    enum CodingKeys: String, CodingKey {

        case ngoProfile = "ngo_profile"
        case ngoProjects = "ngo_projects"
//        case ngo_portfolio = "ngo_portfolio"
        case keyManagements = "key_managements"
        case ngoCertifications = "ngo_certifications"
        case ngoPhotos = "ngo_photos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngoProfile = try values.decodeIfPresent(NgoProfile.self, forKey: .ngoProfile)
        ngoProjects = try values.decodeIfPresent([NgoProjects].self, forKey: .ngoProjects)
//        ngo_portfolio = try values.decodeIfPresent([String].self, forKey: .ngo_portfolio)
        keyManagements = try values.decodeIfPresent([KeyManagements].self, forKey: .keyManagements)
        ngoCertifications = try values.decodeIfPresent([String].self, forKey: .ngoCertifications)
        ngoPhotos = try values.decodeIfPresent([NgoPhotos].self, forKey: .ngoPhotos)
    }

}

struct NgoProjects : Codable {
    let project_id : Int?
    let project_p_id : Int?
    let corporate_id : Int?
    let parent_project_id : Int?
    let ngo_id : Int?
    let theme_id : Int?
    let parent_theme_id : Int?
    let proj_custom_code : String?
    let project_code : String?
    let project_name : String?
    let project_slug : String?
    let project_type : Int?
    let sdg_ids : String?
    let project_summary : String?
    let project_image : String?
    let project_geographical_location : String?
    let budget_type_id : Int?
    let total_project_budget : Int?
    let target_beneficiaries : String?
    let financial_nature : String?
    let nature_service_id : Int?
    let frequency_of_service : String?
    let project_duration : Int?
    let zone_id : Int?
    let project_start_date : String?
    let project_end_date : String?
    let project_other_fields_data : String?
    let beneficiary_form_id : Int?
    let project_status : Int?
    let is_activity_freeze : Int?
    let activity_form_id : Int?
    let schedule_vii : Int?
    let is_localarea : Int?
    let is_mode_direct : Int?
    let is_ongoing : Int?
    let ben_target_male : Int?
    let ben_target_female : Int?
    let is_ben_bulk : Int?
    let parent_zone_id : Int?
//    let activity_name : String?
//    let project_theme : String?
//    let project_nature : String?
//    let budget_type_month : String?
//    let actual_spend : String?
//    let actual_beneficiary : String?
//    let mode_of_implementation : String?
//    let corporate_project_type_map_id : String?
//    let organization_type : String?
//    let project_amns_title : String?
//    let sub_partner_ids : String?
    let states : String?

    enum CodingKeys: String, CodingKey {

        case project_id = "project_id"
        case project_p_id = "project_p_id"
        case corporate_id = "corporate_id"
        case parent_project_id = "parent_project_id"
        case ngo_id = "ngo_id"
        case theme_id = "theme_id"
        case parent_theme_id = "parent_theme_id"
        case proj_custom_code = "proj_custom_code"
        case project_code = "project_code"
        case project_name = "project_name"
        case project_slug = "project_slug"
        case project_type = "project_type"
        case sdg_ids = "sdg_ids"
        case project_summary = "project_summary"
        case project_image = "project_image"
        case project_geographical_location = "project_geographical_location"
        case budget_type_id = "budget_type_id"
        case total_project_budget = "total_project_budget"
        case target_beneficiaries = "target_beneficiaries"
        case financial_nature = "financial_nature"
        case nature_service_id = "nature_service_id"
        case frequency_of_service = "frequency_of_service"
        case project_duration = "project_duration"
        case zone_id = "zone_id"
        case project_start_date = "project_start_date"
        case project_end_date = "project_end_date"
        case project_other_fields_data = "project_other_fields_data"
        case beneficiary_form_id = "beneficiary_form_id"
        case project_status = "project_status"
        case is_activity_freeze = "is_activity_freeze"
        case activity_form_id = "activity_form_id"
        case schedule_vii = "schedule_vii"
        case is_localarea = "is_localarea"
        case is_mode_direct = "is_mode_direct"
        case is_ongoing = "is_ongoing"
        case ben_target_male = "ben_target_male"
        case ben_target_female = "ben_target_female"
        case is_ben_bulk = "is_ben_bulk"
        case parent_zone_id = "parent_zone_id"
//        case activity_name = "activity_name"
//        case project_theme = "project_theme"
//        case project_nature = "project_nature"
//        case budget_type_month = "budget_type_month"
//        case actual_spend = "actual_spend"
//        case actual_beneficiary = "actual_beneficiary"
//        case mode_of_implementation = "mode_of_implementation"
//        case corporate_project_type_map_id = "corporate_project_type_map_id"
//        case organization_type = "organization_type"
//        case project_amns_title = "project_amns_title"
//        case sub_partner_ids = "sub_partner_ids"
        case states = "states"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        project_p_id = try values.decodeIfPresent(Int.self, forKey: .project_p_id)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
        parent_project_id = try values.decodeIfPresent(Int.self, forKey: .parent_project_id)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        theme_id = try values.decodeIfPresent(Int.self, forKey: .theme_id)
        parent_theme_id = try values.decodeIfPresent(Int.self, forKey: .parent_theme_id)
        proj_custom_code = try values.decodeIfPresent(String.self, forKey: .proj_custom_code)
        project_code = try values.decodeIfPresent(String.self, forKey: .project_code)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        project_slug = try values.decodeIfPresent(String.self, forKey: .project_slug)
        project_type = try values.decodeIfPresent(Int.self, forKey: .project_type)
        sdg_ids = try values.decodeIfPresent(String.self, forKey: .sdg_ids)
        project_summary = try values.decodeIfPresent(String.self, forKey: .project_summary)
        project_image = try values.decodeIfPresent(String.self, forKey: .project_image)
        project_geographical_location = try values.decodeIfPresent(String.self, forKey: .project_geographical_location)
        budget_type_id = try values.decodeIfPresent(Int.self, forKey: .budget_type_id)
        total_project_budget = try values.decodeIfPresent(Int.self, forKey: .total_project_budget)
        target_beneficiaries = try values.decodeIfPresent(String.self, forKey: .target_beneficiaries)
        financial_nature = try values.decodeIfPresent(String.self, forKey: .financial_nature)
        nature_service_id = try values.decodeIfPresent(Int.self, forKey: .nature_service_id)
        frequency_of_service = try values.decodeIfPresent(String.self, forKey: .frequency_of_service)
        project_duration = try values.decodeIfPresent(Int.self, forKey: .project_duration)
        zone_id = try values.decodeIfPresent(Int.self, forKey: .zone_id)
        project_start_date = try values.decodeIfPresent(String.self, forKey: .project_start_date)
        project_end_date = try values.decodeIfPresent(String.self, forKey: .project_end_date)
        project_other_fields_data = try values.decodeIfPresent(String.self, forKey: .project_other_fields_data)
        beneficiary_form_id = try values.decodeIfPresent(Int.self, forKey: .beneficiary_form_id)
        project_status = try values.decodeIfPresent(Int.self, forKey: .project_status)
        is_activity_freeze = try values.decodeIfPresent(Int.self, forKey: .is_activity_freeze)
        activity_form_id = try values.decodeIfPresent(Int.self, forKey: .activity_form_id)
        schedule_vii = try values.decodeIfPresent(Int.self, forKey: .schedule_vii)
        is_localarea = try values.decodeIfPresent(Int.self, forKey: .is_localarea)
        is_mode_direct = try values.decodeIfPresent(Int.self, forKey: .is_mode_direct)
        is_ongoing = try values.decodeIfPresent(Int.self, forKey: .is_ongoing)
        ben_target_male = try values.decodeIfPresent(Int.self, forKey: .ben_target_male)
        ben_target_female = try values.decodeIfPresent(Int.self, forKey: .ben_target_female)
        is_ben_bulk = try values.decodeIfPresent(Int.self, forKey: .is_ben_bulk)
        parent_zone_id = try values.decodeIfPresent(Int.self, forKey: .parent_zone_id)
//        activity_name = try values.decodeIfPresent(String.self, forKey: .activity_name)
//        project_theme = try values.decodeIfPresent(String.self, forKey: .project_theme)
//        project_nature = try values.decodeIfPresent(String.self, forKey: .project_nature)
//        budget_type_month = try values.decodeIfPresent(String.self, forKey: .budget_type_month)
//        actual_spend = try values.decodeIfPresent(String.self, forKey: .actual_spend)
//        actual_beneficiary = try values.decodeIfPresent(String.self, forKey: .actual_beneficiary)
//        mode_of_implementation = try values.decodeIfPresent(String.self, forKey: .mode_of_implementation)
//        corporate_project_type_map_id = try values.decodeIfPresent(String.self, forKey: .corporate_project_type_map_id)
//        organization_type = try values.decodeIfPresent(String.self, forKey: .organization_type)
//        project_amns_title = try values.decodeIfPresent(String.self, forKey: .project_amns_title)
//        sub_partner_ids = try values.decodeIfPresent(String.self, forKey: .sub_partner_ids)
        states = try values.decodeIfPresent(String.self, forKey: .states)
    }

}


struct NgoProfile : Codable {
    let ngo_id : Int?
    let ngo_darpan_id : String?
    let ngo_pan_number : String?
    let ngo_registration_no : String?
    let ngo_name : String?
    let ngo_slug : String?
    let ngo_logo : String?
    let ngo_address : String?
    let ngo_zip : String?
    let year_of_foundation : Int?
    let ngo_contact_person : String?
    let ngo_contact_number : String?
    let ngo_contact_email : String?
    let is_12_a_registration : Int?
    let org_type : Int?
    let a12_registration_number : String?
    let a12_registration_certificate : String?
    let is_80g_registration : Int?
    let g80_registration_number : String?
    let g80_certificate : String?
    let is_fcra_registration : Int?
    let fcra_registration_number : String?
    let fcra_registration_certificate : String?
    let organisation_structure_file : String?
    let head_office : Int?
    let states_operating : String?
    let mission : String?
    let ngo_area : Int?
    let ngo_state : Int?
    let ngo_district : Int?
    let created_by : Int?
    let created_at : String?
    let updated_at : String?
    let registration_no : String?
    let ngo_application_id : Int?
    let service_providers : Int?
    let vendor_code : String?
    let mou_file : String?
    let order_file : String?
    let csr_form_1 : String?
    let copy_of_cancelled_cheque_leaf : String?
    let mca_registration_Letter : String?
    let vrf_form : String?
    let ust_code_of_conduct : String?
    let sustainable_procurement_questionnaire : String?
    let annual_receipt_and_annual_report_details : String?
    let audit_report_details : String?
    let itr_report_details : String?
    let pan_no : String?
    let registration_certificate : String?
    let moa_deed : String?
    let state_name : String?

    enum CodingKeys: String, CodingKey {

        case ngo_id = "ngo_id"
        case ngo_darpan_id = "ngo_darpan_id"
        case ngo_pan_number = "ngo_pan_number"
        case ngo_registration_no = "ngo_registration_no"
        case ngo_name = "ngo_name"
        case ngo_slug = "ngo_slug"
        case ngo_logo = "ngo_logo"
        case ngo_address = "ngo_address"
        case ngo_zip = "ngo_zip"
        case year_of_foundation = "year_of_foundation"
        case ngo_contact_person = "ngo_contact_person"
        case ngo_contact_number = "ngo_contact_number"
        case ngo_contact_email = "ngo_contact_email"
        case is_12_a_registration = "is_12_a_registration"
        case org_type = "org_type"
        case a12_registration_number = "a12_registration_number"
        case a12_registration_certificate = "a12_registration_certificate"
        case is_80g_registration = "is_80g_registration"
        case g80_registration_number = "g80_registration_number"
        case g80_certificate = "g80_certificate"
        case is_fcra_registration = "is_fcra_registration"
        case fcra_registration_number = "fcra_registration_number"
        case fcra_registration_certificate = "fcra_registration_certificate"
        case organisation_structure_file = "organisation_structure_file"
        case head_office = "head_office"
        case states_operating = "states_operating"
        case mission = "mission"
        case ngo_area = "ngo_area"
        case ngo_state = "ngo_state"
        case ngo_district = "ngo_district"
        case created_by = "created_by"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case registration_no = "registration_no"
        case ngo_application_id = "ngo_application_id"
        case service_providers = "service_providers"
        case vendor_code = "vendor_code"
        case mou_file = "mou_file"
        case order_file = "order_file"
        case csr_form_1 = "csr_form_1"
        case copy_of_cancelled_cheque_leaf = "copy_of_cancelled_cheque_leaf"
        case mca_registration_Letter = "mca_registration_Letter"
        case vrf_form = "vrf_form"
        case ust_code_of_conduct = "ust_code_of_conduct"
        case sustainable_procurement_questionnaire = "sustainable_procurement_questionnaire"
        case annual_receipt_and_annual_report_details = "annual_receipt_and_annual_report_details"
        case audit_report_details = "audit_report_details"
        case itr_report_details = "itr_report_details"
        case pan_no = "pan_no"
        case registration_certificate = "registration_certificate"
        case moa_deed = "moa_deed"
        case state_name = "state_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        ngo_darpan_id = try values.decodeIfPresent(String.self, forKey: .ngo_darpan_id)
        ngo_pan_number = try values.decodeIfPresent(String.self, forKey: .ngo_pan_number)
        ngo_registration_no = try values.decodeIfPresent(String.self, forKey: .ngo_registration_no)
        ngo_name = try values.decodeIfPresent(String.self, forKey: .ngo_name)
        ngo_slug = try values.decodeIfPresent(String.self, forKey: .ngo_slug)
        ngo_logo = try values.decodeIfPresent(String.self, forKey: .ngo_logo)
        ngo_address = try values.decodeIfPresent(String.self, forKey: .ngo_address)
        ngo_zip = try values.decodeIfPresent(String.self, forKey: .ngo_zip)
        year_of_foundation = try values.decodeIfPresent(Int.self, forKey: .year_of_foundation)
        ngo_contact_person = try values.decodeIfPresent(String.self, forKey: .ngo_contact_person)
        ngo_contact_number = try values.decodeIfPresent(String.self, forKey: .ngo_contact_number)
        ngo_contact_email = try values.decodeIfPresent(String.self, forKey: .ngo_contact_email)
        is_12_a_registration = try values.decodeIfPresent(Int.self, forKey: .is_12_a_registration)
        org_type = try values.decodeIfPresent(Int.self, forKey: .org_type)
        a12_registration_number = try values.decodeIfPresent(String.self, forKey: .a12_registration_number)
        a12_registration_certificate = try values.decodeIfPresent(String.self, forKey: .a12_registration_certificate)
        is_80g_registration = try values.decodeIfPresent(Int.self, forKey: .is_80g_registration)
        g80_registration_number = try values.decodeIfPresent(String.self, forKey: .g80_registration_number)
        g80_certificate = try values.decodeIfPresent(String.self, forKey: .g80_certificate)
        is_fcra_registration = try values.decodeIfPresent(Int.self, forKey: .is_fcra_registration)
        fcra_registration_number = try values.decodeIfPresent(String.self, forKey: .fcra_registration_number)
        fcra_registration_certificate = try values.decodeIfPresent(String.self, forKey: .fcra_registration_certificate)
        organisation_structure_file = try values.decodeIfPresent(String.self, forKey: .organisation_structure_file)
        head_office = try values.decodeIfPresent(Int.self, forKey: .head_office)
        states_operating = try values.decodeIfPresent(String.self, forKey: .states_operating)
        mission = try values.decodeIfPresent(String.self, forKey: .mission)
        ngo_area = try values.decodeIfPresent(Int.self, forKey: .ngo_area)
        ngo_state = try values.decodeIfPresent(Int.self, forKey: .ngo_state)
        ngo_district = try values.decodeIfPresent(Int.self, forKey: .ngo_district)
        created_by = try values.decodeIfPresent(Int.self, forKey: .created_by)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        registration_no = try values.decodeIfPresent(String.self, forKey: .registration_no)
        ngo_application_id = try values.decodeIfPresent(Int.self, forKey: .ngo_application_id)
        service_providers = try values.decodeIfPresent(Int.self, forKey: .service_providers)
        vendor_code = try values.decodeIfPresent(String.self, forKey: .vendor_code)
        mou_file = try values.decodeIfPresent(String.self, forKey: .mou_file)
        order_file = try values.decodeIfPresent(String.self, forKey: .order_file)
        csr_form_1 = try values.decodeIfPresent(String.self, forKey: .csr_form_1)
        copy_of_cancelled_cheque_leaf = try values.decodeIfPresent(String.self, forKey: .copy_of_cancelled_cheque_leaf)
        mca_registration_Letter = try values.decodeIfPresent(String.self, forKey: .mca_registration_Letter)
        vrf_form = try values.decodeIfPresent(String.self, forKey: .vrf_form)
        ust_code_of_conduct = try values.decodeIfPresent(String.self, forKey: .ust_code_of_conduct)
        sustainable_procurement_questionnaire = try values.decodeIfPresent(String.self, forKey: .sustainable_procurement_questionnaire)
        annual_receipt_and_annual_report_details = try values.decodeIfPresent(String.self, forKey: .annual_receipt_and_annual_report_details)
        audit_report_details = try values.decodeIfPresent(String.self, forKey: .audit_report_details)
        itr_report_details = try values.decodeIfPresent(String.self, forKey: .itr_report_details)
        pan_no = try values.decodeIfPresent(String.self, forKey: .pan_no)
        registration_certificate = try values.decodeIfPresent(String.self, forKey: .registration_certificate)
        moa_deed = try values.decodeIfPresent(String.self, forKey: .moa_deed)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
    }

}


struct KeyManagements : Codable {
    let ngo_key_management_id : Int?
    let ngo_id : Int?
    let designation : String?
    let contact_name : String?
    let email_id : String?
    let contact_mobile_no : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case ngo_key_management_id = "ngo_key_management_id"
        case ngo_id = "ngo_id"
        case designation = "designation"
        case contact_name = "contact_name"
        case email_id = "email_id"
        case contact_mobile_no = "contact_mobile_no"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_key_management_id = try values.decodeIfPresent(Int.self, forKey: .ngo_key_management_id)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        designation = try values.decodeIfPresent(String.self, forKey: .designation)
        contact_name = try values.decodeIfPresent(String.self, forKey: .contact_name)
        email_id = try values.decodeIfPresent(String.self, forKey: .email_id)
        contact_mobile_no = try values.decodeIfPresent(String.self, forKey: .contact_mobile_no)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct NgoCertifications : Codable {
    let ngo_certificate_id : Int?
    let ngo_id : Int?
    let certificate_id : Int?
    let certificate_file : String?

    enum CodingKeys: String, CodingKey {

        case ngo_certificate_id = "ngo_certificate_id"
        case ngo_id = "ngo_id"
        case certificate_id = "certificate_id"
        case certificate_file = "certificate_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_certificate_id = try values.decodeIfPresent(Int.self, forKey: .ngo_certificate_id)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        certificate_id = try values.decodeIfPresent(Int.self, forKey: .certificate_id)
        certificate_file = try values.decodeIfPresent(String.self, forKey: .certificate_file)
    }

}

struct NgoPhotos : Codable {
    let ngo_photo_id : Int?
    let ngo_id : Int?
    let photo : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case ngo_photo_id = "ngo_photo_id"
        case ngo_id = "ngo_id"
        case photo = "photo"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_photo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_photo_id)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        photo = try values.decodeIfPresent(String.self, forKey: .photo)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
