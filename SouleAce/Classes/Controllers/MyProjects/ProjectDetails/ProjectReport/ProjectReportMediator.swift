//
//  ProjectReportMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 27/03/24.
//

import Foundation
import UIKit

extension ProjectReportViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionView {
            return projectReport.count
        } else {
            return report?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.segmentHeaderCollectionViewCell, for: indexPath) as? SegmentHeaderCollectionViewCell else { return UICollectionViewCell() }
            
            cell.titleLabel.text = projectReport[indexPath.item].rawValue
            if selectedIndex == indexPath.item {
                cell.selectedView.isHidden = false
            } else {
                cell.selectedView.isHidden = true
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reportCollectionViewCell, for: indexPath) as? ReportCollectionViewCell else { return UICollectionViewCell() }
            cell.fillProjectReportCell(data: report?[indexPath.item])
            return cell
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == headerCollectionView {
            selectedIndex = indexPath.item
            let type = indexPath.item + 1
            getProjectReports(type: "\(type)")
            collectionView.reloadData()
        } else {
            self.openURL(link: report?[indexPath.item].report_file ?? "")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == headerCollectionView {
            let noOfCellsInRow = 4   // number of column you want
            let size = Int((collectionView.bounds.width) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 40)
        } else {
            let noOfCellsInRow = 3   //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 140)
        }
    }
}
