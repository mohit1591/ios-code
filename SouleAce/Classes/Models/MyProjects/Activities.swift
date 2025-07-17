//
//  Activities.swift
//  SouleAce
//
//  Created by ideveloper7 on 18/03/24.
//

import Foundation

struct ActivitiesData : Codable {
    let success : Bool?
    let data : [ActivitiesDetails]?
    let has_more : Bool?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([ActivitiesDetails].self, forKey: .data)
        has_more = try values.decodeIfPresent(Bool.self, forKey: .has_more)
    }

}

struct ActivitiesDetails : Codable {
    let activity_id : Int?
    let meetings_id : Int?
    let project_id : Int?
    let title : String?
    let start_date : String?
    let start_time : String?
    let end_date : String?
    let end_time : String?
    let description : String?
    let meeting_location : String?

    enum CodingKeys: String, CodingKey {

        case activity_id = "activity_id"
        case meetings_id = "meetings_id"
        case project_id = "project_id"
        case title = "title"
        case start_date = "start_date"
        case start_time = "start_time"
        case end_date = "end_date"
        case end_time = "end_time"
        case description = "description"
        case meeting_location = "meeting_location"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activity_id = try values.decodeIfPresent(Int.self, forKey: .activity_id)
        meetings_id = try values.decodeIfPresent(Int.self, forKey: .meetings_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        meeting_location = try values.decodeIfPresent(String.self, forKey: .meeting_location)
    }

}
