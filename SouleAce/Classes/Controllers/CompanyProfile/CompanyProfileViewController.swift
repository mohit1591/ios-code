//
//  CompanyProfileViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import UIKit

class CompanyProfileViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var titleSection = ["Organization Basic Information", "Organization Admin Information"]
    var basicInfoShow = false
    var adminInfoShow = false
    var companyDetail : CompanyProfileDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        sideMenuDelegate = self
        getCompanyProfile()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.companyBasicInfoTableViewCell)
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderTableViewCell")
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
}

extension CompanyProfileViewController: yearChangedDelegate {
    
    func yearChanged() {
    }
    
}
