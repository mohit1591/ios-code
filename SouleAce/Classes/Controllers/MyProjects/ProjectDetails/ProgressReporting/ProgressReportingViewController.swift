//
//  ProgressReportingViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import UIKit

class ProgressReportingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var projectDetailBorderView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    var isTrue: Bool = false
    var progress : ProgressData?
    var headerValues : [HeaderValues]?
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
        
        getProgressReportingData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.progressReportingDetailTableViewCell)
        tableView.register(cell: Cell.progressReportListTableViewCell)
        tableView.estimatedSectionHeaderHeight = 0
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderTableViewCell")
        tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
