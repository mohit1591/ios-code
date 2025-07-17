//
//  ImplementingPartnersDetailPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import Foundation

extension ImplementingPartnersDetailViewController {
    
    func getPatnersDetailsData() {
        NetworkManager.shared.getImplementingPartnersDetailsAPI(corporateId: corporateId, partnerId: partnerId, complition: { [self] value in
            debugPrint("value::::\(value)")
            keyManagements = value?.keyManagements
            ngoCertifications = value?.ngoCertifications
            ngoPhotos = value?.ngoPhotos
            ngoProjects = value?.ngoProjects
            ngoProfile = value?.ngoProfile
            debugPrint("ngoProfile:::\(ngoProfile)")
            debugPrint("value?.ngoProfile:::\(value?.ngoProfile)")
            debugPrint("value?.ngoProjects:::\(value?.ngoProfile)")
            self.tableView.reloadData()
        })
    }
}
