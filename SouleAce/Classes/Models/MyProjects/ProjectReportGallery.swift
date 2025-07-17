//
//  ProjectReportGallery.swift
//  SouleAce
//
//  Created by ideveloper1 on 26/03/24.
//

import Foundation

struct AlbumsData : Codable {
    let albums : [Albums]?

    enum CodingKeys: String, CodingKey {

        case albums = "albums"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        albums = try values.decodeIfPresent([Albums].self, forKey: .albums)
    }

}

struct Albums : Codable {
    let id : Int?
    let project_id : Int?
    let category_id : Int?
    let corporate_id : Int?
    let name : String?
    let description : String?
    let type : String?
    let file_count : Int?
    let created_at : String?
    let updated_at : String?
    let zone_id : Int?
    let financial_year_id : Int?
    let user_id : Int?
    let album_content : [AlbumContent]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case project_id = "project_id"
        case category_id = "category_id"
        case corporate_id = "corporate_id"
        case name = "name"
        case description = "description"
        case type = "type"
        case file_count = "file_count"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case zone_id = "zone_id"
        case financial_year_id = "financial_year_id"
        case user_id = "user_id"
        case album_content = "album_content"
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
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        zone_id = try values.decodeIfPresent(Int.self, forKey: .zone_id)
        financial_year_id = try values.decodeIfPresent(Int.self, forKey: .financial_year_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        album_content = try values.decodeIfPresent([AlbumContent].self, forKey: .album_content)
    }

}

struct AlbumContent : Codable {
    let id : Int?
    let content_title : String?
    let gallery_album_id : Int?
    let path : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case content_title = "content_title"
        case gallery_album_id = "gallery_album_id"
        case path = "path"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        content_title = try values.decodeIfPresent(String.self, forKey: .content_title)
        gallery_album_id = try values.decodeIfPresent(Int.self, forKey: .gallery_album_id)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

