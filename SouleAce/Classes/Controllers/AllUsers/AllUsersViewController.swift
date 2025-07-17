//
//  AllUsersViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import UIKit
import iOSDropDown

enum FiltersForAllUsers: String, CaseIterable {
    case userName = "User Name"
    case userId = "User Id"
    case mobileNo = "Mobile No."
    case projectName = "Project Name"
}

class AllUsersViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dropDownTextField: DropDown!
    @IBOutlet weak var searchUserTextField: UITextField!
    
    var filters = FiltersForAllUsers.allCases
    var selectedFilter = FiltersForAllUsers.userName
    var userId = ""
    var userName = ""
    var mobileNo = ""
    var projectName = ""
    var allUser: [AllUsers]?
    var allUserData: AllUsersData?
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        sideMenuDelegate = self
        getPartnersData(isFilter: false)
        setupDropDowns()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.allUsersTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setupDropDowns() {
        
        dropDownTextField.rowHeight = 40
        
        dropDownTextField.listHeight = 220.0
        
        dropDownTextField.isSearchEnable = false
        
        self.dropDownTextField.optionArray = self.filters.map({ value in
            return value.rawValue
        })
        
        dropDownTextField.didSelect { [self] selectedText, index, id in
            selectedFilter = filters[index]
        }
        
        dropDownTextField.selectedIndex = 0
        dropDownTextField.text = selectedFilter.rawValue
        dropDownTextField.arrowColor = UIColor.gray
        dropDownTextField.arrowSize = 15
    }
    
    @IBAction func searchAction(_ sender: Any) {
        currentPage = 1
        getPartnersData(isFilter: true)
    }
    
    @IBAction func sideMenuActio(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
}

extension AllUsersViewController: yearChangedDelegate {
    
    func yearChanged() {
    }
    
}
