//
//  ImplementingPartnersDetailViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import UIKit

class ImplementingPartnersDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var corporateId: String = ""
    var partnerId: String = ""
    var allProjectShow = false
    var photosShow = false
    var certiAwardsShow = false
    var keyManagmentPersonalShow = false
    var titleSection = ["All Project", "Key Management Personal", "Certification and Awards", "Photos"]
    var keyManagements : [KeyManagements]?
    var ngoCertifications : [String]?
    var ngoPhotos: [NgoPhotos]?
    var ngoProjects: [NgoProjects]?
    var ngoProfile: NgoProfile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        getPatnersDetailsData()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.partnersDetailTableViewCell)
        tableView.register(cell: Cell.allProjectTableViewCell)
        tableView.register(cell: Cell.keyManagmentTableViewCell)
        tableView.register(cell: Cell.photosTableViewCell)
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderTableViewCell")
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
