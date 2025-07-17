//
//  MenuList.swift
//  SouleAce
//
//  Created by ideveloper7 on 23/02/24.
//

import Foundation

struct MenuShowDeials : Codable {
    let menuLists : [Menulists]?
    let projectMenulists : [ProjectMenulists]?

    enum CodingKeys: String, CodingKey {

        case menuLists = "menulists_"
        case projectMenulists = "project_menulists_"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        menuLists = try values.decodeIfPresent([Menulists].self, forKey: .menuLists)
        projectMenulists = try values.decodeIfPresent([ProjectMenulists].self, forKey: .projectMenulists)
    }

}

struct Menulists : Codable {
    let module_name : String?
    let access : Int?
    let module_id : Int?

    enum CodingKeys: String, CodingKey {

        case module_name = "module_name"
        case access = "access"
        case module_id = "module_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        module_name = try values.decodeIfPresent(String.self, forKey: .module_name)
        access = try values.decodeIfPresent(Int.self, forKey: .access)
        module_id = try values.decodeIfPresent(Int.self, forKey: .module_id)
    }

}

struct ProjectMenulists : Codable {
    let module_name : String?
    let access : Int?
    let module_id : Int?

    enum CodingKeys: String, CodingKey {
        case module_name = "module_name"
        case access = "access"
        case module_id = "module_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        module_name = try values.decodeIfPresent(String.self, forKey: .module_name)
        access = try values.decodeIfPresent(Int.self, forKey: .access)
        module_id = try values.decodeIfPresent(Int.self, forKey: .module_id)
    }

}
