//
//  AllUser.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import Foundation

struct AllUsersData : Codable {
    let success : Bool?
    let data : [AllUsers]?
    let has_more : Bool?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([AllUsers].self, forKey: .data)
        has_more = try values.decodeIfPresent(Bool.self, forKey: .has_more)
    }

}


struct AllUsers : Codable {
    let id : Int?
    let username : String?
    let user_type_title : String?
    let project_name : String?
    let first_name : String?
    let mobile_no : String?
    let user_status : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case username = "username"
        case user_type_title = "user_type_title"
        case project_name = "project_name"
        case first_name = "first_name"
        case mobile_no = "mobile_no"
        case user_status = "user_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        user_type_title = try values.decodeIfPresent(String.self, forKey: .user_type_title)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        mobile_no = try values.decodeIfPresent(String.self, forKey: .mobile_no)
        user_status = try values.decodeIfPresent(String.self, forKey: .user_status)
    }

}
