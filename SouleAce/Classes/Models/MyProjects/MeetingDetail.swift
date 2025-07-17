//
//  MeetingDetail.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation

struct MeetingPeople : Codable {
    let title : String?
    let name : String?
    let phone_no : String?
    let email_id : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case name = "name"
        case phone_no = "phone_no"
        case email_id = "email_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phone_no = try values.decodeIfPresent(String.self, forKey: .phone_no)
        email_id = try values.decodeIfPresent(String.self, forKey: .email_id)
    }

}

struct MeetingDetailData : Codable {
    let no_of_people : Int?
    let meetingPeople : [MeetingPeople]?

    enum CodingKeys: String, CodingKey {

        case no_of_people = "no_of_people"
        case meetingPeople = "meeting_prople"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        no_of_people = try values.decodeIfPresent(Int.self, forKey: .no_of_people)
        meetingPeople = try values.decodeIfPresent([MeetingPeople].self, forKey: .meetingPeople)
    }

}
