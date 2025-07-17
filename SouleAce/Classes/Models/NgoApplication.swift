//
//  NgoApplication.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import Foundation

struct NgoApplicationData : Codable {
    let success : Bool?
    let data : OrgaionzationData?
    let cert_12a : Cert12a?
    let cert_80g : Cert80g?
    let cert_fcra : CertFcra?
    let annualReportsData : [AnnualReportsData]?
    let auditReportsData : [AuditReportsData]?
    let itrReportData : [ItrReportData]?
    let ndata : Ndata?
    let personnelData : PersonnelData?
    let proposalDetails : ProposalDetails?
    let has_more : String?

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
        case cert_12a = "cert_12a"
        case cert_80g = "cert_80g"
        case cert_fcra = "cert_fcra"
        case annualReportsData = "annual_reports_data"
        case auditReportsData = "audit_reports_data"
        case itrReportData = "itr_report_data"
        case ndata = "ndata"
        case personnelData = "personnel_data"
        case proposalDetails = "proposal_details"
        case has_more = "has_more"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(OrgaionzationData.self, forKey: .data)
        cert_12a = try values.decodeIfPresent(Cert12a.self, forKey: .cert_12a)
        cert_80g = try values.decodeIfPresent(Cert80g.self, forKey: .cert_80g)
        cert_fcra = try values.decodeIfPresent(CertFcra.self, forKey: .cert_fcra)
        annualReportsData = try values.decodeIfPresent([AnnualReportsData].self, forKey: .annualReportsData)
        auditReportsData = try values.decodeIfPresent([AuditReportsData].self, forKey: .auditReportsData)
        itrReportData = try values.decodeIfPresent([ItrReportData].self, forKey: .itrReportData)
        ndata = try values.decodeIfPresent(Ndata.self, forKey: .ndata)
        personnelData = try values.decodeIfPresent(PersonnelData.self, forKey: .personnelData)
        proposalDetails = try values.decodeIfPresent(ProposalDetails.self, forKey: .proposalDetails)
        has_more = try values.decodeIfPresent(String.self, forKey: .has_more)
    }

}

struct CertFcra : Codable {
    let status : String?
    let registration_number : String?
    let registration_certificate_file : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case registration_number = "registration_number"
        case registration_certificate_file = "registration_certificate_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        registration_number = try values.decodeIfPresent(String.self, forKey: .registration_number)
        registration_certificate_file = try values.decodeIfPresent(String.self, forKey: .registration_certificate_file)
    }

}

struct Cert80g : Codable {
    let status : String?
    let registration_number : String?
    let registration_certificate_file : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case registration_number = "registration_number"
        case registration_certificate_file = "registration_certificate_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        registration_number = try values.decodeIfPresent(String.self, forKey: .registration_number)
        registration_certificate_file = try values.decodeIfPresent(String.self, forKey: .registration_certificate_file)
    }

}

struct Cert12a : Codable {
    let status : String?
    let registration_number : String?
    let registration_certificate_file : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case registration_number = "registration_number"
        case registration_certificate_file = "registration_certificate_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        registration_number = try values.decodeIfPresent(String.self, forKey: .registration_number)
        registration_certificate_file = try values.decodeIfPresent(String.self, forKey: .registration_certificate_file)
    }

}


struct AnnualReportsData : Codable {
    let financial_year_id : String?
    let annual_reports_file : String?

    enum CodingKeys: String, CodingKey {
        case financial_year_id = "financial_year_id"
        case annual_reports_file = "annual_reports_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        financial_year_id = try values.decodeIfPresent(String.self, forKey: .financial_year_id)
        annual_reports_file = try values.decodeIfPresent(String.self, forKey: .annual_reports_file)
    }

}

struct Ndata : Codable {
    let organisation_structure : String?
    let mOA_AOA_Trust_deed : String?
    let cOI_Scoiety_Trust_registration_certificate : String?
    let copy_of_pan : String?
    let csr_form_1 : String?
    let copy_of_cancelled_cheque_leaf : String?
    let mca_registration_Letter : String?

    enum CodingKeys: String, CodingKey {

