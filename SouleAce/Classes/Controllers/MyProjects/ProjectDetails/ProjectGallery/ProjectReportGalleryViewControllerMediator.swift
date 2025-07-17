//
//  ProjectReportGalleryViewControllerMediator.swift
//  SouleAce
//
//  Created by ideveloper1 on 26/03/24.
//

import UIKit

extension ProjectReportGalleryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.galleryTableViewCell, for: indexPath) as? GalleryTableViewCell else {
            return UITableViewCell() }
        cell.titleLabel.text = albumData?[indexPath.row].name
        if (albumData?[indexPath.row].album_content?.count ?? 0) == 0 {
            cell.backGroundImageView.image = UIImage()
            return cell
        }
        if isPhoto == "2" {
            let image = createThumbnailOfVideoFromRemoteUrl(url: albumData?[indexPath.row].album_content?.first?.path ?? "")
            cell.backGroundImageView.image = image
        } else {
            let imageUrl = URL(string: albumData?[indexPath.row].album_content?.first?.path ?? "")
            cell.backGroundImageView.sd_setImage(with: imageUrl)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToGalleryDetail(selectedAlbum: albumData?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
    
