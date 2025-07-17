//
//  NGO.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import Foundation

struct NgodataModel : Codable {
    let success : Bool?
    let header_data : NgoHeaderData?
    let data : [NgoData]?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case header_data = "header_data"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        header_data = try values.decodeIfPresent(NgoHeaderData.self, forKey: .header_data)
        data = try values.decodeIfPresent([NgoData].self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct NgoHeaderData : Codable {
    let total_Application : Int?
    let approved_Application : Int?
    let new_Application : Int?
    let under_Review : Int?
    let additional_Info : Int?
    let rejected : Int?

    enum CodingKeys: String, CodingKey {

        case total_Application = "Total_Application"
        case approved_Application = "Approved_Application"
        case new_Application = "New_Application"
        case under_Review = "Under_Review"
        case additional_Info = "Additional_Info"
        case rejected = "Rejected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_Application = try values.decodeIfPresent(Int.self, forKey: .total_Application)
        approved_Application = try values.decodeIfPresent(Int.self, forKey: .approved_Application)
        new_Application = try values.decodeIfPresent(Int.self, forKey: .new_Application)
        under_Review = try values.decodeIfPresent(Int.self, forKey: .under_Review)
        additional_Info = try values.decodeIfPresent(Int.self, forKey: .additional_Info)
        rejected = try values.decodeIfPresent(Int.self, forKey: .rejected)
    }

}

struct NgoData : Codable {
    let application_proposal_id : Int?
    let proposal_title : String?
    let ngo_name : String?
    let budget : String?
    let theme_name : String?
    let state_name : String?
    let stages_name : String?
    let proposal_status : String?
    let applied_date : String?
    let reviewed_date : String?
    let reviewed_by : String?

    enum CodingKeys: String, CodingKey {

        case application_proposal_id = "application_proposal_id"
        case proposal_title = "proposal_title"
        case ngo_name = "ngo_name"
        case budget = "budget"
        case theme_name = "theme_name"
        case state_name = "state_name"
        case stages_name = "stages_name"
        case proposal_status = "proposal_status"
        case applied_date = "applied_date"
        case reviewed_date = "reviewed_date"
        case reviewed_by = "reviewed_by"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        application_proposal_id = try values.decodeIfPresent(Int.self, forKey: .application_proposal_id)
        proposal_title = try values.decodeIfPresent(String.self, forKey: .proposal_title)
        ngo_name = try values.decodeIfPresent(String.self, forKey: .ngo_name)
        budget = try values.decodeIfPresent(String.self, forKey: .budget)
        theme_name = try values.decodeIfPresent(String.self, forKey: .theme_name)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
        stages_name = try values.decodeIfPresent(String.self, forKey: .stages_name)
        proposal_status = try values.decodeIfPresent(String.self, forKey: .proposal_status)
        applied_date = try values.decodeIfPresent(String.self, forKey: .applied_date)
        reviewed_date = try values.decodeIfPresent(String.self, forKey: .reviewed_date)
        reviewed_by = try values.decodeIfPresent(String.self, forKey: .reviewed_by)
    }

}
