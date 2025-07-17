//
//  ActivityProgressPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/02/24.
//

import Foundation

extension ActivityProgressViewController {
    
    func getActivityProgressData() {
        Utils.showSpinner()
        NetworkManager.shared.getActivityProgressAPI(complition: { [self] value in
            print(value as Any)
            projectProgressList = value?.project_progress
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
}
