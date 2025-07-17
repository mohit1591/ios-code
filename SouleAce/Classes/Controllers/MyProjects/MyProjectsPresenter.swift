//
//  MyProjectsPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/02/24.
//

import Foundation
import UIKit

extension MyProjectsViewController {
    
    func getMyProjectList() {
        let currentpage =  myProjects?.data?.currentPage ?? 0
        let nextPage = currentpage + 1
        Utils.showSpinner()
        NetworkManager.shared.getMyProjectsAPI(financeYearId: selectedFinancialId, page: nextPage, complition: { [self] result in
            Utils.hideSpinner()
            myProjects = result
            if result?.data?.data?.count ?? 0 > 0 {
                if projectList?.count ?? 0 > 0 {
                    projectList! += (result?.data?.data)!
                } else {
                    projectList = result?.data?.data
                }
            }
            tableView.reloadData()
        })
    }
    
}
