//
//  MyProject.swift
//  SouleAce
//
//  Created by ideveloper7 on 16/02/24.
//

import Foundation

struct MyProjectsData : Codable {
    let success : Bool?
    let data : ProjectData?
    let has_more : Bool?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(ProjectData.self, forKey: .data)
        has_more = try values.decodeIfPresent(Bool.self, forKey: .has_more)
    }

}

struct ProjectData : Codable {
    let currentPage : Int?
    let data : [Projects]?
    let firstPage_url : String?
    let from : Int?
    let nextPage_url : String?
    let path : String?
    let perPage : Int?
    let prevPage_url : String?
    let to : Int?

    enum CodingKeys: String, CodingKey {

        case currentPage = "current_page"
        case data = "data"
        case firstPage_url = "first_page_url"
        case from = "from"
        case nextPage_url = "next_page_url"
        case path = "path"
        case perPage = "per_page"
        case prevPage_url = "prev_page_url"
        case to = "to"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
        data = try values.decodeIfPresent([Projects].self, forKey: .data)
        firstPage_url = try values.decodeIfPresent(String.self, forKey: .firstPage_url)
        from = try values.decodeIfPresent(Int.self, forKey: .from)
        nextPage_url = try values.decodeIfPresent(String.self, forKey: .nextPage_url)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        perPage = try values.decodeIfPresent(Int.self, forKey: .perPage)
        prevPage_url = try values.decodeIfPresent(String.self, forKey: .prevPage_url)
        to = try values.decodeIfPresent(Int.self, forKey: .to)
    }

}

struct Projects : Codable {
    let projectImage: String?
    let projectName: String?
    let projectID, totalProjectBudget: Int?
    let theme, ngoName, targetBeneficiaries, locState: String?
    let pProgress: Int?
    
    enum CodingKeys: String, CodingKey {
        case projectImage = "project_image"
        case projectName = "project_name"
        case projectID = "project_id"
        case totalProjectBudget = "total_project_budget"
        case theme = "theme"
        case ngoName = "ngo_name"
        case targetBeneficiaries = "target_beneficiaries"
        case locState = "loc_state"
        case pProgress = "p_progress"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        projectImage = try values.decodeIfPresent(String.self, forKey: .projectImage)
        projectName = try values.decodeIfPresent(String.self, forKey: .projectName)
        projectID = try values.decodeIfPresent(Int.self, forKey: .projectID)
        pProgress = try values.decodeIfPresent(Int.self, forKey: .pProgress)
        totalProjectBudget = try values.decodeIfPresent(Int.self, forKey: .totalProjectBudget)
        theme = try values.decodeIfPresent(String.self, forKey: .theme)
        ngoName = try values.decodeIfPresent(String.self, forKey: .ngoName)
        targetBeneficiaries = try values.decodeIfPresent(String.self, forKey: .targetBeneficiaries)
        locState = try values.decodeIfPresent(String.self, forKey: .locState)
    }
}
