//
//  SDGDetailViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/02/24.
//

import UIKit

class SDGDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var sdg: Sdgs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTableView() 
        titleLabel.text = sdg?.sdg_name
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.sdgDetailTableViewCell)
        tableView.showsVerticalScrollIndicator = false
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
