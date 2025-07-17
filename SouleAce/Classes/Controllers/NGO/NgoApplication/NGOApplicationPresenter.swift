//
//  NGOApplicationPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import Foundation

extension NGOApplicationViewController {
    
    func getNgoApplicationDetail() {
        Utils.showSpinner()
        NetworkManager.shared.getNgoApplicationAPI(ngoApplicationId: id, complition: { [self] value in
            cert80g = value?.cert_80g
            cert12a = value?.cert_12a
            proposalDetails = value?.proposalDetails
            certFcra = value?.cert_fcra
            orgaionzationData = value?.data
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
