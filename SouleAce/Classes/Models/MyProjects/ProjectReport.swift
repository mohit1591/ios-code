//
//  ProjectReport.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation

struct ProjectReportData : Codable {
    let report : [ProjectReports]?

    enum CodingKeys: String, CodingKey {

        case report = "report"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report = try values.decodeIfPresent([ProjectReports].self, forKey: .report)
    }

}

struct ProjectReports : Codable {
    let report_id : Int?
    let project_id : Int?
    let report_title : String?
    let report_file : String?
    let report_category : Int?
    let report_sub_type : Int?
    let report_type : Int?
    let file_type : String?
    let created_at : String?
    let project_code : String?
    let project_name : String?
    let approve_status : Int?

    enum CodingKeys: String, CodingKey {

        case report_id = "report_id"
        case project_id = "project_id"
        case report_title = "report_title"
        case report_file = "report_file"
        case report_category = "report_category"
        case report_sub_type = "report_sub_type"
        case report_type = "report_type"
        case file_type = "file_type"
        case created_at = "created_at"
        case project_code = "project_code"
        case project_name = "project_name"
        case approve_status = "approve_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report_id = try values.decodeIfPresent(Int.self, forKey: .report_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        report_title = try values.decodeIfPresent(String.self, forKey: .report_title)
        report_file = try values.decodeIfPresent(String.self, forKey: .report_file)
        report_category = try values.decodeIfPresent(Int.self, forKey: .report_category)
        report_sub_type = try values.decodeIfPresent(Int.self, forKey: .report_sub_type)
        report_type = try values.decodeIfPresent(Int.self, forKey: .report_type)
        file_type = try values.decodeIfPresent(String.self, forKey: .file_type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        project_code = try values.decodeIfPresent(String.self, forKey: .project_code)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        approve_status = try values.decodeIfPresent(Int.self, forKey: .approve_status)
    }

}
