//
//  CSRKnowledgeBasePresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 05/03/24.
//

import Foundation

extension CSRKnowledgeBaseViewController {
    
    func getCSRData() {
        NetworkManager.shared.getCSRKnowledgeBaseAPI(complition: { [self] value in
            print(value as Any)
            csrData = value
            tableView.reloadData()
        })
    }
}
