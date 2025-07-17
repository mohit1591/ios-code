//
//  CompanyProfile.swift
//  SouleAce
//
//  Created by ideveloper7 on 11/03/24.
//

import Foundation

struct CompanyProfileDetails : Codable {
    let corporate_name : String?
    let corporate_contact_no : String?
    let corporate_email : String?
    let corporate_code : String?
    let corporate_address_1 : String?
    let corporate_state : String?
    let corporate_district : String?
    let corporate_area : String?
    let corporate_pin_code : String?
    let corporate_logo : String?
    let ngo_application_url : String?
    let org_admin_first_name : String?
    let org_admin_mobile_no : String?
    let org_admin_email : String?
    let org_admin_address : String?
    let org_admin_state : String?
    let org_admin_district : String?
    let org_admin_area : String?
    let org_admin_pin_code : String?

    enum CodingKeys: String, CodingKey {

        case corporate_name = "corporate_name"
        case corporate_contact_no = "corporate_contact_no"
        case corporate_email = "corporate_email"
        case corporate_code = "corporate_code"
        case corporate_address_1 = "corporate_address_1"
        case corporate_state = "corporate_state"
        case corporate_district = "corporate_district"
        case corporate_area = "corporate_area"
        case corporate_pin_code = "corporate_pin_code"
        case corporate_logo = "corporate_logo"
        case ngo_application_url = "ngo_application_url"
        case org_admin_first_name = "org_admin_first_name"
        case org_admin_mobile_no = "org_admin_mobile_no"
        case org_admin_email = "org_admin_email"
        case org_admin_address = "org_admin_address"
        case org_admin_state = "org_admin_state"
        case org_admin_district = "org_admin_district"
        case org_admin_area = "org_admin_area"
        case org_admin_pin_code = "org_admin_pin_code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        corporate_name = try values.decodeIfPresent(String.self, forKey: .corporate_name)
        corporate_contact_no = try values.decodeIfPresent(String.self, forKey: .corporate_contact_no)
        corporate_email = try values.decodeIfPresent(String.self, forKey: .corporate_email)
        corporate_code = try values.decodeIfPresent(String.self, forKey: .corporate_code)
        corporate_address_1 = try values.decodeIfPresent(String.self, forKey: .corporate_address_1)
        corporate_state = try values.decodeIfPresent(String.self, forKey: .corporate_state)
        corporate_district = try values.decodeIfPresent(String.self, forKey: .corporate_district)
        corporate_area = try values.decodeIfPresent(String.self, forKey: .corporate_area)
        corporate_pin_code = try values.decodeIfPresent(String.self, forKey: .corporate_pin_code)
        corporate_logo = try values.decodeIfPresent(String.self, forKey: .corporate_logo)
        ngo_application_url = try values.decodeIfPresent(String.self, forKey: .ngo_application_url)
        org_admin_first_name = try values.decodeIfPresent(String.self, forKey: .org_admin_first_name)
        org_admin_mobile_no = try values.decodeIfPresent(String.self, forKey: .org_admin_mobile_no)
        org_admin_email = try values.decodeIfPresent(String.self, forKey: .org_admin_email)
        org_admin_address = try values.decodeIfPresent(String.self, forKey: .org_admin_address)
        org_admin_state = try values.decodeIfPresent(String.self, forKey: .org_admin_state)
        org_admin_district = try values.decodeIfPresent(String.self, forKey: .org_admin_district)
        org_admin_area = try values.decodeIfPresent(String.self, forKey: .org_admin_area)
        org_admin_pin_code = try values.decodeIfPresent(String.self, forKey: .org_admin_pin_code)
    }

}
