//
//  Report.swift
//  SouleAce
//
//  Created by ideveloper7 on 23/02/24.
//

import Foundation

struct Report : Codable {
    let success : Bool?
    let data : [ReportData]?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([ReportData].self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct ReportData : Codable {
    let report_id : Int?
    let project_id : Int?
    let report_category : Int?
    let corporate_id : Int?
    let report_file_name : String?
    let report_title : String?
    let created_at : String?
    let report_file : String?

    enum CodingKeys: String, CodingKey {

        case report_id = "report_id"
        case project_id = "project_id"
        case report_category = "report_category"
        case corporate_id = "corporate_id"
        case report_file_name = "report_file_name"
        case report_title = "report_title"
        case created_at = "created_at"
        case report_file = "report_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report_id = try values.decodeIfPresent(Int.self, forKey: .report_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        report_category = try values.decodeIfPresent(Int.self, forKey: .report_category)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
        report_file_name = try values.decodeIfPresent(String.self, forKey: .report_file_name)
        report_title = try values.decodeIfPresent(String.self, forKey: .report_title)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        report_file = try values.decodeIfPresent(String.self, forKey: .report_file)
    }

}
