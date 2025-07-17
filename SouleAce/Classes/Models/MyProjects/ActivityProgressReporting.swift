//
//  ActivityProgressReporting.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/03/24.
//

import Foundation

struct ActivityProgressReportingData : Codable {
    let progress : ProgressData?
    let headerValues : [HeaderValues]?

    enum CodingKeys: String, CodingKey {

        case progress = "progress"
        case headerValues = "header_values"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        progress = try values.decodeIfPresent(ProgressData.self, forKey: .progress)
        headerValues = try values.decodeIfPresent([HeaderValues].self, forKey: .headerValues)
    }

}

struct HeaderValues : Codable {
    let outcome : String?
    let output : String?
    let activity : String?
    let pONumber : String?
    let baselineValue : String?
    let status : String?
    let financialYear : String?
    let statusComment : String?
    let performanceIndicator : String?
    let unitOfMeasurement : String?
    let projectProgress  : Int?
    let deadlineDate : String?
    let completionDateActual : String?
    let categoryOfTask : String?
    let remarksAsOnDeadline : String?
    let completedStatus : String?
    let photosDocuments : String?
    let totalTarget : Int?
    let achieved : Int?
    let actualProgress  : Int?
    let remarksFromNGO : String?
    let reviewDateFromCorporate : String?
    let remarksFromCorporate : String?
    let allocatedBudget : Int?
    let spentAmount : Int?
    let unspentAmount : Int?
    let utilizationCertificatePDFUpload : String?

    enum CodingKeys: String, CodingKey {

        case outcome = "Outcome"
        case output = "Output"
        case activity = "Activity"
        case pONumber = "PO number"
        case baselineValue = "Baseline value"
        case status = "Status"
        case financialYear = "Financial Year"
        case statusComment = "Status Comment"
        case performanceIndicator = "Performance Indicator"
        case unitOfMeasurement = "Unit of Measurement"
        case projectProgress  = "Project Progress "
        case deadlineDate = "Deadline date"
        case completionDateActual = "Completion Date(Actual)"
        case categoryOfTask = "Category of Task"
        case remarksAsOnDeadline = "Remarks as on deadline"
        case completedStatus = "Completed Status"
        case photosDocuments = "Photos/Documents"
        case totalTarget = "Total Target"
        case achieved = "Achieved"
        case actualProgress  = "Actual Progress "
        case remarksFromNGO = "Remarks from NGO"
        case reviewDateFromCorporate = "Review Date (from corporate)"
        case remarksFromCorporate = "Remarks(from corporate)"
        case allocatedBudget = "Allocated Budget"
        case spentAmount = "Spent Amount"
        case unspentAmount = "Unspent amount"
        case utilizationCertificatePDFUpload = "Utilization certificate(PDF upload)"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        outcome = try values.decodeIfPresent(String.self, forKey: .outcome)
        output = try values.decodeIfPresent(String.self, forKey: .output)
        activity = try values.decodeIfPresent(String.self, forKey: .activity)
        pONumber = try values.decodeIfPresent(String.self, forKey: .pONumber)
        baselineValue = try values.decodeIfPresent(String.self, forKey: .baselineValue)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        financialYear = try values.decodeIfPresent(String.self, forKey: .financialYear)
        statusComment = try values.decodeIfPresent(String.self, forKey: .statusComment)
        performanceIndicator = try values.decodeIfPresent(String.self, forKey: .performanceIndicator)
        unitOfMeasurement = try values.decodeIfPresent(String.self, forKey: .unitOfMeasurement)
        projectProgress  = try values.decodeIfPresent(Int.self, forKey: .projectProgress)
        deadlineDate = try values.decodeIfPresent(String.self, forKey: .deadlineDate)
        completionDateActual = try values.decodeIfPresent(String.self, forKey: .completionDateActual)
        categoryOfTask = try values.decodeIfPresent(String.self, forKey: .categoryOfTask)
        remarksAsOnDeadline = try values.decodeIfPresent(String.self, forKey: .remarksAsOnDeadline)
        completedStatus = try values.decodeIfPresent(String.self, forKey: .completedStatus)
        photosDocuments = try values.decodeIfPresent(String.self, forKey: .photosDocuments)
        totalTarget = try values.decodeIfPresent(Int.self, forKey: .totalTarget)
        achieved = try values.decodeIfPresent(Int.self, forKey: .achieved)
        actualProgress  = try values.decodeIfPresent(Int.self, forKey: .actualProgress )
        remarksFromNGO = try values.decodeIfPresent(String.self, forKey: .remarksFromNGO)
        reviewDateFromCorporate = try values.decodeIfPresent(String.self, forKey: .reviewDateFromCorporate)
        remarksFromCorporate = try values.decodeIfPresent(String.self, forKey: .remarksFromCorporate)
        allocatedBudget = try values.decodeIfPresent(Int.self, forKey: .allocatedBudget)
        spentAmount = try values.decodeIfPresent(Int.self, forKey: .spentAmount)
        unspentAmount = try values.decodeIfPresent(Int.self, forKey: .unspentAmount)
        utilizationCertificatePDFUpload = try values.decodeIfPresent(String.self, forKey: .utilizationCertificatePDFUpload)
    }

}

struct ProgressData : Codable {
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
