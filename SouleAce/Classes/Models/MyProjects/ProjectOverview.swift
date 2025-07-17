//
//  ProjectOverview.swift
//  SouleAce
//
//  Created by ideveloper7 on 02/04/24.
//

import Foundation

struct ProjectOverviewData : Codable {
    let disbursed_budget : String?
    let utilized_budget : String?
    let unutilized_budget : String?
    let total_budget : String?
    let planned_budget : String?
    let basic_info : BasicInfo?
    let project_timeline : ProjectTimeline?
    let theme_data : ThemeData?
    let sdg_data : [SdgData]?
    let progress_reports : ProgressReports?

    enum CodingKeys: String, CodingKey {

        case disbursed_budget = "disbursed_budget"
        case utilized_budget = "utilized_budget"
        case unutilized_budget = "unutilized_budget"
        case total_budget = "total_budget"
        case planned_budget = "planned_budget"
        case basic_info = "basic_info"
        case project_timeline = "project_timeline"
        case theme_data = "theme_data"
        case sdg_data = "sdg_data"
        case progress_reports = "progress_reports"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        disbursed_budget = try values.decodeIfPresent(String.self, forKey: .disbursed_budget)
        utilized_budget = try values.decodeIfPresent(String.self, forKey: .utilized_budget)
        unutilized_budget = try values.decodeIfPresent(String.self, forKey: .unutilized_budget)
        total_budget = try values.decodeIfPresent(String.self, forKey: .total_budget)
        planned_budget = try values.decodeIfPresent(String.self, forKey: .planned_budget)
        basic_info = try values.decodeIfPresent(BasicInfo.self, forKey: .basic_info)
        project_timeline = try values.decodeIfPresent(ProjectTimeline.self, forKey: .project_timeline)
        theme_data = try values.decodeIfPresent(ThemeData.self, forKey: .theme_data)
        sdg_data = try values.decodeIfPresent([SdgData].self, forKey: .sdg_data)
        progress_reports = try values.decodeIfPresent(ProgressReports.self, forKey: .progress_reports)
    }

}

struct BasicInfo : Codable {
    let project_name : String?
    let implementingPartner : String?
    let projectTheme : String?
    let modeOfImplementation : String?
    let activityName : String?
    let projectCode : String?
    let projectBeneficiaries : String?
    let projectSummary : String?
    let state : String?
    let district : String?

    enum CodingKeys: String, CodingKey {

        case project_name = "project_name"
        case implementingPartner = "Implementing Partner"
        case projectTheme = "Project Theme"
        case modeOfImplementation = "Mode of Implementation"
        case activityName = "Activity Name"
        case projectCode = "Project Code"
        case projectBeneficiaries = "Project Beneficiaries"
        case projectSummary = "Project Summary"
        case state = "State"
        case district = "District"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        implementingPartner = try values.decodeIfPresent(String.self, forKey: .implementingPartner)
        projectTheme = try values.decodeIfPresent(String.self, forKey: .projectTheme)
        modeOfImplementation = try values.decodeIfPresent(String.self, forKey: .modeOfImplementation)
        activityName = try values.decodeIfPresent(String.self, forKey: .activityName)
        projectCode = try values.decodeIfPresent(String.self, forKey: .projectCode)
        projectBeneficiaries = try values.decodeIfPresent(String.self, forKey: .projectBeneficiaries)
        projectSummary = try values.decodeIfPresent(String.self, forKey: .projectSummary)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        district = try values.decodeIfPresent(String.self, forKey: .district)
    }

}

struct ProgressReports : Codable {
    let total_activity : Int?
    let wip : Int?
    let pending_activity : Int?
    let progress : Int?
    let completed : Int?
    let behind_schedule : Int?
    let ontime : Int?

    enum CodingKeys: String, CodingKey {

        case total_activity = "total_activity"
        case wip = "wip"
        case pending_activity = "pending_activity"
        case progress = "progress"
        case completed = "completed"
        case behind_schedule = "behind_schedule"
        case ontime = "ontime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_activity = try values.decodeIfPresent(Int.self, forKey: .total_activity)
        wip = try values.decodeIfPresent(Int.self, forKey: .wip)
        pending_activity = try values.decodeIfPresent(Int.self, forKey: .pending_activity)
        progress = try values.decodeIfPresent(Int.self, forKey: .progress)
        completed = try values.decodeIfPresent(Int.self, forKey: .completed)
        behind_schedule = try values.decodeIfPresent(Int.self, forKey: .behind_schedule)
        ontime = try values.decodeIfPresent(Int.self, forKey: .ontime)
    }

}

struct ProjectTimeline : Codable {
    let project_start_date : String?
    let project_duration : String?
    let project_end_date : String?
    let project_status : String?

    enum CodingKeys: String, CodingKey {

