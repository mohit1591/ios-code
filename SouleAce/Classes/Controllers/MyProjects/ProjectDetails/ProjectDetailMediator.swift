//
//  ProjectDetailMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/02/24.
//

import Foundation
import UIKit
import SDWebImage

extension ProjectDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == projectMenuCollectionView {
            return data?.count ?? 0
        } else {
            return projectsdg?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == projectMenuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.projectMenuCollectionViewCell, for: indexPath) as? ProjectMenuCollectionViewCell else {
                return UICollectionViewCell() }
            
            let val = data?[indexPath.row].module_name ?? ""
            
            cell.nameLabel.text = val

            if val == ProjectMenuListData.activities.rawValue {
                cell.imageView.image = UIImage(named: "nav_activities")
            } else if val == ProjectMenuListData.projectReport.rawValue {
                cell.imageView.image = UIImage(named: "nav_project_report")
            } else if val == ProjectMenuListData.caseStudies.rawValue {
                cell.imageView.image = UIImage(named: "nav_case_study")
            } else if val == ProjectMenuListData.documents.rawValue {
                cell.imageView.image = UIImage(named: "nav_documents")
            } else if val == ProjectMenuListData.gallery.rawValue {
                cell.imageView.image = UIImage(named: "nav_gallery")
            } else if val == ProjectMenuListData.contactDetails.rawValue {
                cell.imageView.image = UIImage(named: "nav_contact")
            } else if val == ProjectMenuListData.projectBudget.rawValue {
                cell.imageView.image = UIImage(named: "nav_project_budget")
            } else if val == ProjectMenuListData.budgetUtilization.rawValue {
                cell.imageView.image = UIImage(named: "nav_project_budget")
            } else if val == ProjectMenuListData.progressReporting.rawValue {
                cell.imageView.image = UIImage(named: "nav_project_report")
            } else if val == ProjectMenuListData.monthlyReport.rawValue {
                cell.imageView.image = UIImage(named: "nav_monthly_report")
            } else if val == ProjectMenuListData.projectOverview.rawValue {
                cell.imageView.image = UIImage(named: "nav_activities")
            } else if val == ProjectMenuListData.demoProgressReport.rawValue {
                cell.imageView.image = UIImage(named: "nav_project_report")
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDashboardCollectionViewCell, for: indexPath) as? SDGDashboardCollectionViewCell else {
                return UICollectionViewCell() }
            
            let imageUrl = URL(string: projectsdg?[indexPath.item] ?? "")
            cell.imageView.sd_setImage(with: imageUrl)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == projectMenuCollectionView {
            
            let val = data?[indexPath.row].module_name ?? ""
            debugPrint("module name::\(val)")
            if val == ProjectMenuListData.activities.rawValue {
                moveToActivityScreen()
            } else if val == ProjectMenuListData.projectReport.rawValue {
                moveToProjectReportScreen()
            } else if val == ProjectMenuListData.caseStudies.rawValue {
            } else if val == ProjectMenuListData.documents.rawValue {
                moveToDocuments()
            } else if val == ProjectMenuListData.gallery.rawValue {
                moveToProjectReportGalleryScreen()
            } else if val == ProjectMenuListData.contactDetails.rawValue {
                moveToContactDetail()
            } else if val == ProjectMenuListData.projectBudget.rawValue {
                moveToProjectBudgetScreen()
            } else if val == ProjectMenuListData.budgetUtilization.rawValue {
            } else if val == ProjectMenuListData.progressReporting.rawValue {
                moveToProgressReportingScreen()
            } else if val == ProjectMenuListData.monthlyReport.rawValue {
                moveToProjectMonthlyReportScreen()
            } else if val == ProjectMenuListData.projectOverview.rawValue {
                moveToProjectOverviewScreen()
            } else if val == ProjectMenuListData.demoProgressReport.rawValue {
                moveToDemoProgressReportScreen()
            }
        } else {
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == projectMenuCollectionView {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        } else {
            if projectsdg?.count ?? 0 == 1 {
                let width = (collectionView.bounds.width - 100) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if projectsdg?.count ?? 0 == 2 {
                let width = (collectionView.bounds.width - 200 - 20) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if projectsdg?.count ?? 0 == 3 {
                let width = (collectionView.bounds.width - 300 - 30) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //        if indexPath.item == 2 {
        //            return CGSize(width: 0, height: 0)
        //        } else {
        
        if collectionView == projectMenuCollectionView {
            let noOfCellsInRow = 3   //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 95)
        } else {
            return CGSize(width: 100, height: 100)
        }
        //        }
    }
    
}
