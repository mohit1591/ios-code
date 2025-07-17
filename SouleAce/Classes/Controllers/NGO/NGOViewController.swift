//
//  NGOViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import UIKit
import iOSDropDown

class NGOViewController: BaseViewController {
    
    @IBOutlet weak var statusDropDown: DropDown!
    @IBOutlet weak var budgetDropDown: DropDown!
    @IBOutlet weak var themeDropDown: DropDown!
    @IBOutlet weak var stageDropDown: DropDown!
    @IBOutlet weak var stateDropDown: DropDown!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var ngoSelectedView: UIView!
    @IBOutlet weak var rfpSelectedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButtonView: UIView!
    @IBOutlet weak var filterButton: UIButton!
    
    
    var rfpData : [RFPData]?
    var ngoHeader: NgoHeaderData?
    var ngodata: [NgoData]?
    var stageData = [StageData]()
    var themes = [Themes]()
    var rfpStatus = [RfpStatus]()
    var budget = [FilterBudgetData]()
    var state = [FilterStateData]()
    
    var stageId = 0
    var stateId = 0
    var themeId = 0
    var statusId = 0
    var budgetId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        sideMenuDelegate = self
        filterView.isHidden = true
        rfpViewSelected()
        getFiltersValue()
        DispatchQueue.main.async {
            self.filterButtonView.layer.cornerRadius = self.filterButtonView.frame.width/2
        }
    }
    
    func ngoViewSelected() {
        ngoSelectedView.isHidden = false
        rfpSelectedView.isHidden = true
        getNgoApplication(isFromFilter: false)
    }
    
    func rfpViewSelected() {
        filterButtonView.isHidden = true
        ngoSelectedView.isHidden = true
        rfpSelectedView.isHidden = false
        getRfcList()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.rfpTableViewCell)
        tableView.register(cell: Cell.ngoHeaderTableViewCell)
        tableView.register(cell: Cell.ngoTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setupDropDowns() {
        
        statusDropDown.rowHeight = 40
        statusDropDown.rowHeight = 40
        budgetDropDown.rowHeight = 40
        themeDropDown.rowHeight = 40
        stateDropDown.rowHeight = 40
        
        statusDropDown.listHeight = 220.0
        budgetDropDown.listHeight = 220.0
        themeDropDown.listHeight = 220.0
        stageDropDown.listHeight = 220.0
        stateDropDown.listHeight = 220.0
        
        statusDropDown.isSearchEnable = false
        budgetDropDown.isSearchEnable = false
        themeDropDown.isSearchEnable = false
        stageDropDown.isSearchEnable = false
        stateDropDown.isSearchEnable = false
        
        statusDropDown.didSelect { [self] selectedText, index, id in
            statusId = id
        }
        
        budgetDropDown.didSelect { [self] selectedText, index, id in
            budgetId = selectedText == "Select Budget" ? "" : selectedText
        }
        
        themeDropDown.didSelect { [self] selectedText, index, id in
            themeId = id
        }
        
        stageDropDown.didSelect { [self] selectedText, index, id in
            stageId = id
        }
        
        stateDropDown.didSelect { [self] selectedText, index, id in
            stateId = id
        }
    }
    
    func resetAllFilters() {
        stageId = 0
        stateId = 0
        themeId = 0
        statusId = 0
        budgetId = ""
        
        stateDropDown.selectedIndex = -1
        themeDropDown.selectedIndex = -1
        stageDropDown.selectedIndex = -1
        budgetDropDown.selectedIndex = -1
        statusDropDown.selectedIndex = -1

        stateDropDown.text = ""
        themeDropDown.text = ""
        stageDropDown.text = ""
        budgetDropDown.text = ""
        statusDropDown.text = ""
    }
    
    func moveToNGOApplictionScreen(id: String) {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.ngoApplicationVC) as? NGOApplicationViewController {
            vc.id = id
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //    MARK: - Button Action
    
    @IBAction func ngoButtonAction(_ sender: UIButton) {
        ngoViewSelected()
    }
    
    @IBAction func rfcButtonACtion(_ sender: UIButton) {
        rfpViewSelected()
    }
    
    @IBAction func filterAction(_ sender: UIButton) {
        filterView.isHidden = false
    }
    
    @IBAction func closeFilterAction(_ sender: Any) {
        filterView.isHidden = true
    }
    
    @IBAction func submitFilterAction(_ sender: Any) {
        filterView.isHidden = true
        getNgoApplication(isFromFilter: true)
    }
    
    @IBAction func resetFilterAction(_ sender: UIButton) {
        filterView.isHidden = true
        resetAllFilters()
        getNgoApplication(isFromFilter: false)
    }
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
}

// MARK: - Button Action

extension NGOViewController: yearChangedDelegate {
    
    func yearChanged() {
    }
    
}
