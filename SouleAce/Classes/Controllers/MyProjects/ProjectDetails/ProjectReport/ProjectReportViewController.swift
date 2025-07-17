//
//  ProjectReportViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 27/03/24.
//

import UIKit

enum ProjectReport: String, CaseIterable {
    case monthly = "MONTHLY"
    case quarterly = "QUARTERLY"
    case halfyearly = "HALF YEARLY"
    case projectBudget = "YEARLY"
}

class ProjectReportViewController: UIViewController {
    
    @IBOutlet weak var reportCollectionView: UICollectionView!
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDetailBorderView: UIView!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    let projectReport = ProjectReport.allCases
    var selectedReported = ProjectReport.monthly
    var selectedIndex = 0
    var report : [ProjectReports]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        getProjectReports(type: "1")
        projectNameLabel.text = projectName
        implementingPartnerLabel.text = implementingPartner
        yearLabel.text = "Year " + selectedFinancialYear
        setupCollectionView()
        projectDetailBorderView.layer.cornerRadius = 12
        projectDetailBorderView.layer.borderWidth = 0.3
    }
    
    func setupCollectionView() {
        headerCollectionView.register(cell: Cell.segmentHeaderCollectionViewCell)
        
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        
        reportCollectionView.register(cell: Cell.reportCollectionViewCell)
        reportCollectionView.delegate = self
        reportCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        reportCollectionView!.collectionViewLayout = layout
        
        let layout1: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout1.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout1.scrollDirection = .horizontal
        layout1.minimumInteritemSpacing = 0
        layout1.minimumLineSpacing = 0
        headerCollectionView!.collectionViewLayout = layout1

    }
    
//    MARK: - Button Action
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
