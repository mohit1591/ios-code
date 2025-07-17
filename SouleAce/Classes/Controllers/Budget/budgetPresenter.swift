//
//  budgetPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/02/24.
//

import Foundation

extension BudgetViewController {
    
    func getBudgetDetails() {
        Utils.showSpinner()
        NetworkManager.shared.getBudgetAPI(complition: { [self] value in
            print(value as Any)
            budgetData = value
            projectBudgetData = budgetData?.projectBudgetData
            yearBudgetDetails = budgetData?.fdata
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
