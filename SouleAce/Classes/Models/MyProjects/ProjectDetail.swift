//
//  ProjectDetail.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/02/24.
//

import Foundation

struct ProjectDetailsObject : Codable {
    let success : Bool?
    let data : ProjectDetailsData?
//    let has_more : String?
    
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
        case data = "data"
//        case has_more = "has_more"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(ProjectDetailsData.self, forKey: .data)
//        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }
}

struct ProjectDetailsData : Codable {
    let projects : ProjectDetails?
    let sdg_data : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case projects = "projects"
        case sdg_data = "sdg_data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        projects = try values.decodeIfPresent(ProjectDetails.self, forKey: .projects)
        sdg_data = try values.decodeIfPresent([String].self, forKey: .sdg_data)
    }
}

struct ProjectDetails : Codable {
    let projectId : Int?
    let project_pId : Int?
    let corporateId : Int?
    let parent_projectId : Int?
    let ngoId : Int?
    let themeId : Int?
    let parent_themeId : Int?
    let proj_custom_code : String?
    let project_code : String?
    let projectName : String?
    let project_slug : String?
    let project_type : Int?
    let sdgIds : String?
    let project_summary : String?
    let project_image : String?
    let project_geographical_location : String?
    let budget_typeId : Int?
    let total_project_budget : Int?
    let target_beneficiaries : String?
    let financial_nature : String?
    let nature_serviceId : Int?
    let frequency_of_service : String?
    let project_duration : Int?
    let zoneId : Int?
    let project_start_date : String?
    let project_end_date : String?
    let project_other_fields_data : String?
    let beneficiary_formId : Int?
    let project_status : Int?
    let app_dashboard_label : String?
    let listing_label : String?
    let created_by : Int?
    let created_at : String?
    let updated_at : String?
    let updated_by : Int?
    let monitoring_label : String?
    let impact_label : String?
    let is_activity_freeze : Int?
    let activity_formId : Int?
//    let schedule_vii : Int?
    let is_localarea : Int?
    let is_mode_direct : Int?
    let is_ongoing : Int?
    let ben_target_male : Int?
    let ben_target_female : Int?
    let is_ben_bulk : Int?
    let parent_zoneId : Int?
    let activityName : String?
    let project_theme : String?
    let project_nature : String?
    let budget_type_month : String?
    let actual_spend : String?
    let actual_beneficiary : String?
    let mode_of_implementation : String?
//    let corporate_project_type_mapId : Int?
    let organization_type : String?
    let project_amns_title : String?
    let sub_partnerIds : String?
    let themeName : String?
    let ngoName : String?
    let states : String?
    let districts : String?
    let area : String?
    let project_progress : Int?
    let activity_progress : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case projectId = "project_id"
        case project_pId = "project_p_id"
        case corporateId = "corporate_id"
        case parent_projectId = "parent_project_id"
        case ngoId = "ngo_id"
        case themeId = "theme_id"
        case parent_themeId = "parent_theme_id"
        case proj_custom_code = "proj_custom_code"
        case project_code = "project_code"
        case projectName = "project_name"
        case project_slug = "project_slug"
        case project_type = "project_type"
        case sdgIds = "sdg_ids"
        case project_summary = "project_summary"
        case project_image = "project_image"
        case project_geographical_location = "project_geographical_location"
        case budget_typeId = "budget_type_id"
        case total_project_budget = "total_project_budget"
        case target_beneficiaries = "target_beneficiaries"
        case financial_nature = "financial_nature"
        case nature_serviceId = "nature_service_id"
        case frequency_of_service = "frequency_of_service"
        case project_duration = "project_duration"
        case zoneId = "zone_id"
        case project_start_date = "project_start_date"
        case project_end_date = "project_end_date"
        case project_other_fields_data = "project_other_fields_data"
        case beneficiary_formId = "beneficiary_form_id"
        case project_status = "project_status"
        case app_dashboard_label = "app_dashboard_label"
        case listing_label = "listing_label"
        case created_by = "created_by"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case updated_by = "updated_by"
        case monitoring_label = "monitoring_label"
        case impact_label = "impact_label"
        case is_activity_freeze = "is_activity_freeze"
        case activity_formId = "activity_form_id"
//        case schedule_vii = "schedule_vii"
        case is_localarea = "is_localarea"
        case is_mode_direct = "is_mode_direct"
        case is_ongoing = "is_ongoing"
        case ben_target_male = "ben_target_male"
        case ben_target_female = "ben_target_female"
        case is_ben_bulk = "is_ben_bulk"
        case parent_zoneId = "parent_zone_id"
        case activityName = "activity_name"
        case project_theme = "project_theme"
        case project_nature = "project_nature"
        case budget_type_month = "budget_type_month"
        case actual_spend = "actual_spend"
        case actual_beneficiary = "actual_beneficiary"
        case mode_of_implementation = "mode_of_implementation"
//        case corporate_project_type_mapId = "corporate_project_type_map_id"
        case organization_type = "organization_type"
        case project_amns_title = "project_amns_title"
        case sub_partnerIds = "sub_partner_ids"
        case themeName = "theme_name"
        case ngoName = "ngo_name"
        case states = "states"
        case districts = "districts"
        case area = "area"
        case project_progress = "project_progress"
        case activity_progress = "activity_progress"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        projectId = try values.decodeIfPresent(Int.self, forKey: .projectId)
        project_pId = try values.decodeIfPresent(Int.self, forKey: .project_pId)
        corporateId = try values.decodeIfPresent(Int.self, forKey: .corporateId)
        parent_projectId = try values.decodeIfPresent(Int.self, forKey: .parent_projectId)
        ngoId = try values.decodeIfPresent(Int.self, forKey: .ngoId)
        themeId = try values.decodeIfPresent(Int.self, forKey: .themeId)
        parent_themeId = try values.decodeIfPresent(Int.self, forKey: .parent_themeId)
        proj_custom_code = try values.decodeIfPresent(String.self, forKey: .proj_custom_code)
        project_code = try values.decodeIfPresent(String.self, forKey: .project_code)
        projectName = try values.decodeIfPresent(String.self, forKey: .projectName)
        project_slug = try values.decodeIfPresent(String.self, forKey: .project_slug)
        project_type = try values.decodeIfPresent(Int.self, forKey: .project_type)
        sdgIds = try values.decodeIfPresent(String.self, forKey: .sdgIds)
        project_summary = try values.decodeIfPresent(String.self, forKey: .project_summary)
        project_image = try values.decodeIfPresent(String.self, forKey: .project_image)
        project_geographical_location = try values.decodeIfPresent(String.self, forKey: .project_geographical_location)
        budget_typeId = try values.decodeIfPresent(Int.self, forKey: .budget_typeId)
        total_project_budget = try values.decodeIfPresent(Int.self, forKey: .total_project_budget)
        target_beneficiaries = try values.decodeIfPresent(String.self, forKey: .target_beneficiaries)
        financial_nature = try values.decodeIfPresent(String.self, forKey: .financial_nature)
        nature_serviceId = try values.decodeIfPresent(Int.self, forKey: .nature_serviceId)
        frequency_of_service = try values.decodeIfPresent(String.self, forKey: .frequency_of_service)
        project_duration = try values.decodeIfPresent(Int.self, forKey: .project_duration)
        zoneId = try values.decodeIfPresent(Int.self, forKey: .zoneId)
        project_start_date = try values.decodeIfPresent(String.self, forKey: .project_start_date)
        project_end_date = try values.decodeIfPresent(String.self, forKey: .project_end_date)
        project_other_fields_data = try values.decodeIfPresent(String.self, forKey: .project_other_fields_data)
        beneficiary_formId = try values.decodeIfPresent(Int.self, forKey: .beneficiary_formId)
        project_status = try values.decodeIfPresent(Int.self, forKey: .project_status)
        app_dashboard_label = try values.decodeIfPresent(String.self, forKey: .app_dashboard_label)
        listing_label = try values.decodeIfPresent(String.self, forKey: .listing_label)
        created_by = try values.decodeIfPresent(Int.self, forKey: .created_by)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        updated_by = try values.decodeIfPresent(Int.self, forKey: .updated_by)
        monitoring_label = try values.decodeIfPresent(String.self, forKey: .monitoring_label)
        impact_label = try values.decodeIfPresent(String.self, forKey: .impact_label)
        is_activity_freeze = try values.decodeIfPresent(Int.self, forKey: .is_activity_freeze)
        activity_formId = try values.decodeIfPresent(Int.self, forKey: .activity_formId)
//        schedule_vii = try values.decodeIfPresent(Int.self, forKey: .schedule_vii)
        is_localarea = try values.decodeIfPresent(Int.self, forKey: .is_localarea)
        is_mode_direct = try values.decodeIfPresent(Int.self, forKey: .is_mode_direct)
        is_ongoing = try values.decodeIfPresent(Int.self, forKey: .is_ongoing)
        ben_target_male = try values.decodeIfPresent(Int.self, forKey: .ben_target_male)
        ben_target_female = try values.decodeIfPresent(Int.self, forKey: .ben_target_female)
        is_ben_bulk = try values.decodeIfPresent(Int.self, forKey: .is_ben_bulk)
        parent_zoneId = try values.decodeIfPresent(Int.self, forKey: .parent_zoneId)
        activityName = try values.decodeIfPresent(String.self, forKey: .activityName)
        project_theme = try values.decodeIfPresent(String.self, forKey: .project_theme)
        project_nature = try values.decodeIfPresent(String.self, forKey: .project_nature)
        budget_type_month = try values.decodeIfPresent(String.self, forKey: .budget_type_month)
        actual_spend = try values.decodeIfPresent(String.self, forKey: .actual_spend)
        actual_beneficiary = try values.decodeIfPresent(String.self, forKey: .actual_beneficiary)
        mode_of_implementation = try values.decodeIfPresent(String.self, forKey: .mode_of_implementation)
//        corporate_project_type_mapId = try values.decodeIfPresent(Int.self, forKey: .corporate_project_type_mapId)
        organization_type = try values.decodeIfPresent(String.self, forKey: .organization_type)
        project_amns_title = try values.decodeIfPresent(String.self, forKey: .project_amns_title)
        sub_partnerIds = try values.decodeIfPresent(String.self, forKey: .sub_partnerIds)
        themeName = try values.decodeIfPresent(String.self, forKey: .themeName)
        ngoName = try values.decodeIfPresent(String.self, forKey: .ngoName)
        states = try values.decodeIfPresent(String.self, forKey: .states)
        districts = try values.decodeIfPresent(String.self, forKey: .districts)
        area = try values.decodeIfPresent(String.self, forKey: .area)
        project_progress = try values.decodeIfPresent(Int.self, forKey: .project_progress)
        activity_progress = try values.decodeIfPresent(Int.self, forKey: .activity_progress)
    }
    
}
