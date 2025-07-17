//
//  ProjectDocumentPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 13/03/24.
//

import Foundation

extension ProjectDocumentViewController {
    
    func getDocuments(isFromProject: Bool) {
        var param = ""
        if isFromProject {
            param = "\(projectId)/1"
        } else {
            param = "\(projectId)/2"
        }
        NetworkManager.shared.getDocumentDetailsAPI(param: param, complition: { [self] value in
            print(value as Any)
            documents = value
            collectionView.reloadData()
        })
    }
}
