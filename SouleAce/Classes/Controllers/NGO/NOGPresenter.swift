//
//  NOGPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import Foundation
import UIKit

extension NGOViewController {
    
    func getRfcList() {
        Utils.showSpinner()
        NetworkManager.shared.getRFPListAPI(complition: { [self] value in
            rfpData = value
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
    func getNgoApplication(isFromFilter: Bool) {
        Utils.showSpinner()
        var filters : String? = nil
        if isFromFilter {
            filters = "?stages_id=\(stageId)&state=\(stateId)&theme=\(themeId)&budget=\(budgetId)&status=\(statusId)"
        }
        NetworkManager.shared.getNgoProposalAPI(filters: filters, complition: { [self] value in
            ngoHeader = value?.header_data
            ngodata = value?.data
            tableView.reloadData()
            filterButtonView.isHidden = false
            Utils.hideSpinner()
        })
    }
    
    func getFiltersValue() {
        NetworkManager.shared.getNgoProposalSearchAPI(complition: { [self] value in
            
            getFilterBudgetData()
            getFilterStateData()
            
            setupDropDowns()
            
            stageData = value?.stage_data ?? []
            themes = value?.themes ?? []
            rfpStatus = value?.rfp_status ?? []
            
            self.themeDropDown.optionArray = self.themes.map({ value in
                return value.name ?? ""
            })
            
            self.themeDropDown.optionIds = self.themes.map({ value in
                return value.theme_id ?? 0
            })

            self.stageDropDown.optionArray = self.stageData.map({ value in
                return value.stage_name ?? ""
            })
            
            self.stageDropDown.optionIds = self.stageData.map({ value in
                return value.stage_id ?? 0
            })
            
            self.statusDropDown.optionArray = self.rfpStatus.map({ value in
                return value.proposal_status ?? ""
            })
            
            self.statusDropDown.optionIds = self.rfpStatus.map({ value in
                return value.proposal_status_id ?? 0
            })
                        
        })
    }

    func getFilterBudgetData() {
        // Read the JSON data from the file
        if let path = Bundle.main.path(forResource: "FilterBudget", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    if let dataArray = jsonResult["data"] as? [Any] {
                        budget = NetworkManager.shared.self.decodeObject(fromData: dataArray) ?? []
                        self.budgetDropDown.optionArray = self.budget.map({ value in
                            return value.name ?? ""
                        })
                        
                        self.budgetDropDown.optionIds = self.budget.map({ value in
                            return value.id ?? 0
                        })
                                                
                    } else {
                        print("Failed to parse JSON data.")
                    }
                }
            } catch {
                // Handle error
                print("Error: \(error)")
            }
        } else {
            print("No file found at specified path.")
        }
    }
    
    func getFilterStateData() {
        // Read the JSON data from the file
        if let path = Bundle.main.path(forResource: "FilterState", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    if let dataArray = jsonResult["data"] as? [Any] {
                        state = NetworkManager.shared.self.decodeObject(fromData: dataArray) ?? []
                        self.stateDropDown.optionArray = self.state.map({ value in
                            return value.name ?? ""
                        })
                        
                        self.stateDropDown.optionIds = self.state.map({ value in
                            return value.id ?? 0
                        })
                    } else {
                        print("Failed to parse JSON data.")
                    }
                } else {
                    print("Error")
                }
            } catch {
                // Handle error
                print("Error: \(error)")
            }
        } else {
            print("No file found at specified path.")
        }
    }
    
}
