//
//  SDG.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/02/24.
//

import Foundation

struct SdgsDetails : Codable {
    let success : Bool?
    let data : SdgsData?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(SdgsData.self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct SdgsData : Codable {
    let sdgs : [Sdgs]?

    enum CodingKeys: String, CodingKey {

        case sdgs = "sdgs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sdgs = try values.decodeIfPresent([Sdgs].self, forKey: .sdgs)
    }
}

struct Sdgs : Codable {
    let sdg_id : Int?
    let sdg_name : String?
    let sdg_img : String?
    let beneficary_total : Int?
    let project_count : Int?
    let projects : [SdgsProjects]?

    enum CodingKeys: String, CodingKey {

        case sdg_id = "sdg_id"
        case sdg_name = "sdg_name"
        case sdg_img = "sdg_img"
        case beneficary_total = "beneficary_total"
        case project_count = "project_count"
        case projects = "projects"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sdg_id = try values.decodeIfPresent(Int.self, forKey: .sdg_id)
        sdg_name = try values.decodeIfPresent(String.self, forKey: .sdg_name)
        sdg_img = try values.decodeIfPresent(String.self, forKey: .sdg_img)
        beneficary_total = try values.decodeIfPresent(Int.self, forKey: .beneficary_total)
        project_count = try values.decodeIfPresent(Int.self, forKey: .project_count)
        projects = try values.decodeIfPresent([SdgsProjects].self, forKey: .projects)
    }

}


struct SdgsProjects : Codable {
    let project_id : Int?
    let project_name : String?
    let project_code : String?
    let target_beneficiaries : String?

    enum CodingKeys: String, CodingKey {

        case project_id = "project_id"
        case project_name = "project_name"
        case project_code = "project_code"
        case target_beneficiaries = "target_beneficiaries"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        project_code = try values.decodeIfPresent(String.self, forKey: .project_code)
        target_beneficiaries = try values.decodeIfPresent(String.self, forKey: .target_beneficiaries)
    }

}
