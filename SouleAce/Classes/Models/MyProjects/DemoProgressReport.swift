//
//  File.swift
//  SouleAce
//
//  Created by ideveloper7 on 22/03/24.
//

import Foundation

struct DemoProgressReportData : Codable {
    let success : Bool?
    let complitiondata : ComplitionWiseData?
    let activityData : ActivityWiseData?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case complitiondata, activityData = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        complitiondata = try values.decodeIfPresent(ComplitionWiseData.self, forKey: .complitiondata)
        activityData = try values.decodeIfPresent(ActivityWiseData.self, forKey: .activityData)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }
}

struct ComplitionWiseData : Codable {
    let data : [ComplitionData]?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([ComplitionData].self, forKey: .data)
    }

}

struct ComplitionData : Codable {
    let monthYear : String?
    let perc_of_completion : Int?
    let remark : String?


    enum CodingKeys: String, CodingKey {

        case monthYear = "month-year"
        case perc_of_completion = "perc_of_completion"
        case remark = "remark"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        monthYear = try values.decodeIfPresent(String.self, forKey: .monthYear)
        perc_of_completion = try values.decodeIfPresent(Int.self, forKey: .perc_of_completion)
        remark = try values.decodeIfPresent(String.self, forKey: .remark)
    }

}

struct ActivityWiseData : Codable {
    let activityWise : ActivityWise?

    enum CodingKeys: String, CodingKey {

        case activityWise = "activity_wise"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activityWise = try values.decodeIfPresent(ActivityWise.self, forKey: .activityWise)
    }

}


struct ActivityWise : Codable {
    let blocks : Blocks?
    let progress_report : [ProgressReport]?

    enum CodingKeys: String, CodingKey {

        case blocks = "blocks"
        case progress_report = "progress_report"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        blocks = try values.decodeIfPresent(Blocks.self, forKey: .blocks)
        progress_report = try values.decodeIfPresent([ProgressReport].self, forKey: .progress_report)
    }

}


struct ProgressReport : Codable {
    let outcomeGoal : String?
    let activity : String?
    let financialYear : String?
    let deadlineDate : String?
    let status : String?
    let completionDateActual : String?
    let remarksAsOnDeadline : String?
    let completedStatus : String?
    let photosDocuments : [String]?
    let statusComment : String?

    enum CodingKeys: String, CodingKey {

        case outcomeGoal = "Outcome / Goal"
        case activity = "Activity"
        case financialYear = "Financial Year"
        case deadlineDate = "Deadline date"
        case status = "Status"
        case completionDateActual = "Completion Date(Actual)"
        case remarksAsOnDeadline = "Remarks as on deadline"
        case completedStatus = "Completed Status"
        case photosDocuments = "Photos/Documents"
        case statusComment = "Status Comment"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        outcomeGoal = try values.decodeIfPresent(String.self, forKey: .outcomeGoal)
        activity = try values.decodeIfPresent(String.self, forKey: .activity)
        financialYear = try values.decodeIfPresent(String.self, forKey: .financialYear)
        deadlineDate = try values.decodeIfPresent(String.self, forKey: .deadlineDate)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        completionDateActual = try values.decodeIfPresent(String.self, forKey: .completionDateActual)
        remarksAsOnDeadline = try values.decodeIfPresent(String.self, forKey: .remarksAsOnDeadline)
        completedStatus = try values.decodeIfPresent(String.self, forKey: .completedStatus)
        photosDocuments = try values.decodeIfPresent([String].self, forKey: .photosDocuments)
        statusComment = try values.decodeIfPresent(String.self, forKey: .statusComment)
    }

}


struct Blocks : Codable {
    let total_activity : Int?
    let wip : Int?
    let pending_activity : Int?
    let progress : Int?
    let completed : Int?
    let behind_schedule : Int?
    let ontime : Int?

    enum CodingKeys: String, CodingKey {

        case total_activity = "total_activity"
        case wip = "wip"
        case pending_activity = "pending_activity"
        case progress = "progress"
        case completed = "completed"
        case behind_schedule = "behind_schedule"
        case ontime = "ontime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_activity = try values.decodeIfPresent(Int.self, forKey: .total_activity)
        wip = try values.decodeIfPresent(Int.self, forKey: .wip)
        pending_activity = try values.decodeIfPresent(Int.self, forKey: .pending_activity)
        progress = try values.decodeIfPresent(Int.self, forKey: .progress)
        completed = try values.decodeIfPresent(Int.self, forKey: .completed)
        behind_schedule = try values.decodeIfPresent(Int.self, forKey: .behind_schedule)
        ontime = try values.decodeIfPresent(Int.self, forKey: .ontime)
    }

}

