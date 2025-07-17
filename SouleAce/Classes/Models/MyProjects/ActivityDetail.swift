//
//  ActivityDetail.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation

struct GetallPhotos : Codable {
    let activityPhoto : String?

    enum CodingKeys: String, CodingKey {

        case activityPhoto = "activity_photo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activityPhoto = try values.decodeIfPresent(String.self, forKey: .activityPhoto)
    }

}


struct ActivityDetailsData : Codable {
    let activity_details : ActivityDetails?
    let getallPhotos : [GetallPhotos]?

    enum CodingKeys: String, CodingKey {

        case activity_details = "activity_details"
        case getallPhotos = "getallPhotos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activity_details = try values.decodeIfPresent(ActivityDetails.self, forKey: .activity_details)
        getallPhotos = try values.decodeIfPresent([GetallPhotos].self, forKey: .getallPhotos)
    }

}


struct ActivityDetails : Codable {
    let activity_id : Int?
    let project_id : Int?
    let ngo_id : Int?
    let corporate_id : Int?
    let type : Int?
    let title : String?
    let start_date : String?
    let start_time : String?
    let end_date : String?
    let end_time : String?
    let description : String?
    let meeting_location : String?
    let activity_status : Int?
    let no_of_people : Int?
    let is_deleted : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case activity_id = "activity_id"
        case project_id = "project_id"
        case ngo_id = "ngo_id"
        case corporate_id = "corporate_id"
        case type = "type"
        case title = "title"
        case start_date = "start_date"
        case start_time = "start_time"
        case end_date = "end_date"
        case end_time = "end_time"
        case description = "description"
        case meeting_location = "meeting_location"
        case activity_status = "activity_status"
        case no_of_people = "no_of_people"
        case is_deleted = "is_deleted"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activity_id = try values.decodeIfPresent(Int.self, forKey: .activity_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        meeting_location = try values.decodeIfPresent(String.self, forKey: .meeting_location)
        activity_status = try values.decodeIfPresent(Int.self, forKey: .activity_status)
        no_of_people = try values.decodeIfPresent(Int.self, forKey: .no_of_people)
        is_deleted = try values.decodeIfPresent(Int.self, forKey: .is_deleted)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
