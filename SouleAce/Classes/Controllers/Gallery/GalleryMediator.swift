//
//  GalleryMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 23/02/24.
//

import Foundation
import UIKit
import SDWebImage

extension GalleryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == filterTableView {
            return filters?.count ?? 0
        } else {
            return galleryData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == filterTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.sideMenuCell, for: indexPath) as? SideMenuTableViewCell else { return UITableViewCell() }
            cell.iconImageView.isHidden = true
            cell.titleLabel.text = filters?[indexPath.row].name
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.galleryTableViewCell, for: indexPath) as? GalleryTableViewCell else {
                return UITableViewCell() }
            cell.titleLabel.text = galleryData?[indexPath.row].name
            if (galleryData?[indexPath.row].path ?? "").isEmpty {
                cell.backGroundImageView.image = UIImage()
                return cell
            }
            if isPhoto == "2" {
                cell.backGroundImageView.image = createThumbnailOfVideoFromRemoteUrl(url: galleryData?[indexPath.row].path ?? "")
            } else {
                cell.backGroundImageView.sd_setImage(with: URL(string: galleryData?[indexPath.row].path ?? ""))
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == filterTableView {
            selectedFilter = filters?[indexPath.row]
            filterTitleLabel.text = selectedFilter?.name
            filterTableView.isHidden = true
            getAlbum()
        } else {
            moveToGalleryDetail(selectedIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
