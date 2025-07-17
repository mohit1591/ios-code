//
//  CSRKnowledgeBaseViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 05/03/24.
//

import UIKit

class CSRKnowledgeBaseViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var csrData: [CSRData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        sideMenuDelegate = self
        getCSRData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.csrKnowledgeBaseTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
}

extension CSRKnowledgeBaseViewController: yearChangedDelegate {
    
    func yearChanged() {
    }
    
}
