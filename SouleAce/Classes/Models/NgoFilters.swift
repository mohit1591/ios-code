//
//  NgoFilters.swift
//  SouleAce
//
//  Created by ideveloper7 on 05/03/24.
//

import Foundation

struct FilterBudgetData : Codable {
    let name : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case name = "budget_name"
        case id = "budget_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}


struct FilterStateData : Codable {
    let name : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case name = "state_name"
        case id = "state_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}
