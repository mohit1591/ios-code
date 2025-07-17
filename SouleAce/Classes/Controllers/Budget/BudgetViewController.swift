//
//  BudgetViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/02/24.
//

import UIKit

class BudgetViewController: BaseViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var budgetData: BudgetData?
    var projectBudgetData : [ProjectBudgetData]?
    var yearBudgetDetails : [Fdata]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupUI() {
        getBudgetDetails()
        sideMenuDelegate = self
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.budgetTableViewCell)
        tableView.register(cell: Cell.budgetDetailTableViewCell)
        
        tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func sideMenuAction(_ sender: Any) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
}

// MARK: - yearChangedDelegate

extension BudgetViewController: yearChangedDelegate {
    
    func yearChanged() {
        getBudgetDetails()
    }

}
