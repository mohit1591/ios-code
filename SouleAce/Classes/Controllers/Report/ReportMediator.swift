//
//  ReportMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 22/02/24.
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportFilterList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.sideMenuCell, for: indexPath) as? SideMenuTableViewCell else { return UITableViewCell() }
        cell.iconImageView.isHidden = true
        cell.titleLabel.text = reportFilterList?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedfilter = reportFilterList?[indexPath.row]
        filterLabel.text = selectedfilter?.name
        getReportList()
        tableView.isHidden = true
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ReportViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reportList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reportCollectionViewCell, for: indexPath) as? ReportCollectionViewCell else { return UICollectionViewCell() }
        cell.fillCell(value: reportList?[indexPath.item])
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
        self.openURL(link: reportList?[indexPath.item].report_file ?? "")
    }
    
}
