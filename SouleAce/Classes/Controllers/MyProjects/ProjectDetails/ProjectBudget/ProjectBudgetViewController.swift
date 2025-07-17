//
//  ProjectBudgetViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/03/24.
//

import UIKit

class ProjectBudgetViewController: UIViewController {

    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectDetailView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
    var corporateId = 0
    
    var fdata : [Fdata]?
    var projectBudgetData : [ProjectBudgetData]?
    var projectBudgetValue : [ProjectBudgetValue]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        projectNameLabel.text = projectName
        implementingPartnerLabel.text = implementingPartner
        getBudgetDetails()
        setupTableView()
        projectDetailView.layer.cornerRadius = 12
        projectDetailView.layer.borderWidth = 0.3
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.projectBudgetTableViewCell)
        tableView.register(cell: Cell.projectBudgetHeaderTableViewCell)
        tableView.register(cell: Cell.projectBudgetListTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
//    MARK: - Button Action

    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}



