//
//  ProjectBudgetPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/03/24.
//

import Foundation

extension ProjectBudgetViewController {
    
    func getBudgetDetails() {
        Utils.showSpinner()
        NetworkManager.shared.getProjectBudgetAPI(projectId: "\(projectId)", corporateId: "\(corporateId)", complition: { [self] value in
            projectBudgetData = value?.projectBudgetData
            fdata = value?.fdata
            projectBudgetValue = value?.projectBudgetValue
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
