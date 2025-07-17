//
//  ProjectOverviewPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/04/24.
//

import Foundation

extension ProjectOverviewViewController {
    
    func getProjectOverviewData() {
        Utils.showSpinner()
        NetworkManager.shared.getProjectOverViewAPI(projectId: "\(projectId)", complition: { [self] value in
            print(value as Any)
            projectData = value
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
