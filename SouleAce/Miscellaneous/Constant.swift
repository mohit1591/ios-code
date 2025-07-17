//
//  Constant.swift
//  TasteMaker
//
//  Created by ideveloper1 on 19/03/21.
//

import UIKit

let kHeaderHeight = ScreenFrame.screenHeight * 0.4
let screenWidth: CGFloat = UIScreen.main.bounds.width
let screenHeight: CGFloat = UIScreen.main.bounds.height

// MARK: enumration
struct ScreenFrame {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
}

struct NotificationCenterText {
}

struct StoryBoard {
    static let main = "Main"
    static let authorization = "Authorization"
    static let projects = "Projects"
}

struct Controller {
    static let loginVC = "LoginViewController"
    static let dashboardVC = "DashboardViewController"
    static let sideMenuVC = "SideMenuViewController"
    static let myProjectsVC = "MyProjectsViewController"
    static let myProjectDetailVC = "MyProjectDetailViewController"
    static let sdgVC = "SDGViewController"
    static let sdgDetailVC = "SDGDetailViewController"
    static let reportVC = "ReportViewController"
    static let galleryVC = "GalleryViewController"
    static let galleryDetailVC = "GalleryDetailViewController"
    static let budgetVC = "BudgetViewController"
    static let activityProgressVC = "ActivityProgressViewController"
    static let ngoVC = "NGOViewController"
    static let ngoApplicationVC = "NGOApplicationViewController"
    static let csrKnowledgeBaseVC = "CSRKnowledgeBaseViewController"
    static let implementingPartnersVC = "ImplementingPartnersViewController"
    static let implementingPartnersDetailVC = "ImplementingPartnersDetailViewController"
    static let allUsersVC = "AllUsersViewController"
    static let companyProfileVC = "CompanyProfileViewController"
    static let projectDocumentVC = "ProjectDocumentViewController"
    static let folderViewController = "FolderViewController"
    static let contactDetailVC = "ContactDetailViewController"
    static let activityVC = "ActivityViewController"
    static let activityDetailVC = "ActivityDetailViewController"
    static let progressReportingVC = "ProgressReportingViewController"
    static let demoProgressReportVC = "DemoProgressReportViewController"
    static let projectReportGalleryVC = "ProjectReportGalleryViewController"
    static let projectReportVC = "ProjectReportViewController"
    static let monthlyReportVC = "MonthlyReportViewController"
    static let projectBudgetVC = "ProjectBudgetViewController"
    static let projectOverviewVC = "ProjectOverviewViewController"
}

// MARK: Cell
struct Cell {
    static let sideMenuCell = "SideMenuTableViewCell"
    static let dashBoardTableCell = "DashboardTableViewCell"
    static let dashboardSDGSCell = "DashboardSDGSCell"
    static let dashboardCollectionCell = "DashBoardCollectionViewCell"
    static let sdgDashboardCollectionViewCell = "SDGDashboardCollectionViewCell"
    static let myProjectsTableViewCell = "MyProjectsTableViewCell"
    static let sdgCollectionViewCell = "SDGCollectionViewCell"
    static let projectMenuCollectionViewCell = "ProjectMenuCollectionViewCell"
    static let sdgDetailTableViewCell = "SDGDetailTableViewCell"
    static let reportCollectionViewCell = "ReportCollectionViewCell"
    static let galleryTableViewCell = "GalleryTableViewCell"
    static let galleryDetailCollectionViewCell = "GalleryDetailCollectionViewCell"
    static let previewCollectionViewCell = "PreviewCollectionViewCell"
    static let budgetTableViewCell = "BudgetTableViewCell"
    static let budgetDetailTableViewCell = "BudgetDetailTableViewCell"
    static let activityProgressTableViewCell = "ActivityProgressTableViewCell"
    static let rfpTableViewCell = "RFPTableViewCell"
    static let ngoHeaderTableViewCell = "NgoHeaderTableViewCell"
    static let ngoTableViewCell = "NgoTableViewCell"
    static let organaizationDetailTableViewCell = "OrganaizationDetailTableViewCell"
    static let isRegisterTableViewCell = "IsRegisterTableViewCell"
    static let proposalDetailsTableViewCell = "ProposalDetailsTableViewCell"
    static let filterTableViewCell = "FilterTableViewCell"
    static let csrKnowledgeBaseTableViewCell = "CSRKnowledgeBaseTableViewCell"
    static let implementingPartnersTableViewCell = "ImplementingPartnersTableViewCell"
    static let partnersDetailTableViewCell = "PartnersDetailTableViewCell"
    static let allProjectTableViewCell = "AllProjectTableViewCell"
    static let keyManagmentTableViewCell = "KeyManagmentTableViewCell"
    static let photosTableViewCell = "PhotosTableViewCell"
    static let allUsersTableViewCell = "AllUsersTableViewCell"
    static let companyBasicInfoTableViewCell = "CompanyBasicInfoTableViewCell"
    static let documentDetailCollectionViewCell = "DocumentDetailCollectionViewCell"
    static let contactHeaderTableViewCell = "ContactHeaderTableViewCell"
    static let contactDetilsTableViewCell = "ContactDetilsTableViewCell"
    static let activityTableViewCell = "ActivityTableViewCell"
    static let searchTableViewCell = "SearchTableViewCell"
    static let meetingDetailTableViewCell = "MeetingDetailTableViewCell"
    static let progressReportingDetailTableViewCell = "ProgressReportingDetailTableViewCell"
    static let progressReportListTableViewCell = "ProgressReportListTableViewCell"
    static let completionProgressReportTableViewCell = "CompletionProgressReportTableViewCell"
    static let activityProgressReportTableViewCell = "ActivityProgressReportTableViewCell"
    static let sdgDemoProgressCollectionViewCell = "SDGDemoProgressCollectionViewCell"
    static let SDGDemoProgressCV = "SDGDemoProgressCV"
    static let segmentHeaderCollectionViewCell = "SegmentHeaderCollectionViewCell"
    static let monthlyQuartelyReportTableViewCell = "MonthlyQuartelyReportTableViewCell"
    static let projectBudgetTableViewCell = "ProjectBudgetTableViewCell"
    static let projectBudgetHeaderTableViewCell = "ProjectBudgetHeaderTableViewCell"
    static let projectBudgetListTableViewCell = "ProjectBudgetListTableViewCell"
    static let projectBasicInfoTableViewCell = "ProjectBasicInfoTableViewCell"
    static let projectTimeLineTableViewCell = "ProjectTimeLineTableViewCell"
    static let projectBudgetOverviewTableViewCell = "ProjectBudgetOverviewTableViewCell"
    static let projectProgressReportTableViewCell = "ProjectProgressReportTableViewCell"
}

// MARK: SideMenu
var selectedFinancialId = 0
var financialYearList = [FinancialYearData]()
var selectedFinancialYear = ""
var menuShowDeials: MenuShowDeials?
var menuLists : [Menulists]?
var projectMenulists = [ProjectMenulists]()
var visibleMenuOptions: [String] = []
var encryptionKey = "EvowNF5EzTDTypUaeGIL7tkGfU9GmyiWShAjybHJp+o="

// MARK: Header
struct Header {
}

// MARK: String
struct Text {
}

struct Key {
}

struct Message {
}

struct Color {
}
