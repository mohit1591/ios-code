//
//  DashboardMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 09/02/24.
//

import Foundation
import UIKit

// MARK: - UITableViewDataSource, UITableViewDelegate

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 7 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.dashboardSDGSCell, for: indexPath) as? DashboardSDGSCell else { return UITableViewCell() }
            cell.sdgData = sdgData
            cell.headerImageView.image = UIImage(named: "ic_sdg")
            cell.hearderLabel.text = "SDGs"
            cell.collectionHeightConstraint.constant = CGFloat(100)
            cell.collectionView.layoutSubviews()
            cell.collectionView.reloadData()
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.dashBoardTableCell, for: indexPath) as? DashboardTableViewCell else { return UITableViewCell() }
        cell.projectSummary = projectSummary
        cell.beneficiaryInformation = beneficiaryInformation
        cell.projectLocations = projectLocations
        cell.projectBudget = projectBudget
        cell.activity = activity
        cell.thematicAreas = thematicAreas
        cell.sdgData = sdgData
        cell.impacts = impacts
        cell.collectionView.isScrollEnabled = false
        if indexPath.row == 0 {
            cell.currentDashboardData = DashboardList.projectSummary
            cell.headerImageView.image = UIImage(named: "ic_project_summary")
            cell.hearderLabel.text = "Project Summary"
        } else if indexPath.row == 1 {
            cell.currentDashboardData = DashboardList.beneficaryInformation
            cell.headerImageView.image = UIImage(named: "ic_person")
            cell.hearderLabel.text = "Beneficiary Information"
        } else if indexPath.row == 2 {
            cell.currentDashboardData = DashboardList.projectLocation
            cell.headerImageView.image = UIImage(named: "ic_location")
            cell.hearderLabel.text = "Project Locations / Geography"
        } else if indexPath.row == 3 {
            cell.currentDashboardData = DashboardList.projectBudget
            cell.headerImageView.image = UIImage(named: "ic_rupee")
            cell.hearderLabel.text = "Project Budget"
        } else if indexPath.row == 4 {
            cell.currentDashboardData = DashboardList.projectActivityDetails
            cell.headerImageView.image = UIImage(named: "ic_my_projects")
            cell.hearderLabel.text = "Project Activity"
        } else if indexPath.row == 5 {
            cell.currentDashboardData = DashboardList.projectThematicAreas
            cell.headerImageView.image = UIImage(named: "ic_thematic_areas")
            cell.hearderLabel.text = "Project Thematic Areas"
        }else if indexPath.row == 6 {
            cell.currentDashboardData = DashboardList.impacts
            cell.headerImageView.image = UIImage(named: "ic_my_projects")
            cell.hearderLabel.text = "Impacts"
        }
        cell.collectionViewHeight()
        cell.collectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 || indexPath.row == 1 {
            return 0
        } else {
            return UITableView.automaticDimension
        }
    }
}
