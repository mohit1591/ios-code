//
//  DemoProgressReportPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/03/24.
//

import Foundation

extension DemoProgressReportViewController {
    
    func getDemoActivityProgressReportData() {
            Utils.showSpinner()
        NetworkManager.shared.getDemoActivityProgressReportAPI(projectId: "\(projectId)", tabId: "\(tabId)", complition: { [self] value in
            print(value as Any)
            blocks = value?.activityWise?.blocks
            progressReport = value?.activityWise?.progress_report
            print("progressReport Count::\(progressReport?.count ?? 0)")
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
    func getDemoComplitionProgressReportData() {
            Utils.showSpinner()
        NetworkManager.shared.getDemoComplitionProgressReportAPI(projectId: "\(projectId)", tabId: "\(tabId)", complition: { [self] value in
            print(value as Any)
            complitiondata = value?.data
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