        case organisation_structure = "organisation_structure"
        case mOA_AOA_Trust_deed = "MOA_AOA_Trust_deed"
        case cOI_Scoiety_Trust_registration_certificate = "COI_Scoiety_Trust_registration_certificate"
        case copy_of_pan = "copy_of_pan"
        case csr_form_1 = "csr_form_1"
        case copy_of_cancelled_cheque_leaf = "copy_of_cancelled_cheque_leaf"
        case mca_registration_Letter = "mca_registration_Letter"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        organisation_structure = try values.decodeIfPresent(String.self, forKey: .organisation_structure)
        mOA_AOA_Trust_deed = try values.decodeIfPresent(String.self, forKey: .mOA_AOA_Trust_deed)
        cOI_Scoiety_Trust_registration_certificate = try values.decodeIfPresent(String.self, forKey: .cOI_Scoiety_Trust_registration_certificate)
        copy_of_pan = try values.decodeIfPresent(String.self, forKey: .copy_of_pan)
        csr_form_1 = try values.decodeIfPresent(String.self, forKey: .csr_form_1)
        copy_of_cancelled_cheque_leaf = try values.decodeIfPresent(String.self, forKey: .copy_of_cancelled_cheque_leaf)
        mca_registration_Letter = try values.decodeIfPresent(String.self, forKey: .mca_registration_Letter)
    }

}

struct OrgaionzationData : Codable {
    let ngo_name : String?
    let organisation_type : String?
    let pan_no : String?
    let csr_reg_no : String?
    let registration_no : String?
    let registration_year : String?
    let darpan_number : String?
    let gst_number : String?
    let csr_form_1 : String?
    let copy_of_pan : String?
    let moa_deed : String?
    let registration_certificate : String?
    let professional_tax_certificate : String?
    let anti_bribery_certificate : String?
    let fact_sheet : String?

    enum CodingKeys: String, CodingKey {

        case ngo_name = "ngo_name"
        case organisation_type = "organisation_type"
        case pan_no = "pan_no"
        case csr_reg_no = "csr_reg_no"
        case registration_no = "registration_no"
        case registration_year = "registration_year"
        case darpan_number = "darpan_number"
        case gst_number = "gst_number"
        case csr_form_1 = "csr_form_1"
        case copy_of_pan = "copy_of_pan"
        case moa_deed = "moa_deed"
        case registration_certificate = "registration_certificate"
        case professional_tax_certificate = "professional_tax_certificate"
        case anti_bribery_certificate = "anti_bribery_certificate"
        case fact_sheet = "fact_sheet"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ngo_name = try values.decodeIfPresent(String.self, forKey: .ngo_name)
        organisation_type = try values.decodeIfPresent(String.self, forKey: .organisation_type)
        pan_no = try values.decodeIfPresent(String.self, forKey: .pan_no)
        csr_reg_no = try values.decodeIfPresent(String.self, forKey: .csr_reg_no)
        registration_no = try values.decodeIfPresent(String.self, forKey: .registration_no)
        registration_year = try values.decodeIfPresent(String.self, forKey: .registration_year)
        darpan_number = try values.decodeIfPresent(String.self, forKey: .darpan_number)
        gst_number = try values.decodeIfPresent(String.self, forKey: .gst_number)
        csr_form_1 = try values.decodeIfPresent(String.self, forKey: .csr_form_1)
        copy_of_pan = try values.decodeIfPresent(String.self, forKey: .copy_of_pan)
        moa_deed = try values.decodeIfPresent(String.self, forKey: .moa_deed)
        registration_certificate = try values.decodeIfPresent(String.self, forKey: .registration_certificate)
        professional_tax_certificate = try values.decodeIfPresent(String.self, forKey: .professional_tax_certificate)
        anti_bribery_certificate = try values.decodeIfPresent(String.self, forKey: .anti_bribery_certificate)
        fact_sheet = try values.decodeIfPresent(String.self, forKey: .fact_sheet)
    }

}

struct AuditReportsData : Codable {
    let financial_year_id : String?
    let audit_report_file : String?

    enum CodingKeys: String, CodingKey {

        case financial_year_id = "financial_year_id"
        case audit_report_file = "audit_report_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        financial_year_id = try values.decodeIfPresent(String.self, forKey: .financial_year_id)
        audit_report_file = try values.decodeIfPresent(String.self, forKey: .audit_report_file)
    }

}

struct ProposalDetails : Codable {
    let project_concept : String?
    let thrust_area : String?
    let project_duration : String?
    let budget : String?
    let actual_budget : String?
    let states : String?
    let target_group : String?
    let target_group_others : String?
    let expected_beneficiaries : String?
    let project_brief : String?
    let project_brief_file : String?
    let potential_impact : String?
    let financial_proposal_file : String?
    let technical_proposal_file : String?
    let additional_comments : String?

    enum CodingKeys: String, CodingKey {

