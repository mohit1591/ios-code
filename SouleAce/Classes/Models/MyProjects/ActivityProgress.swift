//
//  ActivityProgress.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/02/24.
//

import Foundation

struct ProjectProgressData : Codable {
    let project_progress : [ProjectProgress]?

    enum CodingKeys: String, CodingKey {

        case project_progress = "project_progress"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_progress = try values.decodeIfPresent([ProjectProgress].self, forKey: .project_progress)
    }

}

struct ProjectProgress : Codable {
    let project_name : String?
    let tot : Int?
    let project_type : String?
    let project_id : Int?
    let progress : Int?
    let yet_to_start : Int?
    let wip : Int?
    let completed : Int?
    let ontime : Int?
    let behindsch : Int?
    let approved : Int?
    let implementingPartner : String?

    enum CodingKeys: String, CodingKey {

        case project_name = "project_name"
        case tot = "tot"
        case project_type = "project_type"
        case project_id = "project_id"
        case progress = "progress"
        case yet_to_start = "yet_to_start"
        case wip = "wip"
        case completed = "completed"
        case ontime = "ontime"
        case behindsch = "behindsch"
        case approved = "approved"
        case implementingPartner = "implementing_partner"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        tot = try values.decodeIfPresent(Int.self, forKey: .tot)
        project_type = try values.decodeIfPresent(String.self, forKey: .project_type)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        progress = try values.decodeIfPresent(Int.self, forKey: .progress)
        yet_to_start = try values.decodeIfPresent(Int.self, forKey: .yet_to_start)
        wip = try values.decodeIfPresent(Int.self, forKey: .wip)
        completed = try values.decodeIfPresent(Int.self, forKey: .completed)
        ontime = try values.decodeIfPresent(Int.self, forKey: .ontime)
        behindsch = try values.decodeIfPresent(Int.self, forKey: .behindsch)
        approved = try values.decodeIfPresent(Int.self, forKey: .approved)
        implementingPartner = try values.decodeIfPresent(String.self, forKey: .implementingPartner)
    }

}
