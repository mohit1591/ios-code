//
//  GalleryDetailMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 26/02/24.
//

import Foundation
import UIKit
import SDWebImage
import Photos

enum DownloadError: Error {
    case invalidURL
    case noData
    case failedToDownload(Error)
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension GalleryDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFromProjectDetailScreen {
            return galleryDetailData?.count ?? 0
        } else {
            return galleryData?.count ?? 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == galleryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.galleryDetailCollectionViewCell, for: indexPath) as? GalleryDetailCollectionViewCell else { return UICollectionViewCell() }
            
            var image : UIImage?
            var imageUrl : URL?
            
            if isFromProjectDetailScreen {
                if isPhoto == "1" {
                    cell.downloadView.isHidden = false
                    imageUrl = URL(string: galleryDetailData?[indexPath.row].path ?? "")
                } else {
                    cell.downloadView.isHidden = true
                    if !(galleryDetailData?[indexPath.row].path ?? "").isEmpty {
                        image = createThumbnailOfVideoFromRemoteUrl(url: galleryDetailData?[indexPath.row].path ?? "")
                    }
                }
            } else {
                if isPhoto == "1" {
                    cell.downloadView.isHidden = false
                    imageUrl = URL(string: galleryData?[indexPath.row].path ?? "")
                } else {
                    cell.downloadView.isHidden = true
                    if !(galleryData?[indexPath.row].path ?? "").isEmpty {
                        image = createThumbnailOfVideoFromRemoteUrl(url: galleryData?[indexPath.row].path ?? "")
                    }
                }
            }
            
            if isPhoto == "1" {
                cell.imageView.sd_setImage(with: imageUrl)
            } else {
                cell.imageView.image = image
            }
            
            cell.handleDownloadAction = { [self] in
                Utils.showSpinner()
                var imageUrlString = ""
                if isFromProjectDetailScreen {
                    imageUrlString  = galleryDetailData?[indexPath.row].path ?? ""
                } else {
                    imageUrlString  = galleryData?[indexPath.row].path ?? ""
                }
                downloadFile(from: imageUrlString, completion: {fileURL,error in
                    if let error = error {
                        Utils.hideSpinner()
                        print("Error while downloading")
                    } else if let fileURL = fileURL {
                        print(fileURL)
                        self.saveMediaToGallery(from: fileURL)
                    }
                })
                
            }
            return cell
        } else {
           
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.previewCollectionViewCell, for: indexPath) as? PreviewCollectionViewCell else { return UICollectionViewCell() }

            if isPhoto == "1" {
                
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
                cell.videoView.isHidden = false
                
                var image =  UIImage()
                
                if !(galleryData?[indexPath.row].path ?? "").isEmpty {
                    if isFromProjectDetailScreen {
                        image = createThumbnailOfVideoFromRemoteUrl(url: galleryDetailData?[indexPath.row].path ?? "") ?? UIImage()
                        
                    } else {
                        image = createThumbnailOfVideoFromRemoteUrl(url: galleryData?[indexPath.row].path ?? "") ?? UIImage()
                    }
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
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == galleryCollectionView {
            return 8
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == galleryCollectionView {
            return 8
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == galleryCollectionView {
            let noOfCellsInRow = 3   //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace - 10) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 160)
        } else {
            let width = collectionView.bounds.width // collectionView.contentSize.width
            return CGSize(width: width, height: 300)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        
//        if collectionView == previewCollectionView {
//            if isFromProjectDetailScreen {
//                countLabel.text = "\(indexPath.row + 1) of \(galleryDetailData?.count ?? 0)"
//            } else {
//                countLabel.text = "\(indexPath.row + 1) of \(galleryData?.count ?? 0)"
//            }
//            
//            if isPhoto == "1" {
//                
//            } else {
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.previewCollectionViewCell, for: indexPath) as? PreviewCollectionViewCell else { return }
//                cell.previewImgView.isHidden = false
//                cell.videoView.isHidden = true
//                var image = UIImage()
//                if !(galleryDetailData?[indexPath.row].path ?? "").isEmpty {
//                    if isFromProjectDetailScreen {
//                        image = createThumbnailOfVideoFromRemoteUrl(url: galleryDetailData?[indexPath.row].path ?? "") ?? UIImage()
//                    } else {
//                        image = createThumbnailOfVideoFromRemoteUrl(url: galleryData?[indexPath.row].path ?? "") ?? UIImage()
//                    }
//                }
//                cell.previewImgView.image = image
//            }
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == galleryCollectionView {
            
            if isFromProjectDetailScreen {
                if isPhoto == "1" {
                    countLabel.text = "\(indexPath.row + 1) of \(galleryDetailData?.count ?? 0)"
                    selectedPreviewImgIndex = indexPath.row
                } else {
                    countLabel.text = "\(indexPath.row + 1) of \(galleryDetailData?.count ?? 0)"
                }
            } else {
                if isPhoto == "1" {
                    countLabel.text = "\(indexPath.row + 1) of \(galleryData?.count ?? 0)"
                    selectedPreviewImgIndex = indexPath.row
                } else {
                    countLabel.text = "\(indexPath.row + 1) of \(galleryData?.count ?? 0)"
                    selectedPreviewImgIndex = indexPath.row
                }
            }
            
            DispatchQueue.main.async { [self] in
                previewCollectionView.reloadData()
                previewCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
                previewView.isHidden = false
            }
            
        } else {
            var imageUrl : URL?
            if isFromProjectDetailScreen {
                imageUrl = URL(string: galleryDetailData?[indexPath.item].path ?? "") ?? URL(fileURLWithPath: "")
            } else {
                imageUrl = URL(string: galleryData?[indexPath.item].path ?? "") ?? URL(fileURLWithPath: "")
            }
            playVideo(url: imageUrl ?? URL(fileURLWithPath: ""))

        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == previewCollectionView {
            let visibleCells = previewCollectionView.indexPathsForVisibleItems
            guard let indexPath = visibleCells.first else { return }
            
            if isFromProjectDetailScreen {
                countLabel.text = "\(indexPath.row + 1) of \(galleryDetailData?.count ?? 0)"
            } else {
                countLabel.text = "\(indexPath.row + 1) of \(galleryData?.count ?? 0)"
            }
        }
    }
}
