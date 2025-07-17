//
//  ProjectMonthlyReport.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/03/24.
//

import Foundation

struct ProjectMonthlyData : Codable {
    let title : String?
    let month1 : String?
    let month2 : String?
    let month3 : String?
    let achievements : String?
    let target : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case month1 = "month_1"
        case month2 = "month_2"
        case month3 = "month_3"
        case target = "target"
        case achievements = "achievements"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        month1 = try values.decodeIfPresent(String.self, forKey: .month1)
        month2 = try values.decodeIfPresent(String.self, forKey: .month2)
        month3 = try values.decodeIfPresent(String.self, forKey: .month3)
        achievements = try values.decodeIfPresent(String.self, forKey: .achievements)
        target = try values.decodeIfPresent(String.self, forKey: .target)
    }

}
