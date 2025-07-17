//
//  FilterNGOApplicationList.swift
//  SouleAce
//
//  Created by ideveloper7 on 05/03/24.
//

import Foundation

struct Filtersdata : Codable {
    let success : Bool?
//    let corporate_stages : [String]?
//    let proposal_stages : [String]?
    let stage_data : [StageData]?
    let themes : [Themes]?
    let rfp_status : [RfpStatus]?
//    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
//        case corporate_stages = "corporate_stages"
//        case proposal_stages = "proposal_stages"
        case stage_data = "stage_data"
        case themes = "themes"
        case rfp_status = "rfp_status"
//        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
//        corporate_stages = try values.decodeIfPresent([String].self, forKey: .corporate_stages)
//        proposal_stages = try values.decodeIfPresent([String].self, forKey: .proposal_stages)
        stage_data = try values.decodeIfPresent([StageData].self, forKey: .stage_data)
        themes = try values.decodeIfPresent([Themes].self, forKey: .themes)
        rfp_status = try values.decodeIfPresent([RfpStatus].self, forKey: .rfp_status)
//        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct Themes : Codable {
    let theme_id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case theme_id = "theme_id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        theme_id = try values.decodeIfPresent(Int.self, forKey: .theme_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct StageData : Codable {
    let stage_name : String?
    let stage_id : Int?

    enum CodingKeys: String, CodingKey {

        case stage_name = "stage_name"
        case stage_id = "stage_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stage_name = try values.decodeIfPresent(String.self, forKey: .stage_name)
        stage_id = try values.decodeIfPresent(Int.self, forKey: .stage_id)
    }

}

struct RfpStatus : Codable {
    let proposal_status_id : Int?
    let proposal_status : String?

    enum CodingKeys: String, CodingKey {

        case proposal_status_id = "proposal_status_id"
        case proposal_status = "proposal_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        proposal_status_id = try values.decodeIfPresent(Int.self, forKey: .proposal_status_id)
        proposal_status = try values.decodeIfPresent(String.self, forKey: .proposal_status)
    }

}
