//
//  GalleryPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 23/02/24.
//

import Foundation
import UIKit

extension GalleryViewController {
    
    func getAlbum() {
        Utils.showSpinner()
        NetworkManager.shared.getGalleryAPI(filterId: selectedFilter?.id ?? "1", type: isPhoto, complition: { [self] value in
            Utils.hideSpinner()
            galleryData = value
            tableView.reloadData()
        })
    }
    
    func getFilterData() {
        // Read the JSON data from the file
        if let path = Bundle.main.path(forResource: "galleryJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    if let success = jsonResult["success"] as? Bool, success == true,
                       let dataArray = jsonResult["data"] as? [[String: Any]] {
                        filters = NetworkManager.shared.self.decodeObject(fromData: dataArray)
                        selectedFilter = filters?.first
                        filterTitleLabel.text = selectedFilter?.name
                        getAlbum()
                    } else {
                        print("Failed to parse JSON data.")
                    }
                }
            } catch {
                // Handle error
                print("Error: \(error)")
            }
        } else {
            print("No file found at specified path.")
        }
    }
    
}
