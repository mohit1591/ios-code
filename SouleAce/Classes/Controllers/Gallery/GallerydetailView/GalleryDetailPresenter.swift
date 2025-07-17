//
//  GalleryDetailPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 26/02/24.
//

import Foundation

extension GalleryDetailViewController {
    
    func getMediaData() {
        Utils.showSpinner()
        NetworkManager.shared.getGalleryCategoryAPI(albumId: id, type: isPhoto, complition: { [self] value in
            galleryData = value
            titleLabel.text = galleryData?.first?.name
            galleryCollectionView.reloadData()
            Utils.hideSpinner()
        })
    }
    
}
