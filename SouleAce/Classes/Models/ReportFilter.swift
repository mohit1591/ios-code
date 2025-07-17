//
//  ReportFilter.swift
//  SouleAce
//
//  Created by ideveloper7 on 22/02/24.
//

import Foundation

struct ReportFilter : Codable {
    let success : Bool?
    let data : [ReportFilterData]?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([ReportFilterData].self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct ReportFilterData : Codable {
    let name : String?
    let id : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
