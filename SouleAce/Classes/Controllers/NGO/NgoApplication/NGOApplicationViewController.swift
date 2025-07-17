//
//  NGOApplicationViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import UIKit

class NGOApplicationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var id = ""
    var orgaionzationData : OrgaionzationData?
    var cert12a : Cert12a?
    var cert80g : Cert80g?
    var certFcra : CertFcra?
    var annualReportsData : [AnnualReportsData]?
    var auditReportsData : [AuditReportsData]?
    var itrReportData : [ItrReportData]?
    var ndata : Ndata?
    var personnelData : PersonnelData?
    var proposalDetails : ProposalDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView()
        getNgoApplicationDetail()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.organaizationDetailTableViewCell)
        tableView.register(cell: Cell.isRegisterTableViewCell)
        tableView.register(cell: Cell.proposalDetailsTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
