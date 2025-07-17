//
//  ContactDetailViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/03/24.
//

import UIKit
import iOSDropDown

enum FiltersForContactDetail: String, CaseIterable {
    case name = "Name"
    case organization = "Organization"
    case designation = "Designation"
    case mobileNo = "Mobile No."
}

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterDropDown: DropDown!
    @IBOutlet weak var searchTextField: UITextField!
    
    var projectId = 0
    var filters = FiltersForContactDetail.allCases
    var selectedFilter = FiltersForContactDetail.name
    var name = ""
    var organization = ""
    var designation = ""
    var mobileNo = ""
    var contactDetails : [NgoContactData]?
    var projectName = ""
    var implementingPartner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        setupDropDowns()
        getPartnersData(isFilter: false)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.contactHeaderTableViewCell)
        tableView.register(cell: Cell.contactDetilsTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setupDropDowns() {
        
        filterDropDown.rowHeight = 40
        
        filterDropDown.listHeight = 220.0
        
        filterDropDown.isSearchEnable = false
        
        self.filterDropDown.optionArray = self.filters.map({ value in
            return value.rawValue
        })
        
        filterDropDown.didSelect { [self] selectedText, index, id in
            selectedFilter = filters[index]
        }
        
        filterDropDown.selectedIndex = 0
        filterDropDown.text = selectedFilter.rawValue
        filterDropDown.arrowColor = UIColor.gray
        filterDropDown.arrowSize = 15
    }

//    MARK: - Button Action
    
    @IBAction func searchAction(_ sender: Any) {
        getPartnersData(isFilter: true)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
