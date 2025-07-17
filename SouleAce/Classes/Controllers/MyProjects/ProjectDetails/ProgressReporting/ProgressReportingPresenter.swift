//
//  ProgressReportingPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation

extension ProgressReportingViewController {
    
    func getProgressReportingData() {
            Utils.showSpinner()
        NetworkManager.shared.getActivityProgressAPI(projectId: "\(projectId)", complition: { [self] value in
            print("headerValues value as Any::\(value as Any)")
            progress = value?.progress
            headerValues = value?.headerValues
            print("headerValues\(headerValues)")
            print("Count::::\(headerValues?.count ?? 0)")
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
