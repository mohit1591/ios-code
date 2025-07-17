//
//  RFP.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import Foundation

struct RFP : Codable {
    let success : Bool?
    let data : [RFPData]?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([RFPData].self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct RFPData : Codable {
    let rfp_id : Int?
    let rfp_title : String?
    let rfp_description : String?
    let rfp_due_date : String?
    let rfp_extended_due_date : String?
    let theme_name : String?
    let rfp_location : String?
    let ngos : String?
    let proposal_count : Int?

    enum CodingKeys: String, CodingKey {

        case rfp_id = "rfp_id"
        case rfp_title = "rfp_title"
        case rfp_description = "rfp_description"
        case rfp_due_date = "rfp_due_date"
        case rfp_extended_due_date = "rfp_extended_due_date"
        case theme_name = "theme_name"
        case rfp_location = "rfp_location"
        case ngos = "ngos"
        case proposal_count = "proposal_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rfp_id = try values.decodeIfPresent(Int.self, forKey: .rfp_id)
        rfp_title = try values.decodeIfPresent(String.self, forKey: .rfp_title)
        rfp_description = try values.decodeIfPresent(String.self, forKey: .rfp_description)
        rfp_due_date = try values.decodeIfPresent(String.self, forKey: .rfp_due_date)
        rfp_extended_due_date = try values.decodeIfPresent(String.self, forKey: .rfp_extended_due_date)
        theme_name = try values.decodeIfPresent(String.self, forKey: .theme_name)
        rfp_location = try values.decodeIfPresent(String.self, forKey: .rfp_location)
        ngos = try values.decodeIfPresent(String.self, forKey: .ngos)
        proposal_count = try values.decodeIfPresent(Int.self, forKey: .proposal_count)
    }

}

