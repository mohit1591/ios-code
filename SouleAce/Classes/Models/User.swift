//
//  User.swift
//  SouleAce
//
//  Created by ideveloper7 on 09/02/24.
//

import UIKit
import Foundation

struct User : Codable {
    let id : Int?
    let firstName : String?
    let lastName : String?
    let mobileNo : String?
    let profileImage : String?
    let userType : Int?
    let corporateName : String?
    let corporateLogo : String?
    let email : String?
    let projectCode : String?
    let isTNC : String?
    let tncDetails : String?
    let corporateId : Int?
//    let menulists : Menulists?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case mobileNo = "mobile_no"
        case profileImage = "profile_image"
        case userType = "user_type"
        case corporateName = "corporate_name"
        case corporateLogo = "corporate_logo"
        case email = "email"
        case projectCode = "project_code"
        case isTNC = "is_tnc"
        case tncDetails = "tnc_details"
        case corporateId = "corporate_id"
//        case menulists = "menulists"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        mobileNo = try values.decodeIfPresent(String.self, forKey: .mobileNo)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        userType = try values.decodeIfPresent(Int.self, forKey: .userType)
        corporateName = try values.decodeIfPresent(String.self, forKey: .corporateName)
        corporateLogo = try values.decodeIfPresent(String.self, forKey: .corporateLogo)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        projectCode = try values.decodeIfPresent(String.self, forKey: .projectCode)
        isTNC = try values.decodeIfPresent(String.self, forKey: .isTNC)
        tncDetails = try values.decodeIfPresent(String.self, forKey: .tncDetails)
        corporateId = try values.decodeIfPresent(Int.self, forKey: .corporateId)
//        menulists = try values.decodeIfPresent(Menulists.self, forKey: .menulists)
    }

}

//struct Menulists : Codable {
//    let menuBudgetVisible : Int?
//    let menuMyProjectsVisible : Int?
//    let menuProjectProgressVisible : Int?
//    let menuActivityProgressVisible : Int?
//    let menuImpPartnersVisible : Int?
//    let menuSdgVisible : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case menuBudgetVisible = "menu_budget_visible"
//        case menuMyProjectsVisible = "menu_my_projects_visible"
//        case menuProjectProgressVisible = "menu_project_progress_visible"
//        case menuActivityProgressVisible = "menu_activity_progress_visible"
//        case menuImpPartnersVisible = "menu_imp_partners_visible"
//        case menuSdgVisible = "menu_sdg_visible"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        menuBudgetVisible = try values.decodeIfPresent(Int.self, forKey: .menuBudgetVisible)
//        menuMyProjectsVisible = try values.decodeIfPresent(Int.self, forKey: .menuMyProjectsVisible)
//        menuProjectProgressVisible = try values.decodeIfPresent(Int.self, forKey: .menuProjectProgressVisible)
//        menuActivityProgressVisible = try values.decodeIfPresent(Int.self, forKey: .menuActivityProgressVisible)
//        menuImpPartnersVisible = try values.decodeIfPresent(Int.self, forKey: .menuImpPartnersVisible)
//        menuSdgVisible = try values.decodeIfPresent(Int.self, forKey: .menuSdgVisible)
//    }
//
//}
