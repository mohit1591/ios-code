//
//  ActivityMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import Foundation
import UIKit

extension ActivityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if selectedTabId == "2" {
            return 3
        } else {
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 { // Meeting Details
            return activity?.count ?? 0
        } else if section == 1 {
            if selectedTabId == "2" { // Search View
                return 1
            } else { // Activity Details
                return activity?.count ?? 0
            }
        } else if section == 0 { // Project Details
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.contactHeaderTableViewCell, for: indexPath) as? ContactHeaderTableViewCell else { return UITableViewCell() }
            cell.projectNameLabel.text = projectName
            cell.implementingPartnerLabel.text = implementingPartner
            cell.yearLabel.text = "Year \(selectedFinancialYear)"
            return cell
        } else {
            if selectedTabId == "2" {
                if indexPath.section == 2 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.activityTableViewCell, for: indexPath) as? ActivityTableViewCell else { return UITableViewCell() }
                        cell.fillMeetingCell(data: activity?[indexPath.row])
                    
                    cell.handleKnowMoreAction = { [self] in
                        moveToActivityDetails(data: activity?[indexPath.row], isFromMeeting: true)
                    }
                    
                    return cell
                } else {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.searchTableViewCell, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
                    cell.handleSearchAction = { [self] in
                        searchText = cell.searchTextField.text ?? ""
                        getMeetingData(page: 1)
                    }
                    return cell
                }
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.activityTableViewCell, for: indexPath) as? ActivityTableViewCell else { return UITableViewCell() }
                if selectedTabId == "3" {
                    cell.fillPastCell(data: activity?[indexPath.row])
                } else if selectedTabId == "1" {
                    cell.fillUpcommingCell(data: activity?[indexPath.row])
                }
                
                cell.handleKnowMoreAction = { [self] in
                    moveToActivityDetails(data: activity?[indexPath.row], isFromMeeting: false)
                }
                
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (activity?.count ?? 0) - 1 {
            if activityData?.has_more ?? false {
                currentPage += 1
                getPartnersData()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            if selectedTabId == "2" && indexPath.section == 2 {
                moveToActivityDetails(data: activity?[indexPath.row], isFromMeeting: true)
            } else {
                moveToActivityDetails(data: activity?[indexPath.row], isFromMeeting: false)
            }
        }
    }
    
    
}
