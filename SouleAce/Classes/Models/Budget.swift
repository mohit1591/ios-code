//
//  Budget.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/02/24.
//

import Foundation

struct BudgetDetails : Codable {
    let success : Bool?
    let data : BudgetData?
    let has_more : String?

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(BudgetData.self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct BudgetData : Codable {
    let fdata : [Fdata]?
    let projectBudgetData : [ProjectBudgetData]?
    let projectBudgetValue : [ProjectBudgetValue]?

    enum CodingKeys: String, CodingKey {
        case fdata = "fdata"
        case projectBudgetData = "project_budget_data"
        case projectBudgetValue = "project_budget_value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fdata = try values.decodeIfPresent([Fdata].self, forKey: .fdata)
        projectBudgetData = try values.decodeIfPresent([ProjectBudgetData].self, forKey: .projectBudgetData)
        projectBudgetValue = try values.decodeIfPresent([ProjectBudgetValue].self, forKey: .projectBudgetValue)
    }

}

struct Fdata : Codable {
    let planned : Int?
    let disbursed : Int?
    let utilized : Int?
    let unutilized : Int?
    let total : Int?
    let year : String?

    enum CodingKeys: String, CodingKey {

        case planned = "planned"
        case disbursed = "disbursed"
        case utilized = "utilized"
        case unutilized = "unutilized"
        case total = "total"
        case year = "year"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        planned = try values.decodeIfPresent(Int.self, forKey: .planned)
        disbursed = try values.decodeIfPresent(Int.self, forKey: .disbursed)
        utilized = try values.decodeIfPresent(Int.self, forKey: .utilized)
        unutilized = try values.decodeIfPresent(Int.self, forKey: .unutilized)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        year = try values.decodeIfPresent(String.self, forKey: .year)
    }

}

struct ProjectBudgetData : Codable {
    let project_name : String?
    let planned : Int?
    let disbursed : Int?
    let disbursed_percent : Int?
    let utilized : Int?
    let utilized_percent : Int?
    let unutilized : Int?
    let unutilized_percent : Int?

    enum CodingKeys: String, CodingKey {

        case project_name = "project_name"
        case planned = "planned"
        case disbursed = "disbursed"
        case disbursed_percent = "disbursed_percent"
        case utilized = "utilized"
        case utilized_percent = "utilized_percent"
        case unutilized = "unutilized"
        case unutilized_percent = "unutilized_percent"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        planned = try values.decodeIfPresent(Int.self, forKey: .planned)
        disbursed = try values.decodeIfPresent(Int.self, forKey: .disbursed)
        disbursed_percent = try values.decodeIfPresent(Int.self, forKey: .disbursed_percent)
        utilized = try values.decodeIfPresent(Int.self, forKey: .utilized)
        utilized_percent = try values.decodeIfPresent(Int.self, forKey: .utilized_percent)
        unutilized = try values.decodeIfPresent(Int.self, forKey: .unutilized)
        unutilized_percent = try values.decodeIfPresent(Int.self, forKey: .unutilized_percent)
    }

}

struct ProjectBudgetValue : Codable {
    let budgetHeader : String?
    let planned : Int?
    let disbursed : Int?
    let spent : Int?
    let unspent : Int?
    let type : Int?

    enum CodingKeys: String, CodingKey {

        case budgetHeader = "budget_header"
        case planned = "planned"
        case disbursed = "disbursed"
        case spent = "spent"
        case unspent = "unspent"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        budgetHeader = try values.decodeIfPresent(String.self, forKey: .budgetHeader)
        planned = try values.decodeIfPresent(Int.self, forKey: .planned)
        disbursed = try values.decodeIfPresent(Int.self, forKey: .disbursed)
        spent = try values.decodeIfPresent(Int.self, forKey: .spent)
        unspent = try values.decodeIfPresent(Int.self, forKey: .unspent)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
    }

}
