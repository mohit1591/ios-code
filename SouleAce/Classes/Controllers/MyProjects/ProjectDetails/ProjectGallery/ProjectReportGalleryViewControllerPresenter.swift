//
//  ProjectReportGalleryViewControllerPresenter.swift
//  SouleAce
//
//  Created by ideveloper1 on 26/03/24.
//

import UIKit

extension ProjectReportGalleryViewController  {
    
    func fetchReportAlbumData() {
        Utils.showSpinner()
        NetworkManager.shared.getReportGalleryAPI(pId: String(projectId), type: isPhoto, complition: { [self] value in
            Utils.hideSpinner()
            albumData = value?.albums
            tableView.reloadData()
        })
    }
    
}
