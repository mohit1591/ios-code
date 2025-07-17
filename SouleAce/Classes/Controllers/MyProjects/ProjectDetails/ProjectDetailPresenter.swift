//
//  ProjectDetailPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/02/24.
//

import Foundation
import UIKit

extension ProjectDetailViewController {
    
    func getProjectDetail() {
        Utils.showSpinner()
        NetworkManager.shared.getProjectDetailAPI(projectId: projectId) { [self] result in
            Utils.hideSpinner()
            projectDetails = result?.projects
            projectsdg = result?.sdg_data
            updateDetails()
        }
    }
    
    func updateDetails() {
        
        themeName.text = projectDetails?.projectName
        projectSummary.text = projectDetails?.project_summary
        stateLabel.text = projectDetails?.states
        districtLabel.text = projectDetails?.districts
        budgetLabel.text = "Rs.\(projectDetails?.total_project_budget?.convertIntToCrString() ?? "")Cr"
        durationLabel.text = "\(projectDetails?.project_duration ?? 0) Years"
        natureOfProjectLabel.text = projectDetails?.themeName
        financialNatureLabel.text = projectDetails?.financial_nature
        targetBeneficiariesLabel.text = projectDetails?.target_beneficiaries
        frequencyOfServicesLabel.text = projectDetails?.frequency_of_service
        collectionView.reloadData()
    }
    
}
