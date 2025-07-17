//
//  DemoProgressReportViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/03/24.
//

import UIKit

class DemoProgressReportViewController: UIViewController {

    @IBOutlet weak var projectDetailBorderView: UIView!
    @IBOutlet weak var completionWiseSelectedView: UIView!
    @IBOutlet weak var activityWiseSelectedView: UIView!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    var isActivitySelected: Bool = false
    var tabId = 1
    var complitiondata : [ComplitionData]?
    var blocks : Blocks?
    var progressReport : [ProgressReport]?
    var indexsOfData: [Int] = []

    var showSection: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        
        projectNameLabel.text = projectName
        implementingPartnerLabel.text = implementingPartner
        yearLabel.text = "Year " + selectedFinancialYear
        
        projectDetailBorderView.layer.cornerRadius = 12
        projectDetailBorderView.layer.borderWidth = 0.3
        
        activitySelected()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.progressReportingDetailTableViewCell)
        tableView.register(cell: Cell.activityProgressReportTableViewCell)
        tableView.register(cell: Cell.completionProgressReportTableViewCell)
        tableView.estimatedSectionHeaderHeight = 0

        tableView.register(UINib(nibName: "ActivityWiseHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ActivityWiseHeaderTableViewCell")
        tableView.showsVerticalScrollIndicator = false
    }
    
    func completionSelected() {
        completionWiseSelectedView.isHidden = false
        activityWiseSelectedView.isHidden = true
        isActivitySelected = false
        tabId = 2
        getDemoComplitionProgressReportData()
        tableView.reloadData()
    }
    
    func activitySelected() {
        completionWiseSelectedView.isHidden = true
        activityWiseSelectedView.isHidden = false
        isActivitySelected = true
        tabId = 1
        getDemoActivityProgressReportData()
        tableView.reloadData()
    }

//    MARK: - Button Action
    
    @IBAction func completionWiseAction(_ sender: UIButton) {
        completionSelected()
    }
    
    @IBAction func activityWiseAction(_ sender: UIButton) {
        activitySelected()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
