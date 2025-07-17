//
//  DashboardPresent.swift
//  SouleAce
//
//  Created by ideveloper7 on 09/02/24.
//

import Foundation
import SDWebImage

extension DashboardViewController {
    
    func getFinancialYearList() {
        Utils.showSpinner()
        NetworkManager.shared.getFinancialYearListAPI(complition: { [self] list in
            financialYearList = list ?? []
            if selectedFinancialId == 0 {
                selectedFinancialId = financialYearList.first?.financialYearId ?? 0
                selectedFinancialYear = financialYearList.first?.financialYear ?? "1321"
                Utils.shared.saveFinancialYearId(selectedFinancialId)
                
            }
            getDashboardData(financeYearId: selectedFinancialId)
        })
    }
    
    func getDashboardData(financeYearId: Int) {
        Utils.showSpinner()
        NetworkManager.shared.getDashboardDataAPI(financeYearId: financeYearId, complition: { [self] data in
            let logo = URL(string: data?.corporate_logo ?? "")
            debugPrint("impacts ::\(data?.impacts)")
//            logoImageView.sd_setImage(with: logo)
            logoImageView.sd_setImage(with: logo) { [self] (image, error, cache, urls) in
                        if (error != nil) {
                            // Failed to load image
                            logoImageView.image = UIImage(named: "Login")
                        } else {
                            // Successful in loading image
                            logoImageView.image = image
                        }
                    }
            projectSummary = data?.projectSummary
            beneficiaryInformation = data?.beneficiaryInformation
            projectLocations = data?.projectLocations
            projectBudget = data?.projectBudget
            activity = data?.activity
            thematicAreas = data?.thematic_areas
            sdgData = data?.sdg_data
            impacts = data?.impacts
            debugPrint("impacts transfer:::\(impacts)")
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
    
    func getVisibleMenuList() {
        NetworkManager.shared.getMenuVisibleListApi(complition: { list in
            print(list as Any)
            menuShowDeials = list
            menuLists = list?.menuLists
            projectMenulists = list?.projectMenulists ?? []
            self.sideMenuController?.tableView.reloadData()
        })
    }
    
}
