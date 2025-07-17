//
//  Document.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/03/24.
//

import Foundation

//struct DocumentsData : Codable {
//    let success : Bool?
//    let data : [DocumentsDetails]?
//    let has_more : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case success = "success"
//        case data = "data"
//        case has_more = "has_more"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        success = try values.decodeIfPresent(Bool.self, forKey: .success)
//        data = try values.decodeIfPresent([DocumentsDetails].self, forKey: .data)
//        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
//    }
//
//}

struct DocumentsDetails : Codable {
    let document_id : Int?
    let project_id : Int?
    let title : String?
    let type : String?
    let path : String?

    enum CodingKeys: String, CodingKey {

        case document_id = "document_id"
        case project_id = "project_id"
        case title = "title"
        case type = "type"
        case path = "path"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        document_id = try values.decodeIfPresent(Int.self, forKey: .document_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        path = try values.decodeIfPresent(String.self, forKey: .path)
    }

}
