//
//  CompanyProfilePresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import Foundation

extension CompanyProfileViewController {
    
    func getCompanyProfile() {
        Utils.showSpinner()
        NetworkManager.shared.getCompanyDetailAPI(complition: { [self] value in
            companyDetail = value
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
}
