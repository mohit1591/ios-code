//
//  Gallery.swift
//  SouleAce
//
//  Created by ideveloper7 on 26/02/24.
//

import Foundation

struct GalleryModel : Codable {
    let success : Bool?
    let data : [GalleryData]?
    let has_more : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([GalleryData].self, forKey: .data)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct GalleryData : Codable {
    let id : Int?
    let project_id : Int?
    let category_id : Int?
    let corporate_id : Int?
    let name : String?
    let description : String?
    let type : String?
    let file_count : Int?
    let path : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case project_id = "project_id"
        case category_id = "category_id"
        case corporate_id = "corporate_id"
        case name = "name"
        case description = "description"
        case type = "type"
        case file_count = "file_count"
        case path = "path"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        file_count = try values.decodeIfPresent(Int.self, forKey: .file_count)
        path = try values.decodeIfPresent(String.self, forKey: .path)
    }

}
