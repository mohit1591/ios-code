//
//  ImplementingPartnersPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import Foundation

extension ImplementingPartnersViewController {
    
    func getPartnersData(isFilter: Bool) {
        Utils.showSpinner()
        var param : String? = nil
        if isFilter {
            switch selectedFilter {
            case .contactPerson:
                contactPerson = searchTextField.text ?? ""
                param = "ngo_contact_person=\(contactPerson)"
                break
            case .contactNo:
                contactNo = searchTextField.text ?? ""
                param = "ngo_contact_number=\(contactNo)"
                break
            case .ngoName:
                ngoName = searchTextField.text ?? ""
                param = "ngo_name=\(ngoName)"
                
                break
            case .panNo:
                panNo = searchTextField.text ?? ""
                param = "ngo_pan_number=\(panNo)"
                break
            case .registrationNo:
                registrationNo = searchTextField.text ?? ""
                param = "ngo_registration_no=\(registrationNo)"
                break
            }
        }
      
        NetworkManager.shared.getImplementingPartnersAPI(param: param, complition: { [self] value in
            
            partnersData = value?.ngo
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
}
