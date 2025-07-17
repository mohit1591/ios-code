//
//  MonthlyReportViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/03/24.
//

import UIKit
import iOSDropDown

enum MonthlyReport: String, CaseIterable {
    case q1 = "Q1"
    case q2 = "Q2"
    case q3 = "Q3"
    case q4 = "Q4"
    case overall = "OVERAll"
}

class MonthlyReportViewController: UIViewController {
    
    @IBOutlet weak var yearDropDown: DropDown!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var projectDetailBorderView: UIView!
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    var monthlyReport = MonthlyReport.allCases
    var selectedReport = MonthlyReport.q1
    var selectedIndex = 0
    var reportData: [ProjectMonthlyData]?
    var selectedYearId = 0
    var selectedType = "1"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        projectNameLabel.text = projectName
        implementingPartnerLabel.text = implementingPartner
        setupDropDown()
        setupCollectionView()
        setupTableView()
        projectDetailBorderView.layer.cornerRadius = 12
        projectDetailBorderView.layer.borderWidth = 0.3
    }
    
    func setupCollectionView() {
        headerCollectionView.register(cell: Cell.segmentHeaderCollectionViewCell)
        
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        headerCollectionView!.collectionViewLayout = layout
    }
    
    func setupDropDown() {
        yearDropDown.rowHeight = 40
        yearDropDown.listHeight = 220
        yearDropDown.optionArray = financialYearList.map({ value in
            return value.financialYear ?? ""
        })
        yearDropDown.optionIds = financialYearList.map({ value in
            return value.financialYearId ?? 0
        })
        yearDropDown.didSelect { [self] selectedText, index, id in
            yearDropDown.text = selectedText
            selectedYearId = id
            if selectedReport == MonthlyReport.overall {
                getProjectOverallReports()
            } else {
                getProjectMonthlyReports()
            }
        }
        yearDropDown.isSearchEnable = false
        yearDropDown.selectedIndex = 0
    
        yearDropDown.text = financialYearList.first?.financialYear
        selectedYearId = financialYearList.first?.financialYearId ?? 0
        yearDropDown.arrowSize = 12
        yearDropDown.arrowColor = UIColor.gray
        
        getProjectMonthlyReports()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.monthlyQuartelyReportTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
//    MARK: - Button Action
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
