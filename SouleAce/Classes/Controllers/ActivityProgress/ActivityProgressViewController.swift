//
//  ActivityProgressViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/02/24.
//

import UIKit

class ActivityProgressViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var projectProgressList : [ProjectProgress]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    func setupUI() {
        getActivityProgressData()
        setupTableView()
        sideMenuDelegate = self
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.activityProgressTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    //    MARK: - Button Action
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
}

// MARK: - yearChangedDelegate

extension ActivityProgressViewController: yearChangedDelegate {
    
    func yearChanged() {
        getActivityProgressData()
    }
    
}
