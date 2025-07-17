//
//  SDGPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/02/24.
//

import Foundation


extension SDGViewController {
    
    func getSDG() {
        Utils.showSpinner()
        
        NetworkManager.shared.getSDGApi(complition: { [self] result in
            Utils.hideSpinner()
            sdgProjects = result?.sdgs
            sdgCollectionVIew.reloadData()
        })
    }
    
}
