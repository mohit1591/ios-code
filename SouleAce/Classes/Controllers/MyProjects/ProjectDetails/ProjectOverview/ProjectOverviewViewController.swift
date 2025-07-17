//
//  ProjectOverviewViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/03/24.
//

import UIKit

class ProjectOverviewViewController: UIViewController {

    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectDetailView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    var projectData : ProjectOverviewData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        projectNameLabel.text = projectName
        implementingPartnerLabel.text = implementingPartner
        getProjectOverviewData()
        setupTableView()
        projectDetailView.layer.cornerRadius = 12
        projectDetailView.layer.borderWidth = 0.3
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.projectBasicInfoTableViewCell)
        tableView.register(cell: Cell.projectTimeLineTableViewCell)
        tableView.register(cell: Cell.projectBudgetOverviewTableViewCell)
        tableView.register(cell: Cell.projectProgressReportTableViewCell)

        tableView.showsVerticalScrollIndicator = false
    }

    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

