//
//  ContactDetailMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import Foundation
import UIKit

extension ContactDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return contactDetails?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.contactHeaderTableViewCell, for: indexPath) as? ContactHeaderTableViewCell else { return UITableViewCell() }
            cell.projectNameLabel.text = projectName
            cell.implementingPartnerLabel.text = implementingPartner
            cell.yearLabel.text = "Year \(selectedFinancialYear)"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.contactDetilsTableViewCell, for: indexPath) as? ContactDetilsTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: contactDetails?[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let projectId = projectList?[indexPath.row].projectID ?? 0
//        moveToProjectDetails(projectId: projectId)
    }
    
    
}
