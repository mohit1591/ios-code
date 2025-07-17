//
//  MyProjectDetailViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/02/24.
//

import UIKit

enum ProjectMenuListData: String, CaseIterable {
    case projectReport = "Project Report"
    case caseStudies = "Case Studies"
    case activities = "Activities"
    case documents = "Documents"
    case gallery = "Gallery"
    case contactDetails = "Contact Details"
    case projectBudget = "Project Budget"
    case budgetUtilization = "Budget Utilization"
    case progressReporting = "Progress Reporting"
    case monthlyReport = "Monthly Report"
    case projectOverview = "Project Overview"
    case demoProgressReport = "Demo Progress Report"
}

class ProjectDetailViewController: UIViewController {

    @IBOutlet weak var projectMenuCollectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var projectMenuCollectionView: UICollectionView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var themeName: UILabel!
    @IBOutlet weak var projectSummary: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var natureOfProjectLabel: UILabel!
    @IBOutlet weak var frequencyOfServicesLabel: UILabel!
    @IBOutlet weak var targetBeneficiariesLabel: UILabel!
    @IBOutlet weak var financialNatureLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var projectId = 0
    var projectDetails: ProjectDetails?
    var projectsdg : [String]?
    var projectMenu: [String]?
    var data: [ProjectMenulists]?
    var listOfProjectMenu = ProjectMenuListData.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = projectMenulists
//        data = projectMenulists.filter { value in
//            return value.access == 1
//        }
        
        let totalDataCount = data?.count ?? 0
        let numbofRowns = Int(ceil(Double(totalDataCount) / Double(3)))
        let collectionHeight = numbofRowns * 110
        projectMenuCollectionHeightConstraint.constant = CGFloat(collectionHeight)
        getProjectDetail()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.register(cell: Cell.sdgDashboardCollectionViewCell)
        projectMenuCollectionView.register(cell: Cell.projectMenuCollectionViewCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        projectMenuCollectionView.delegate = self
        projectMenuCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        projectMenuCollectionView!.collectionViewLayout = layout
        
        let layout1: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal
        collectionView!.collectionViewLayout = layout1
    }
    
    func moveToDocuments() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.projectDocumentVC) as? ProjectDocumentViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToContactDetail() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.contactDetailVC) as? ContactDetailViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToActivityScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.activityVC) as? ActivityViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToDemoProgressReportScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.demoProgressReportVC) as? DemoProgressReportViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToProjectBudgetScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.projectBudgetVC) as? ProjectBudgetViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            vc.corporateId = projectDetails?.corporateId ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToProjectOverviewScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.projectOverviewVC) as? ProjectOverviewViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToProjectReportGalleryScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.projectReportGalleryVC) as? ProjectReportGalleryViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToProjectReportScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.projectReportVC) as? ProjectReportViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveToProjectMonthlyReportScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.monthlyReportVC) as? MonthlyReportViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func moveToProgressReportingScreen() {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.progressReportingVC) as? ProgressReportingViewController {
            vc.projectName = projectDetails?.projectName ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectDetails?.ngoName ?? ""
            vc.projectId = projectId

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
// MARK: -   Button Acion
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
