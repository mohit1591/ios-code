//
//  ActivityDetailPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation

extension ActivityDetailViewController {
    
    func getActivityDetailData() {
        Utils.showSpinner()
        NetworkManager.shared.getActivityDetailAPI(activityId: "\(data?.activity_id ?? 0)", projectId: projectId, complition: { [self] value in
            allPhotos = value?.getallPhotos
            activityDetails = value?.activity_details
            collectionView.reloadData()
            
            let totalRows = Int(ceil(Double(allPhotos?.count ?? 0 / 3)))  // Int(allPhotos?.count ?? 0) / 3
            let spacing = totalRows * 8
            
            
            var height = (totalRows * 120) + (spacing)
            
            if height == 0 {
                height = 128
            }
            
            collectionHeightConstraint.constant = CGFloat(height)
            self.view.layoutIfNeeded()
            Utils.hideSpinner()
        })
    }
    
    func getMeetingDetailData() {
        Utils.showSpinner()
        NetworkManager.shared.getMeetingDetailAPI(meetingId: "\(data?.meetings_id ?? 0)", projectId: projectId, complition: { [self] value in
            
            meetingPeople = value?.meetingPeople
            
            noOfPeoples = "\(value?.no_of_people ?? 0)"
            endTimeLabel.text = noOfPeoples
            tableView.reloadData()
            
            let height = ((meetingPeople?.count ?? 0) * 115)
            
            tableHeightConstraint.constant = CGFloat(height)
            self.view.layoutIfNeeded()
            
            Utils.hideSpinner()
        })
    }
    
}
