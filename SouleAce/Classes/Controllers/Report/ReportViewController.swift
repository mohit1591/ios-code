//
//  ReportViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/02/24.
//

import UIKit

class ReportViewController: BaseViewController {
    
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var reportFilterList: [ReportFilterData]?
    var selectedfilter : ReportFilterData?
    var reportList: [ReportData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        getFilterList()
        tableView.isHidden = true
        setupTableView()
        setupCollectionView()
        sideMenuDelegate = self
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.sideMenuCell)
        
        tableView.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowOffset = CGSize(width: 0, height: 2)
        tableView.layer.shadowRadius = 4
        tableView.layer.masksToBounds = false
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell: Cell.reportCollectionViewCell)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView!.collectionViewLayout = layout
    }
    //  MARK: - Button Action
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
    @IBAction func openFilterAction(_ sender: UIButton) {
        tableView.isHidden = false
    }
    
}

// MARK: - SideMenuDelegate

extension ReportViewController: yearChangedDelegate {
    func yearChanged() {
        getReportList()
    }
}
