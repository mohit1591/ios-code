//
//  FolderPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/03/24.
//

import Foundation

extension FolderViewController {
    
    func getDocumentFolders() {
        let param = "\(projectId)/\(directoryId)"
        NetworkManager.shared.getDocumentFolderAPI(param: param, complition: { [self] value in
            print(value as Any)
            documents = value
            collectionView.reloadData()
        })
    }
}
