//
//  ProjectReportPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 27/03/24.
//

import Foundation

extension ProjectReportViewController {
    
    func getProjectReports(type: String) {
        Utils.showSpinner()
        NetworkManager.shared.getProjectReportAPI(projectId: "\(projectId)", type: type, complition: { [self] value in
            print(value as Any)
            reportCollectionView.reloadData()
            report = value?.report
            Utils.hideSpinner()
        })
    }
    
}
