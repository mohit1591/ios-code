//
//  AllUsersPresenter.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import Foundation

extension AllUsersViewController {
//    &username=&first_name=&mobile_no=&user_status=0&user_type=0&project_name=
    func getPartnersData(isFilter: Bool) {
        Utils.showSpinner()
        var param: String = "page=\(currentPage)"
        if isFilter {
            switch selectedFilter {
            case .userId:
                userId = searchUserTextField.text ?? ""
                param = param + "&username=\(userId)"
                break
            case .userName:
                userName = searchUserTextField.text ?? ""
                param = param + "&first_name=\(userName)"
                break
            case .mobileNo:
                mobileNo = searchUserTextField.text ?? ""
                param = param + "&mobile_no=\(mobileNo)"
                break
            case .projectName:
                projectName = searchUserTextField.text ?? ""
                param = param + "&project_name=\(projectName)"
                break
            }
        }
      
        NetworkManager.shared.getAllUsersAPI(param: param, complition: { [self] value in
            print(value as Any)
            allUserData = value
            if currentPage == 1 {
                allUser = value?.data
            } else {
                if value?.data?.count ?? 0 > 0 {
                    if allUser?.count ?? 0 > 0 {
                        allUser! += (value?.data)!
                    } else {
                        allUser = value?.data
                    }
                }
            }
          
            tableView.reloadData()
            Utils.hideSpinner()
        })
    }
}
