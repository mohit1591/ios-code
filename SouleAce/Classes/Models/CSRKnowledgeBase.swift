//
//  CSRKnowledgeBase.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import Foundation

struct CSRKnowledgeBase : Codable {
    let success : Bool?
    let data : [CSRData]?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([CSRData].self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct CSRData : Codable {
    let csr_id : Int?
    let corporate_id : Int?
    let csr_type_id : Int?
    let csr_released_date : String?
    let csr_title : String?
    let csr_description : String?
    let csr_keywords : String?
    let amendment : String?
    let changes_section_notification : String?
    let amendment_file_name : String?
    let amendment_file : String?

    enum CodingKeys: String, CodingKey {

        case csr_id = "csr_id"
        case corporate_id = "corporate_id"
        case csr_type_id = "csr_type_id"
        case csr_released_date = "csr_released_date"
        case csr_title = "csr_title"
        case csr_description = "csr_description"
        case csr_keywords = "csr_keywords"
        case amendment = "amendment"
        case changes_section_notification = "changes_section_notification"
        case amendment_file_name = "amendment_file_name"
        case amendment_file = "amendment_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        csr_id = try values.decodeIfPresent(Int.self, forKey: .csr_id)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
        csr_type_id = try values.decodeIfPresent(Int.self, forKey: .csr_type_id)
        csr_released_date = try values.decodeIfPresent(String.self, forKey: .csr_released_date)
        csr_title = try values.decodeIfPresent(String.self, forKey: .csr_title)
        csr_description = try values.decodeIfPresent(String.self, forKey: .csr_description)
        csr_keywords = try values.decodeIfPresent(String.self, forKey: .csr_keywords)
        amendment = try values.decodeIfPresent(String.self, forKey: .amendment)
        changes_section_notification = try values.decodeIfPresent(String.self, forKey: .changes_section_notification)
        amendment_file_name = try values.decodeIfPresent(String.self, forKey: .amendment_file_name)
        amendment_file = try values.decodeIfPresent(String.self, forKey: .amendment_file)
    }

}
