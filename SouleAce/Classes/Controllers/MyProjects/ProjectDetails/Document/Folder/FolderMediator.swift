//
//  FolderMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/03/24.
//

import Foundation
import UIKit

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension FolderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documents?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reportCollectionViewCell, for: indexPath) as? ReportCollectionViewCell else { return UICollectionViewCell() }
            cell.fillDocumentCell(data: documents?[indexPath.item])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let noOfCellsInRow = 3   //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if documents?[indexPath.item].type == "pdf" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.item].type == "docx" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.item].type == "folder" {
            }
    }
    
}
