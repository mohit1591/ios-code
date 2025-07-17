//
//  MonthlyReportPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/03/24.
//

import Foundation

extension MonthlyReportViewController {
    
    func getProjectMonthlyReports() {
        Utils.showSpinner()
        NetworkManager.shared.getProjectMonthlyReportAPI(projectId: "\(projectId)", type: selectedType, finYearId: "\(selectedYearId)", complition: { [self] value in
            print(value as Any)
            reportData = value
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
    func getProjectOverallReports() {
        Utils.showSpinner()
        NetworkManager.shared.getProjectOverallReportAPI(projectId: "\(projectId)", finYearId: "\(selectedYearId)", complition: { [self] value in
            print(value as Any)
            reportData = value
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}

