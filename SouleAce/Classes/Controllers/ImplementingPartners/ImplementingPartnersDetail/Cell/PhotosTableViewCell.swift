//
//  PhotosTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import UIKit
import SDWebImage


class PhotosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ngoPhotos: [NgoPhotos]?
    var ngoCertifications : [String]?
    var isFromPhotos = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.register(cell: Cell.sdgDashboardCollectionViewCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView!.collectionViewLayout = layout
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFromPhotos {
            return ngoPhotos?.count ?? 0
        } else {
            return ngoCertifications?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDashboardCollectionViewCell, for: indexPath) as? SDGDashboardCollectionViewCell else {
            return UICollectionViewCell() }
        var imageUrl: URL = URL(string: "") ?? URL(fileURLWithPath: "")
        if isFromPhotos {
            imageUrl = URL(string: ngoPhotos?[indexPath.item].photo ?? "") ?? URL(fileURLWithPath: "")
        } else {
            imageUrl = URL(string: ngoCertifications?[indexPath.item] ?? "") ?? URL(fileURLWithPath: "")
        }
         cell.imageView.sd_setImage(with: imageUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if isFromPhotos {
            if ngoPhotos?.count ?? 0 == 1 {
                let width = (collectionView.bounds.width - 100) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if ngoPhotos?.count ?? 0 == 2 {
                let width = (collectionView.bounds.width - 200 - 20) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if ngoPhotos?.count ?? 0 == 3 {
                let width = (collectionView.bounds.width - 300 - 30) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
        } else {
            if ngoCertifications?.count ?? 0 == 1 {
                let width = (collectionView.bounds.width - 100) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if ngoCertifications?.count ?? 0 == 2 {
                let width = (collectionView.bounds.width - 200 - 20) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if ngoCertifications?.count ?? 0 == 3 {
                let width = (collectionView.bounds.width - 300 - 30) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
        }
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 130)
    }
    
}
