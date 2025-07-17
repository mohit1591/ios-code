//
//  DashboardViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 09/02/24.
//

import UIKit

protocol yearChangedDelegate: AnyObject {
    func yearChanged()
}

enum DashboardList: String, CaseIterable {
    case projectSummary
    case beneficaryInformation
    case projectLocation
    case projectBudget
    case projectActivityDetails
    case projectThematicAreas
    case impacts
    case sdgData
}

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let dashboardEnumDataList = DashboardList.allCases
    var projectSummary: ProjectSummary?
    var beneficiaryInformation : BeneficiaryInformation?
    var projectLocations : ProjectLocations?
    var projectBudget : ProjectBudget?
    var activity : Activity?
    var thematicAreas : [Thematic_areas]?
    var sdgData : [Sdg_data]?
    var impacts : [ImpactValue]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
     func setupUI() {
        navigationController?.navigationBar.isHidden = true
        setupTableView()
         if selectedFinancialId == 0 {
            getFinancialYearList()
            getVisibleMenuList()
        } else {
            getDashboardData(financeYearId: selectedFinancialId)
        }
         sideMenuDelegate = self
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.dashBoardTableCell)
        tableView.register(cell: Cell.dashboardSDGSCell)
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
    }
    
    //     MARK: - Button Action
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
}

// MARK: - SideMenuDelegate

extension DashboardViewController: yearChangedDelegate {
    func yearChanged() {
        getDashboardData(financeYearId: selectedFinancialId)
    }
}
