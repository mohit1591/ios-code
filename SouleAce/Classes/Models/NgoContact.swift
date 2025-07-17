//
//  NgoContact.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import Foundation

struct NgoContactData : Codable {
    let ngo_contact_id : Int?
    let project_id : Int?
    let designation : String?
    let contact_name : String?
    let organization_name : String?
    let contact_mobile_no : String?
    let involvement_time : String?
    let profile_image_url : String?

    enum CodingKeys: String, CodingKey {

        case ngo_contact_id = "ngo_contact_id"
        case project_id = "project_id"
        case designation = "designation"
        case contact_name = "contact_name"
        case organization_name = "organization_name"
        case contact_mobile_no = "contact_mobile_no"
        case involvement_time = "involvement_time"
        case profile_image_url = "profile_image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_contact_id = try values.decodeIfPresent(Int.self, forKey: .ngo_contact_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        designation = try values.decodeIfPresent(String.self, forKey: .designation)
        contact_name = try values.decodeIfPresent(String.self, forKey: .contact_name)
        organization_name = try values.decodeIfPresent(String.self, forKey: .organization_name)
        contact_mobile_no = try values.decodeIfPresent(String.self, forKey: .contact_mobile_no)
        involvement_time = try values.decodeIfPresent(String.self, forKey: .involvement_time)
        profile_image_url = try values.decodeIfPresent(String.self, forKey: .profile_image_url)
    }

}
