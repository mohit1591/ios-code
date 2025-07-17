//
//  CorporateDashboard.swift
//  SouleAce
//
//  Created by ideveloper7 on 13/02/24.
//

import Foundation

struct DashboardData : Codable {
    let corporate_logo : String?
    let projectSummary : ProjectSummary?
    let beneficiaryInformation : BeneficiaryInformation?
    let projectLocations : ProjectLocations?
    let projectBudget : ProjectBudget?
    let activity : Activity?
    let thematic_areas : [Thematic_areas]?
    let sdg_data : [Sdg_data]?
    let impacts : [ImpactValue]?

    enum CodingKeys: String, CodingKey {

        case corporate_logo = "corporate_logo"
        case projectSummary = "ProjectSummary"
        case beneficiaryInformation = "BeneficiaryInformation"
        case projectLocations = "ProjectLocations"
        case projectBudget = "ProjectBudget"
        case activity = "activity"
        case thematic_areas = "thematic_areas"
        case sdg_data = "sdg_data"
        case impacts = "impacts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        corporate_logo = try values.decodeIfPresent(String.self, forKey: .corporate_logo)
        projectSummary = try values.decodeIfPresent(ProjectSummary.self, forKey: .projectSummary)
        beneficiaryInformation = try values.decodeIfPresent(BeneficiaryInformation.self, forKey: .beneficiaryInformation)
        projectLocations = try values.decodeIfPresent(ProjectLocations.self, forKey: .projectLocations)
        projectBudget = try values.decodeIfPresent(ProjectBudget.self, forKey: .projectBudget)
        activity = try values.decodeIfPresent(Activity.self, forKey: .activity)
        thematic_areas = try values.decodeIfPresent([Thematic_areas].self, forKey: .thematic_areas)
        sdg_data = try values.decodeIfPresent([Sdg_data].self, forKey: .sdg_data)
        impacts = try values.decodeIfPresent([ImpactValue].self, forKey: .impacts)
    }

}

struct ProjectSummary : Codable {
    let ngos : Int?
    let projects : Int?

    enum CodingKeys: String, CodingKey {

        case ngos = "ngos"
        case projects = "projects"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngos = try values.decodeIfPresent(Int.self, forKey: .ngos)
        projects = try values.decodeIfPresent(Int.self, forKey: .projects)
    }

}

struct BeneficiaryInformation : Codable {
    let target_benificaries : Int?
    let covered_benificaries : Int?

    enum CodingKeys: String, CodingKey {

        case target_benificaries = "target_benificaries"
        case covered_benificaries = "covered_benificaries"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        target_benificaries = try values.decodeIfPresent(Int.self, forKey: .target_benificaries)
        covered_benificaries = try values.decodeIfPresent(Int.self, forKey: .covered_benificaries)
    }

}

struct ProjectLocations : Codable {
    let states : Int?
    let districts : Int?
    let asp_districts : Int?

    enum CodingKeys: String, CodingKey {

        case states = "states"
        case districts = "districts"
        case asp_districts = "asp_districts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        states = try values.decodeIfPresent(Int.self, forKey: .states)
        districts = try values.decodeIfPresent(Int.self, forKey: .districts)
        asp_districts = try values.decodeIfPresent(Int.self, forKey: .asp_districts)
    }

}

struct ProjectBudget : Codable {
    let planned : Int?
    let total : Int?
    let disbursed : Int?
    let utilized : Int?
    let unutilized : Int?

    enum CodingKeys: String, CodingKey {

        case planned = "planned"
        case total = "total"
        case disbursed = "disbursed"
        case utilized = "utilized"
        case unutilized = "unutilized"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        planned = try values.decodeIfPresent(Int.self, forKey: .planned)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        disbursed = try values.decodeIfPresent(Int.self, forKey: .disbursed)
        utilized = try values.decodeIfPresent(Int.self, forKey: .utilized)
        unutilized = try values.decodeIfPresent(Int.self, forKey: .unutilized)
    }

}

struct Activity : Codable {
    let total_activity : Int?
    let completed_activity : Int?
    let wip_activity : Int?

    enum CodingKeys: String, CodingKey {

        case total_activity = "total_activity"
        case completed_activity = "completed_activity"
        case wip_activity = "wip_activity"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_activity = try values.decodeIfPresent(Int.self, forKey: .total_activity)
        completed_activity = try values.decodeIfPresent(Int.self, forKey: .completed_activity)
        wip_activity = try values.decodeIfPresent(Int.self, forKey: .wip_activity)
    }

}

struct Thematic_areas : Codable {
    let theme_name : String?
    let total_projects : Int?

    enum CodingKeys: String, CodingKey {

        case theme_name = "theme_name"
        case total_projects = "total_projects"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        theme_name = try values.decodeIfPresent(String.self, forKey: .theme_name)
        total_projects = try values.decodeIfPresent(Int.self, forKey: .total_projects)
    }

}

struct Sdg_data : Codable {
    let sdg_id : Int?
    let sdg_name : String?
    let sdg_img : String?
    let sdg_desc : String?

    enum CodingKeys: String, CodingKey {

        case sdg_id = "sdg_id"
        case sdg_name = "sdg_name"
        case sdg_img = "sdg_img"
        case sdg_desc = "sdg_desc"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sdg_id = try values.decodeIfPresent(Int.self, forKey: .sdg_id)
        sdg_name = try values.decodeIfPresent(String.self, forKey: .sdg_name)
        sdg_img = try values.decodeIfPresent(String.self, forKey: .sdg_img)
        sdg_desc = try values.decodeIfPresent(String.self, forKey: .sdg_desc)
    }

}

struct ImpactValue : Codable {
    let key : String?
    let value : String?

    enum CodingKeys: String, CodingKey {

        case key = "Key"
        case value = "Value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }

}
