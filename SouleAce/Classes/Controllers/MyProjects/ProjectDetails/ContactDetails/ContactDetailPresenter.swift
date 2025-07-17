//
//  ContactDetailPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import Foundation

extension ContactDetailViewController {

    func getPartnersData(isFilter: Bool) {
        Utils.showSpinner()
        var param: String = ""
        if isFilter {
            switch selectedFilter {
            case .name:
                name = searchTextField.text ?? ""
                param = param + "contact_name=\(name)"
                break
            case .organization:
                organization = searchTextField.text ?? ""
                param = param + "organization_name=\(organization)"
                break
            case .mobileNo:
                mobileNo = searchTextField.text ?? ""
                param = param + "contact_mobile_no=\(mobileNo)"
                break
            case .designation:
                designation = searchTextField.text ?? ""
                param = param + "designation=\(designation)"
                break
            }
        }
      
        NetworkManager.shared.getNgoContactDetailsAPI(projectId: "\(projectId)", param: param, complition: { [self] value in
            contactDetails = value
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