        case project_start_date = "project_start_date"
        case project_duration = "project_duration"
        case project_end_date = "project_end_date"
        case project_status = "project_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_start_date = try values.decodeIfPresent(String.self, forKey: .project_start_date)
        project_duration = try values.decodeIfPresent(String.self, forKey: .project_duration)
        project_end_date = try values.decodeIfPresent(String.self, forKey: .project_end_date)
        project_status = try values.decodeIfPresent(String.self, forKey: .project_status)
    }

}


struct SdgData : Codable {
    let sdg_id : Int?
    let sdg_name : String?
    let sdg_img : String?
    let sdg_desc : String?
    let parent_id : Int?

    enum CodingKeys: String, CodingKey {

        case sdg_id = "sdg_id"
        case sdg_name = "sdg_name"
        case sdg_img = "sdg_img"
        case sdg_desc = "sdg_desc"
        case parent_id = "parent_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sdg_id = try values.decodeIfPresent(Int.self, forKey: .sdg_id)
        sdg_name = try values.decodeIfPresent(String.self, forKey: .sdg_name)
        sdg_img = try values.decodeIfPresent(String.self, forKey: .sdg_img)
        sdg_desc = try values.decodeIfPresent(String.self, forKey: .sdg_desc)
        parent_id = try values.decodeIfPresent(Int.self, forKey: .parent_id)
    }

}

struct ThemeData : Codable {
    let project_id : Int?
    let project_p_id : Int?
    let corporate_id : Int?
    let parent_project_id : Int?
    let ngo_id : Int?
    let theme_id : Int?
    let parent_theme_id : Int?
    let proj_custom_code : String?
    let project_code : String?
    let project_name : String?
    let project_slug : String?
    let project_type : Int?
    let sdg_ids : String?
    let project_summary : String?
    let project_image : String?
    let project_geographical_location : String?
    let budget_type_id : Int?
    let total_project_budget : Int?
    let target_beneficiaries : String?
    let financial_nature : String?
    let nature_service_id : Int?
    let frequency_of_service : String?
    let project_duration : Int?
    let zone_id : Int?
    let project_start_date : String?
    let project_end_date : String?
    let project_other_fields_data : String?
    let beneficiary_form_id : Int?
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
    let activity_form_id : Int?
    let schedule_vii : String?
    let is_localarea : Int?
    let is_mode_direct : Int?
    let is_ongoing : Int?
    let ben_target_male : Int?
    let ben_target_female : Int?
    let is_ben_bulk : Int?
    let parent_zone_id : Int?
    let activity_name : String?
    let project_theme : String?
    let project_nature : String?
    let budget_type_month : String?
    let actual_spend : String?
    let actual_beneficiary : String?
    let mode_of_implementation : String?
    let corporate_project_type_map_id : Int?
    let organization_type : String?
    let project_amns_title : String?
    let sub_partner_ids : String?
    let name : String?
    let ngo_name : String?

    enum CodingKeys: String, CodingKey {