        case project_concept = "project_concept"
        case thrust_area = "thrust_area"
        case project_duration = "project_duration"
        case budget = "budget"
        case actual_budget = "actual_budget"
        case states = "states"
        case target_group = "target_group"
        case target_group_others = "target_group_others"
        case expected_beneficiaries = "expected_beneficiaries"
        case project_brief = "project_brief"
        case project_brief_file = "project_brief_file"
        case potential_impact = "potential_impact"
        case financial_proposal_file = "financial_proposal_file"
        case technical_proposal_file = "technical_proposal_file"
        case additional_comments = "additional_comments"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        project_concept = try values.decodeIfPresent(String.self, forKey: .project_concept)
        thrust_area = try values.decodeIfPresent(String.self, forKey: .thrust_area)
        project_duration = try values.decodeIfPresent(String.self, forKey: .project_duration)
        budget = try values.decodeIfPresent(String.self, forKey: .budget)
        actual_budget = try values.decodeIfPresent(String.self, forKey: .actual_budget)
        states = try values.decodeIfPresent(String.self, forKey: .states)
        target_group = try values.decodeIfPresent(String.self, forKey: .target_group)
        target_group_others = try values.decodeIfPresent(String.self, forKey: .target_group_others)
        expected_beneficiaries = try values.decodeIfPresent(String.self, forKey: .expected_beneficiaries)
        project_brief = try values.decodeIfPresent(String.self, forKey: .project_brief)
        project_brief_file = try values.decodeIfPresent(String.self, forKey: .project_brief_file)
        potential_impact = try values.decodeIfPresent(String.self, forKey: .potential_impact)
        financial_proposal_file = try values.decodeIfPresent(String.self, forKey: .financial_proposal_file)
        technical_proposal_file = try values.decodeIfPresent(String.self, forKey: .technical_proposal_file)
        additional_comments = try values.decodeIfPresent(String.self, forKey: .additional_comments)
    }
}

struct PersonnelData : Codable {
//    let key_personnel_personnel : String?
//    let ngo_ngo_key_personnel_name_personnel_name : String?
//    let ngo_ngo_key_personnel_email_personnel_email : String?
//    let ngo_ngo_key_personnel_no_personnel_no : String?
    let organisation_structure : String?
    let organisation_structure_file : String?
    let head_office : String?
    let states_operating : String?
    let thrust_areas : String?
    let organisation_vision_mission : String?
    let additional_comments_application : String?
    let keyPersonnel: String?
    let ngoKeyPersonnelName: String?
    let ngoKeyPersonnelEmail: String?
    let ngoKeyPersonnelNo: String?

    enum CodingKeys: String, CodingKey {

        case keyPersonnel = "key_personnel"
        case ngoKeyPersonnelName = "ngo_key_personnel_name"
        case ngoKeyPersonnelEmail = "ngo_key_personnel_email"
        case ngoKeyPersonnelNo = "ngo_key_personnel_no"
        case organisation_structure = "organisation_structure"
        case organisation_structure_file = "organisation_structure_file"
        case head_office = "head_office"
        case states_operating = "states_operating"
        case thrust_areas = "thrust_areas"
        case organisation_vision_mission = "organisation_vision_mission"
        case additional_comments_application = "additional_comments_application"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        keyPersonnel = try values.decodeIfPresent(String.self, forKey: .keyPersonnel)
        ngoKeyPersonnelName = try values.decodeIfPresent(String.self, forKey: .ngoKeyPersonnelName)
        ngoKeyPersonnelEmail = try values.decodeIfPresent(String.self, forKey: .ngoKeyPersonnelEmail)
        ngoKeyPersonnelNo = try values.decodeIfPresent(String.self, forKey: .ngoKeyPersonnelNo)
        organisation_structure = try values.decodeIfPresent(String.self, forKey: .organisation_structure)
        organisation_structure_file = try values.decodeIfPresent(String.self, forKey: .organisation_structure_file)
        head_office = try values.decodeIfPresent(String.self, forKey: .head_office)
        states_operating = try values.decodeIfPresent(String.self, forKey: .states_operating)
        thrust_areas = try values.decodeIfPresent(String.self, forKey: .thrust_areas)
        organisation_vision_mission = try values.decodeIfPresent(String.self, forKey: .organisation_vision_mission)
        additional_comments_application = try values.decodeIfPresent(String.self, forKey: .additional_comments_application)
    }
}


struct ItrReportData : Codable {
    let financial_year_id : String?
    let itr_report_file : String?

    enum CodingKeys: String, CodingKey {

        case financial_year_id = "financial_year_id"
        case itr_report_file = "itr_report_file"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        financial_year_id = try values.decodeIfPresent(String.self, forKey: .financial_year_id)
        itr_report_file = try values.decodeIfPresent(String.self, forKey: .itr_report_file)
    }

}
