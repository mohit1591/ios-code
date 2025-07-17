//
//  SDGMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/02/24.
//

import Foundation
import UIKit
import SDWebImage

extension SDGViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sdgProjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgCollectionViewCell, for: indexPath) as? SDGCollectionViewCell else { return UICollectionViewCell() }
        let imageUrl = URL(string: sdgProjects?[indexPath.item].sdg_img ?? "")
        cell.sdgImageView.sd_setImage(with: imageUrl)
        cell.sdgProjectLabel.text = "\(sdgProjects?[indexPath.row].project_count ?? 00)"
        cell.sdgBeneficiaryLabel.text = "\(sdgProjects?[indexPath.row].beneficary_total ?? 00)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToSDGDetailView(sdg: sdgProjects?[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 2   //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: 240)
    }
    
}
