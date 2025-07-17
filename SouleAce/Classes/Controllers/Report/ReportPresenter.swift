//
//  ReportPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 22/02/24.
//

import Foundation
import UIKit

extension ReportViewController {
    
    func getFilterList() {
        Utils.showSpinner()
        NetworkManager.shared.getReportMenuApi(complition: { [self] value in
            reportFilterList = value
            selectedfilter = reportFilterList?.first
            filterLabel.text = selectedfilter?.name
            getReportList()
            collectionView.reloadData()
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
    func getReportList() {
        Utils.showSpinner()
        NetworkManager.shared.getReportApi(filterId: selectedfilter?.id ?? "", complition: { [self] value in
            self.reportList = value
            collectionView.reloadData()
            Utils.hideSpinner()
        })
        
    }
}
