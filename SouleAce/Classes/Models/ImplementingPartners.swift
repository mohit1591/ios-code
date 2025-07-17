//
//  ImplementingPartners.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import Foundation

struct ImplementingPartnersData : Codable {
    let success : Bool?
    let data : NgosData?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(NgosData.self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct NgosData : Codable {
    let ngo : [Ngos]?

    enum CodingKeys: String, CodingKey {

        case ngo = "ngos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo = try values.decodeIfPresent([Ngos].self, forKey: .ngo)
    }

}

struct Ngos : Codable {
    let ngo_id : Int?
//    let ngo_darpan_id : String?
    let ngo_pan_number : String?
    let ngo_registration_no : String?
    let ngo_name : String?
//    let ngo_slug : String?
//    let ngo_logo : String?
//    let ngo_address : String?
//    let ngo_zip : String?
//    let year_of_foundation : Int?
    let ngo_contact_person : String?
    let ngo_contact_number : String?
//    let ngo_contact_email : String?
//    let is_12_a_registration : Int?
//    let org_type : Int?
//    let a12_registration_number : String?
//    let a12_registration_certificate : String?
//    let is_80g_registration : Int?
//    let g80_registration_number : String?
//    let g80_certificate : String?
//    let is_fcra_registration : Int?
//    let fcra_registration_number : String?
//    let fcra_registration_certificate : String?
//    let organisation_structure_file : String?
//    let head_office : Int?
//    let states_operating : String?
//    let mission : String?
//    let ngo_area : Int?
//    let ngo_state : Int?
//    let ngo_district : Int?
//    let created_by : Int?
//    let created_at : String?
//    let updated_at : String?
//    let registration_no : String?
//    let ngo_application_id : Int?
//    let service_providers : Int?
//    let vendor_code : String?
//    let mou_file : String?
//    let order_file : String?
//    let csr_form_1 : String?
//    let copy_of_cancelled_cheque_leaf : String?
//    let mca_registration_Letter : String?
//    let vrf_form : String?
//    let ust_code_of_conduct : String?
//    let sustainable_procurement_questionnaire : String?
//    let annual_receipt_and_annual_report_details : String?
//    let audit_report_details : String?
//    let itr_report_details : String?
//    let pan_no : String?
//    let registration_certificate : String?
//    let moa_deed : String?
//    let id : Int?
//    let project_id : String?
//    let user_type : Int?
    let username : String?
    let first_name : String?
//    let last_name : String?
//    let mobile_no : String?
//    let email : String?
//    let pin_code : String?
//    let profile_image : String?
//    let password : String?
//    let ngo_project_mng : Int?
    let corporate_id : Int?
//    let foundation_id : Int?
//    let corp_type_id : Int?
//    let donor_id : String?
//    let user_status : Int?
//    let address : String?
//    let district_id : Int?
//    let area_id : Int?
//    let state_id : Int?
//    let country_id : Int?
//    let last_loggedin : String?
//    let loggedin_ip : String?
//    let inactive_date : String?
//    let remember_token : String?
//    let restricted_ips : String?
//    let is_otp : Int?
//    let is_verified : Int?
//    let otp_code : String?
//    let otp_code_date : String?
//    let admin_type : Int?
//    let is_corp_super_admin : Int?

    enum CodingKeys: String, CodingKey {

        case ngo_id = "ngo_id"
//        case ngo_darpan_id = "ngo_darpan_id"
        case ngo_pan_number = "ngo_pan_number"
        case ngo_registration_no = "ngo_registration_no"
        case ngo_name = "ngo_name"
//        case ngo_slug = "ngo_slug"
//        case ngo_logo = "ngo_logo"
//        case ngo_address = "ngo_address"
//        case ngo_zip = "ngo_zip"
//        case year_of_foundation = "year_of_foundation"
        case ngo_contact_person = "ngo_contact_person"
        case ngo_contact_number = "ngo_contact_number"
//        case ngo_contact_email = "ngo_contact_email"
//        case is_12_a_registration = "is_12_a_registration"
//        case org_type = "org_type"
//        case a12_registration_number = "a12_registration_number"
//        case a12_registration_certificate = "a12_registration_certificate"
//        case is_80g_registration = "is_80g_registration"
//        case g80_registration_number = "g80_registration_number"
//        case g80_certificate = "g80_certificate"
//        case is_fcra_registration = "is_fcra_registration"
//        case fcra_registration_number = "fcra_registration_number"
//        case fcra_registration_certificate = "fcra_registration_certificate"
//        case organisation_structure_file = "organisation_structure_file"
//        case head_office = "head_office"
//        case states_operating = "states_operating"
//        case mission = "mission"
//        case ngo_area = "ngo_area"
//        case ngo_state = "ngo_state"
//        case ngo_district = "ngo_district"
//        case created_by = "created_by"
//        case created_at = "created_at"
//        case updated_at = "updated_at"
//        case registration_no = "registration_no"
//        case ngo_application_id = "ngo_application_id"
//        case service_providers = "service_providers"
//        case vendor_code = "vendor_code"
//        case mou_file = "mou_file"
//        case order_file = "order_file"
//        case csr_form_1 = "csr_form_1"
//        case copy_of_cancelled_cheque_leaf = "copy_of_cancelled_cheque_leaf"
//        case mca_registration_Letter = "mca_registration_Letter"
//        case vrf_form = "vrf_form"
//        case ust_code_of_conduct = "ust_code_of_conduct"
//        case sustainable_procurement_questionnaire = "sustainable_procurement_questionnaire"
//        case annual_receipt_and_annual_report_details = "annual_receipt_and_annual_report_details"
//        case audit_report_details = "audit_report_details"
//        case itr_report_details = "itr_report_details"
//        case pan_no = "pan_no"
//        case registration_certificate = "registration_certificate"
//        case moa_deed = "moa_deed"
//        case id = "id"
//        case project_id = "project_id"
//        case user_type = "user_type"
        case username = "username"
        case first_name = "first_name"
//        case last_name = "last_name"
//        case mobile_no = "mobile_no"
//        case email = "email"
//        case pin_code = "pin_code"
//        case profile_image = "profile_image"
//        case password = "password"
//        case ngo_project_mng = "ngo_project_mng"
        case corporate_id = "corporate_id"
//        case foundation_id = "foundation_id"
//        case corp_type_id = "corp_type_id"
//        case donor_id = "donor_id"
//        case user_status = "user_status"
//        case address = "address"
//        case district_id = "district_id"
//        case area_id = "area_id"
//        case state_id = "state_id"
//        case country_id = "country_id"
//        case last_loggedin = "last_loggedin"
//        case loggedin_ip = "loggedin_ip"
//        case inactive_date = "inactive_date"
//        case remember_token = "remember_token"
//        case restricted_ips = "restricted_ips"
//        case is_otp = "is_otp"
//        case is_verified = "is_verified"
//        case otp_code = "otp_code"
//        case otp_code_date = "otp_code_date"
//        case admin_type = "admin_type"
//        case is_corp_super_admin = "is_corp_super_admin"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
//        ngo_darpan_id = try values.decodeIfPresent(String.self, forKey: .ngo_darpan_id)
        ngo_pan_number = try values.decodeIfPresent(String.self, forKey: .ngo_pan_number)
        ngo_registration_no = try values.decodeIfPresent(String.self, forKey: .ngo_registration_no)
        ngo_name = try values.decodeIfPresent(String.self, forKey: .ngo_name)
//        ngo_slug = try values.decodeIfPresent(String.self, forKey: .ngo_slug)
//        ngo_logo = try values.decodeIfPresent(String.self, forKey: .ngo_logo)
//        ngo_address = try values.decodeIfPresent(String.self, forKey: .ngo_address)
//        ngo_zip = try values.decodeIfPresent(String.self, forKey: .ngo_zip)
//        year_of_foundation = try values.decodeIfPresent(Int.self, forKey: .year_of_foundation)
        ngo_contact_person = try values.decodeIfPresent(String.self, forKey: .ngo_contact_person)
        ngo_contact_number = try values.decodeIfPresent(String.self, forKey: .ngo_contact_number)
//        ngo_contact_email = try values.decodeIfPresent(String.self, forKey: .ngo_contact_email)
//        is_12_a_registration = try values.decodeIfPresent(Int.self, forKey: .is_12_a_registration)
//        org_type = try values.decodeIfPresent(Int.self, forKey: .org_type)
//        a12_registration_number = try values.decodeIfPresent(String.self, forKey: .a12_registration_number)
//        a12_registration_certificate = try values.decodeIfPresent(String.self, forKey: .a12_registration_certificate)
//        is_80g_registration = try values.decodeIfPresent(Int.self, forKey: .is_80g_registration)
//        g80_registration_number = try values.decodeIfPresent(String.self, forKey: .g80_registration_number)
//        g80_certificate = try values.decodeIfPresent(String.self, forKey: .g80_certificate)
//        is_fcra_registration = try values.decodeIfPresent(Int.self, forKey: .is_fcra_registration)
//        fcra_registration_number = try values.decodeIfPresent(String.self, forKey: .fcra_registration_number)
//        fcra_registration_certificate = try values.decodeIfPresent(String.self, forKey: .fcra_registration_certificate)
//        organisation_structure_file = try values.decodeIfPresent(String.self, forKey: .organisation_structure_file)
//        head_office = try values.decodeIfPresent(Int.self, forKey: .head_office)
//        states_operating = try values.decodeIfPresent(String.self, forKey: .states_operating)
//        mission = try values.decodeIfPresent(String.self, forKey: .mission)
//        ngo_area = try values.decodeIfPresent(Int.self, forKey: .ngo_area)
//        ngo_state = try values.decodeIfPresent(Int.self, forKey: .ngo_state)
//        ngo_district = try values.decodeIfPresent(Int.self, forKey: .ngo_district)
//        created_by = try values.decodeIfPresent(Int.self, forKey: .created_by)
//        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//        registration_no = try values.decodeIfPresent(String.self, forKey: .registration_no)
//        ngo_application_id = try values.decodeIfPresent(Int.self, forKey: .ngo_application_id)
//        service_providers = try values.decodeIfPresent(Int.self, forKey: .service_providers)
//        vendor_code = try values.decodeIfPresent(String.self, forKey: .vendor_code)
//        mou_file = try values.decodeIfPresent(String.self, forKey: .mou_file)
//        order_file = try values.decodeIfPresent(String.self, forKey: .order_file)
//        csr_form_1 = try values.decodeIfPresent(String.self, forKey: .csr_form_1)
//        copy_of_cancelled_cheque_leaf = try values.decodeIfPresent(String.self, forKey: .copy_of_cancelled_cheque_leaf)
//        mca_registration_Letter = try values.decodeIfPresent(String.self, forKey: .mca_registration_Letter)
//        vrf_form = try values.decodeIfPresent(String.self, forKey: .vrf_form)
//        ust_code_of_conduct = try values.decodeIfPresent(String.self, forKey: .ust_code_of_conduct)
//        sustainable_procurement_questionnaire = try values.decodeIfPresent(String.self, forKey: .sustainable_procurement_questionnaire)
//        annual_receipt_and_annual_report_details = try values.decodeIfPresent(String.self, forKey: .annual_receipt_and_annual_report_details)
//        audit_report_details = try values.decodeIfPresent(String.self, forKey: .audit_report_details)
//        itr_report_details = try values.decodeIfPresent(String.self, forKey: .itr_report_details)
//        pan_no = try values.decodeIfPresent(String.self, forKey: .pan_no)
//        registration_certificate = try values.decodeIfPresent(String.self, forKey: .registration_certificate)
//        moa_deed = try values.decodeIfPresent(String.self, forKey: .moa_deed)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        project_id = try values.decodeIfPresent(String.self, forKey: .project_id)
//        user_type = try values.decodeIfPresent(Int.self, forKey: .user_type)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
//        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
//        mobile_no = try values.decodeIfPresent(String.self, forKey: .mobile_no)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        pin_code = try values.decodeIfPresent(String.self, forKey: .pin_code)
//        profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
//        password = try values.decodeIfPresent(String.self, forKey: .password)
//        ngo_project_mng = try values.decodeIfPresent(Int.self, forKey: .ngo_project_mng)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
//        foundation_id = try values.decodeIfPresent(Int.self, forKey: .foundation_id)
//        corp_type_id = try values.decodeIfPresent(Int.self, forKey: .corp_type_id)
//        donor_id = try values.decodeIfPresent(String.self, forKey: .donor_id)
//        user_status = try values.decodeIfPresent(Int.self, forKey: .user_status)
//        address = try values.decodeIfPresent(String.self, forKey: .address)
//        district_id = try values.decodeIfPresent(Int.self, forKey: .district_id)
//        area_id = try values.decodeIfPresent(Int.self, forKey: .area_id)
//        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
//        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
//        last_loggedin = try values.decodeIfPresent(String.self, forKey: .last_loggedin)
//        loggedin_ip = try values.decodeIfPresent(String.self, forKey: .loggedin_ip)
//        inactive_date = try values.decodeIfPresent(String.self, forKey: .inactive_date)
//        remember_token = try values.decodeIfPresent(String.self, forKey: .remember_token)
//        restricted_ips = try values.decodeIfPresent(String.self, forKey: .restricted_ips)
//        is_otp = try values.decodeIfPresent(Int.self, forKey: .is_otp)
//        is_verified = try values.decodeIfPresent(Int.self, forKey: .is_verified)
//        otp_code = try values.decodeIfPresent(String.self, forKey: .otp_code)
//        otp_code_date = try values.decodeIfPresent(String.self, forKey: .otp_code_date)
//        admin_type = try values.decodeIfPresent(Int.self, forKey: .admin_type)
//        is_corp_super_admin = try values.decodeIfPresent(Int.self, forKey: .is_corp_super_admin)
    }

}

