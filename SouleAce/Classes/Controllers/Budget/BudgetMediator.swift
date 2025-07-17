//
//  BudgetMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/02/24.
//

import Foundation
import UIKit

extension BudgetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return yearBudgetDetails?.count ?? 0
        } else {
            return projectBudgetData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.budgetTableViewCell, for: indexPath) as? BudgetTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: yearBudgetDetails?[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.budgetDetailTableViewCell, for: indexPath) as? BudgetDetailTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: projectBudgetData?[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Showing \(projectBudgetData?.count ?? 0) items"
        } else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