        case project_id = "project_id"
        case project_p_id = "project_p_id"
        case corporate_id = "corporate_id"
        case parent_project_id = "parent_project_id"
        case ngo_id = "ngo_id"
        case theme_id = "theme_id"
        case parent_theme_id = "parent_theme_id"
        case proj_custom_code = "proj_custom_code"
        case project_code = "project_code"
        case project_name = "project_name"
        case project_slug = "project_slug"
        case project_type = "project_type"
        case sdg_ids = "sdg_ids"
        case project_summary = "project_summary"
        case project_image = "project_image"
        case project_geographical_location = "project_geographical_location"
        case budget_type_id = "budget_type_id"
        case total_project_budget = "total_project_budget"
        case target_beneficiaries = "target_beneficiaries"
        case financial_nature = "financial_nature"
        case nature_service_id = "nature_service_id"
        case frequency_of_service = "frequency_of_service"
        case project_duration = "project_duration"
        case zone_id = "zone_id"
        case project_start_date = "project_start_date"
        case project_end_date = "project_end_date"
        case project_other_fields_data = "project_other_fields_data"
        case beneficiary_form_id = "beneficiary_form_id"
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
        case activity_form_id = "activity_form_id"
        case schedule_vii = "schedule_vii"
        case is_localarea = "is_localarea"
        case is_mode_direct = "is_mode_direct"
        case is_ongoing = "is_ongoing"
        case ben_target_male = "ben_target_male"
        case ben_target_female = "ben_target_female"
        case is_ben_bulk = "is_ben_bulk"
        case parent_zone_id = "parent_zone_id"
        case activity_name = "activity_name"
        case project_theme = "project_theme"
        case project_nature = "project_nature"
        case budget_type_month = "budget_type_month"
        case actual_spend = "actual_spend"
        case actual_beneficiary = "actual_beneficiary"
        case mode_of_implementation = "mode_of_implementation"
        case corporate_project_type_map_id = "corporate_project_type_map_id"
        case organization_type = "organization_type"
        case project_amns_title = "project_amns_title"
        case sub_partner_ids = "sub_partner_ids"
        case name = "name"
        case ngo_name = "ngo_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        project_p_id = try values.decodeIfPresent(Int.self, forKey: .project_p_id)
        corporate_id = try values.decodeIfPresent(Int.self, forKey: .corporate_id)
        parent_project_id = try values.decodeIfPresent(Int.self, forKey: .parent_project_id)
        ngo_id = try values.decodeIfPresent(Int.self, forKey: .ngo_id)
        theme_id = try values.decodeIfPresent(Int.self, forKey: .theme_id)
        parent_theme_id = try values.decodeIfPresent(Int.self, forKey: .parent_theme_id)
        proj_custom_code = try values.decodeIfPresent(String.self, forKey: .proj_custom_code)
        project_code = try values.decodeIfPresent(String.self, forKey: .project_code)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        project_slug = try values.decodeIfPresent(String.self, forKey: .project_slug)
        project_type = try values.decodeIfPresent(Int.self, forKey: .project_type)
        sdg_ids = try values.decodeIfPresent(String.self, forKey: .sdg_ids)
        project_summary = try values.decodeIfPresent(String.self, forKey: .project_summary)
        project_image = try values.decodeIfPresent(String.self, forKey: .project_image)
        project_geographical_location = try values.decodeIfPresent(String.self, forKey: .project_geographical_location)
        budget_type_id = try values.decodeIfPresent(Int.self, forKey: .budget_type_id)
        total_project_budget = try values.decodeIfPresent(Int.self, forKey: .total_project_budget)
        target_beneficiaries = try values.decodeIfPresent(String.self, forKey: .target_beneficiaries)
        financial_nature = try values.decodeIfPresent(String.self, forKey: .financial_nature)
        nature_service_id = try values.decodeIfPresent(Int.self, forKey: .nature_service_id)
        frequency_of_service = try values.decodeIfPresent(String.self, forKey: .frequency_of_service)
        project_duration = try values.decodeIfPresent(Int.self, forKey: .project_duration)
        zone_id = try values.decodeIfPresent(Int.self, forKey: .zone_id)
        project_start_date = try values.decodeIfPresent(String.self, forKey: .project_start_date)
        project_end_date = try values.decodeIfPresent(String.self, forKey: .project_end_date)
        project_other_fields_data = try values.decodeIfPresent(String.self, forKey: .project_other_fields_data)
        beneficiary_form_id = try values.decodeIfPresent(Int.self, forKey: .beneficiary_form_id)
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
        activity_form_id = try values.decodeIfPresent(Int.self, forKey: .activity_form_id)
        schedule_vii = try values.decodeIfPresent(String.self, forKey: .schedule_vii)
        is_localarea = try values.decodeIfPresent(Int.self, forKey: .is_localarea)
        is_mode_direct = try values.decodeIfPresent(Int.self, forKey: .is_mode_direct)
        is_ongoing = try values.decodeIfPresent(Int.self, forKey: .is_ongoing)
        ben_target_male = try values.decodeIfPresent(Int.self, forKey: .ben_target_male)
        ben_target_female = try values.decodeIfPresent(Int.self, forKey: .ben_target_female)
        is_ben_bulk = try values.decodeIfPresent(Int.self, forKey: .is_ben_bulk)
        parent_zone_id = try values.decodeIfPresent(Int.self, forKey: .parent_zone_id)
        activity_name = try values.decodeIfPresent(String.self, forKey: .activity_name)
        project_theme = try values.decodeIfPresent(String.self, forKey: .project_theme)
        project_nature = try values.decodeIfPresent(String.self, forKey: .project_nature)
        budget_type_month = try values.decodeIfPresent(String.self, forKey: .budget_type_month)
        actual_spend = try values.decodeIfPresent(String.self, forKey: .actual_spend)
        actual_beneficiary = try values.decodeIfPresent(String.self, forKey: .actual_beneficiary)
        mode_of_implementation = try values.decodeIfPresent(String.self, forKey: .mode_of_implementation)
        corporate_project_type_map_id = try values.decodeIfPresent(Int.self, forKey: .corporate_project_type_map_id)
        organization_type = try values.decodeIfPresent(String.self, forKey: .organization_type)
        project_amns_title = try values.decodeIfPresent(String.self, forKey: .project_amns_title)
        sub_partner_ids = try values.decodeIfPresent(String.self, forKey: .sub_partner_ids)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        ngo_name = try values.decodeIfPresent(String.self, forKey: .ngo_name)
    }

}

