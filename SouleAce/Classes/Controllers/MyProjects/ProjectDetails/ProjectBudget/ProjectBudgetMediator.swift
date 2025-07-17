//
//  ProjectBudgetMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/03/24.
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ProjectBudgetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else  if section == 1 {
            return (projectBudgetValue?.count ?? 0)
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectBudgetTableViewCell, for: indexPath) as? ProjectBudgetTableViewCell else { return UITableViewCell() }
//            cell.fdata = fdata
            cell.projectBudgetData = projectBudgetData
            cell.collectionView.reloadData()
            return cell
        } else if indexPath.section == 1 { // project value data
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectBudgetHeaderTableViewCell, for: indexPath) as? ProjectBudgetHeaderTableViewCell else { return UITableViewCell() }
                print("sdfg::\(projectBudgetValue?.first?.planned?.formattedWithSeparator ?? "")")
                cell.budgetStackView.isHidden = projectBudgetValue?.first?.planned?.formattedWithSeparator ?? "" == "0"//false
                cell.titleLabel.text = projectBudgetValue?[indexPath.row].budgetHeader ?? ""
                cell.budgetAllocatedLabel.text = "Rs.\(projectBudgetValue?.first?.planned?.formattedWithSeparator ?? "")"
                
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectBudgetListTableViewCell, for: indexPath) as? ProjectBudgetListTableViewCell else { return UITableViewCell() }
                let currentItemIndex = indexPath.row
                cell.fillProjectValueCell(data: projectBudgetValue?[currentItemIndex])
                return cell
            }
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
