//
//  ActivityDetailMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation
import UIKit
import SDWebImage

extension ActivityDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == previewCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.previewCollectionViewCell, for: indexPath) as? PreviewCollectionViewCell else { return UICollectionViewCell() }
            var imageUrl : URL?
//            if isFromProjectDetailScreen {
//                imageUrl = URL(string: galleryDetailData?[indexPath.row].path ?? "")
//            } else {
//                imageUrl = URL(string: galleryData?[indexPath.row].path ?? "")
//            }
            imageUrl = URL(string: allPhotos?[indexPath.row].activityPhoto ?? "")
            cell.previewImgView.isHidden = false
            cell.videoView.isHidden = true
            cell.previewImgView.sd_setImage(with: imageUrl)
            cell.playButton.isHidden = true
            /*if isPhoto == "1" {
                
                var imageUrl : URL?
                if isFromProjectDetailScreen {
                    imageUrl = URL(string: galleryDetailData?[indexPath.row].path ?? "")
                } else {
                    imageUrl = URL(string: galleryData?[indexPath.row].path ?? "")
                }
                
                cell.previewImgView.isHidden = false
                cell.videoView.isHidden = true
                cell.previewImgView.sd_setImage(with: imageUrl)
                cell.playButton.isHidden = true
            } else {
                cell.playButton.isHidden = false
                cell.previewImgView.isHidden = false
                cell.videoView.isHidden = true
                
                var image : UIImage?
                if isFromProjectDetailScreen {
                    image = createThumbnailOfVideoFromRemoteUrl(url: galleryDetailData?[indexPath.row].path ?? "")
                } else {
                    image = createThumbnailOfVideoFromRemoteUrl(url: galleryData?[indexPath.row].path ?? "")
                }
                
                cell.previewImgView.image = image
                cell.handlePlayButtonAction = { [self] in
                    
                    var imageUrl : URL?
                    if isFromProjectDetailScreen {
                        imageUrl = URL(string: galleryDetailData?[indexPath.item].path ?? "") ?? URL(fileURLWithPath: "")
                    } else {
                        imageUrl = URL(string: galleryData?[indexPath.item].path ?? "") ?? URL(fileURLWithPath: "")
                    }
                    playVideo(url: imageUrl ?? URL(fileURLWithPath: ""))
                }
            }*/
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDashboardCollectionViewCell, for: indexPath) as? SDGDashboardCollectionViewCell else { return UICollectionViewCell() }
        let imageUrl = URL(string: allPhotos?[indexPath.item].activityPhoto ?? "")
        cell.imageView.sd_setImage(with: imageUrl)
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.collectionView {
            return 8
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.collectionView {
            return 8
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            let noOfCellsInRow = 3   // number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace - 16) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 120)
        }else {
            let width = collectionView.bounds.width // collectionView.contentSize.width
            return CGSize(width: width, height: 300)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            countLabel.text = "\(indexPath.row + 1) of \(allPhotos?.count ?? 0)"
            selectedPreviewImgIndex = indexPath.row
            previewCollectionView.reloadData()
            previewCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            previewView.isHidden = false
        }else {
            
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ActivityDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetingPeople?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.meetingDetailTableViewCell, for: indexPath) as? MeetingDetailTableViewCell else { return UITableViewCell() }
        cell.emailIdLabel.text = meetingPeople?[indexPath.row].email_id
        cell.nameLabel.text = "\(meetingPeople?[indexPath.row].title ?? "") \(meetingPeople?[indexPath.row].name ?? "")"
        
        cell.mobileNoLabel.text = meetingPeople?[indexPath.row].phone_no

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
