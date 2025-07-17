//
//  MonthlyReportMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/03/24.
//

import Foundation
import UIKit

extension MonthlyReportViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monthlyReport.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.segmentHeaderCollectionViewCell, for: indexPath) as? SegmentHeaderCollectionViewCell else { return UICollectionViewCell() }
        
        cell.titleLabel.text = monthlyReport[indexPath.item].rawValue
        if selectedIndex == indexPath.item {
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        selectedReport = monthlyReport[indexPath.item]
        
        if selectedReport == MonthlyReport.overall {
            getProjectOverallReports()
        } else {
            let type = indexPath.item + 1
            selectedType = "\(type)"
            getProjectMonthlyReports()
        }
        tableView.reloadData()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 5   // number of column you want
        let size = Int((collectionView.bounds.width) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: 40)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MonthlyReportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.monthlyQuartelyReportTableViewCell, for: indexPath) as? MonthlyQuartelyReportTableViewCell else { return UITableViewCell() }

        if selectedReport == MonthlyReport.overall {
            cell.fillOverallCell()
            cell.fillOverAllDataCell(data: reportData?[indexPath.row])
        } else {
            cell.fillMonthlyCell(data: reportData?[indexPath.row])
            if selectedReport == MonthlyReport.q1 {
                cell.fillQ1Cell()
            } else if selectedReport == MonthlyReport.q2 {
                cell.fillQ2Cell()
            } else if selectedReport == MonthlyReport.q3 {
                cell.fillQ3Cell()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
