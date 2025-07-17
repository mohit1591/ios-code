//
//  ActivityPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import Foundation

extension ActivityViewController {
    
    func getPartnersData() {
        Utils.showSpinner()
        let param: String = "search_key=\(currentPage)&"
        let page: String = "?page=\(currentPage)"
        //        \(projectId)
        NetworkManager.shared.getProjectActivityAPI(page: page, projectType: selectedTabId, projectId: "\(projectId)", complition: { [self] value in
            
            activityData = value
            if currentPage == 1 {
                activity = activityData?.data
            } else {
                if value?.data?.count ?? 0 > 0 {
                    if activity?.count ?? 0 > 0 {
                        activity! += (activityData?.data)!
                    } else {
                        activity = activityData?.data
                    }
                }
            }
            tableView.reloadData()
            
            Utils.hideSpinner()
        })
    }
    
    func getMeetingData(page: Int = 1) {
        Utils.showSpinner()
        let param: String = "?search_key=\(searchText)&"
        let page: String = "page=\(currentPage)"
        //        \(projectId)
        NetworkManager.shared.getMeetingActivityAPI(page: page, projectType: selectedTabId, projectId: "\(projectId)", param: param, complition: { [self] value in
            
            activityData = value
            if currentPage == 1 {
                activity = activityData?.data
            } else {
                if value?.data?.count ?? 0 > 0 {
                    if activity?.count ?? 0 > 0 {
                        activity! += (activityData?.data)!
                    } else {
                        activity = activityData?.data
                    }
                }
            }
            tableView.reloadData()
            
            Utils.hideSpinner()
        })
    }

    
}
