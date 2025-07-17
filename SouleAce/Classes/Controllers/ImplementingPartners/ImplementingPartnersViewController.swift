//
//  ImplementingPartnersViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import UIKit
import iOSDropDown

enum FiltersForPartners: String, CaseIterable {
    case ngoName = "NGO Name"
    case registrationNo = "Registration No."
    case panNo = "Pan No."
    case contactPerson = "Contact Person"
    case contactNo = "Contact No."
}

class ImplementingPartnersViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var implementDropDown: DropDown!
    
    var partnersData : [Ngos]?
    var filters = FiltersForPartners.allCases
    var ngoName = ""
    var registrationNo = ""
    var panNo = ""
    var contactPerson = ""
    var contactNo = ""
    var selectedFilter = FiltersForPartners.ngoName
    
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
    
    func setupDropDowns() {
        
        implementDropDown.rowHeight = 40
        
        implementDropDown.listHeight = 220.0
        implementDropDown.checkMarkEnabled = false
        implementDropDown.isSearchEnable = false
        
        self.implementDropDown.optionArray = self.filters.map({ value in
            return value.rawValue
        })
        
        implementDropDown.didSelect { [self] selectedText, index, id in
            selectedFilter = filters[index]
        }
        
        implementDropDown.selectedIndex = 0
        implementDropDown.text = selectedFilter.rawValue
        implementDropDown.arrowColor = UIColor.gray
        implementDropDown.arrowSize = 15
    }
    
    func moveToImplementPartneDetail(corporateId: String, partnerId: String) {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.implementingPartnersDetailVC) as? ImplementingPartnersDetailViewController {
            vc.corporateId = corporateId
            vc.partnerId = partnerId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.implementingPartnersTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }

    @IBAction func searchAction(_ sender: Any) {
        getPartnersData(isFilter: true)
    }
    
    @IBAction func sideMenuActio(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
}

extension ImplementingPartnersViewController: yearChangedDelegate {
    
    func yearChanged() {
    }
    
}
