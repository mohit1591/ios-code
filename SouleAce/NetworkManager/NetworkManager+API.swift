//
//  NetworkManager+API.swift
//  TasteMaker
//
//  Created by ideveloper1 on 31/03/21.
//

import Foundation
import UIKit

extension NetworkManager {
    
    func handleResponse(result: Any?, complition: ((_ response: [String: Any]) -> Void)) {
        if let data = result as? [String: Any] {
            if let status = data["status"] as? Bool {
                if status == false {
                    Utils.hideSpinner()
                    Utils.alert(message: data["msg"] as? String ?? "")
                } else {
                    complition(data)
                }
            } else if let error = data["errors"] as? String {
                
                Utils.hideSpinner()
                
                if error == "Unauthorized" {
                    Utils.alert(message: "login again")
                } else {
                    Utils.alert(message: error)
                }
                
            } else {
                complition(data)
            }
        } else {
            Utils.hideSpinner()
            Utils.alert(message: "Something went wrong.")
        }
    }
    
    func loginApi(param: [String: Any], complition: @escaping(() -> Void)) {
        
        NetworkManager.shared.requestPost(path: API.login.rawValue, params: param, contentType: .formUrlencoded) { (result, error, _) in
            if error == nil {
                print(result)
                self.handleResponse(result: result) { (value) in
                    let token = value["access_token"] as? String
                    if token?.count ?? 0 > 0 {
                        Utils.shared.saveAccessToken(token ?? "")
                    }
                    if let info = value["data"] as? [String: Any] {
                        let userInfo: User? = self.decodeObject(fromData: info)
                        Utils.shared.saveUserLogedIn(true)
                        Utils.shared.saveAuthorizedUserInfo(userInfo)
                        Utils.shared.saveUserLogedIn(true)
                    }
                    complition()
                }
            } else {
                Utils.hideSpinner()
                Utils.alert(message: error?.localizedDescription ?? "")
            }
        }
    }
    
    func getMenuVisibleListApi(complition: @escaping((_ result: MenuShowDeials?) -> Void)) {
        
        NetworkManager.shared.requestGet(path: API.masterData.rawValue, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let info = value["data"] as? [String: Any] {
                        let menuList: MenuShowDeials? = self.decodeObject(fromData: info)
                        complition(menuList)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getFinancialYearListAPI(complition: @escaping((_ result: [FinancialYearData]?) -> Void)) {
        var apiURL = API.financialYearList.rawValue
        let user = Utils.shared.getAuthorizedUserInfo()
        let corporateId = "\(user?.corporateId ?? -1)"
        apiURL = apiURL + corporateId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: [FinancialYearData]? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getDashboardDataAPI(financeYearId: Int, complition: @escaping((_ result: DashboardData?) -> Void)) {
        var apiURL = API.corpCorporateDashboard.rawValue
        let corporateId = "\(financeYearId)"
        apiURL = apiURL + corporateId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: DashboardData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getMyProjectsAPI(financeYearId: Int, page: Int, complition: @escaping((_ result: MyProjectsData?) -> Void)) {
        var apiURL = API.corpProjectLists.rawValue
        let corporateId = "\(financeYearId)"
        apiURL = apiURL + corporateId + "?page=" + "\(page)"
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if value["data"] is [String: Any] {
                        let value: MyProjectsData? = self.decodeObject(fromData: value)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getProjectDetailAPI(projectId: Int, complition: @escaping((_ result: ProjectDetailsData?) -> Void)) {
        var apiURL = API.projectDetail.rawValue
        let projectId = "\(projectId)"
        apiURL = apiURL + projectId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let value: ProjectDetailsData? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getSDGApi(complition: @escaping((_ result: SdgsData?) -> Void)) {
        
        NetworkManager.shared.requestGet(path: API.corpSdg.rawValue, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let value: SdgsData? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getReportMenuApi(complition: @escaping((_ result: [ReportFilterData]?) -> Void)) {
        
        NetworkManager.shared.requestGet(path: API.reportsMenu.rawValue, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [ReportFilterData]? = self.decodeObject(fromData: data)
                        complition(value)
                    } else {
                        Utils.hideSpinner()
                        Utils.alert(message: "Error")
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getReportApi(filterId: String, complition: @escaping((_ result: [ReportData]?) -> Void)) {
        
        var api = API.corporateReports.rawValue
        api = api + filterId + "/" + "\(selectedFinancialId)"
        
        NetworkManager.shared.requestGet(path: api, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [ReportData]? = self.decodeObject(fromData: data)
                        complition(value)
                    } else {
                        Utils.hideSpinner()
                        Utils.alert(message: "Error")
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getReportGalleryAPI(pId: String, type: String, complition: @escaping((_ result: AlbumsData?) -> Void)) {
        var apiURL = API.projectReportGallery.rawValue
        apiURL = apiURL + pId + "/" + type
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let value: AlbumsData? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getGalleryAPI(filterId: String, type: String, complition: @escaping((_ result: [GalleryData]?) -> Void)) {
        var apiURL = API.corporateGallery.rawValue
        apiURL = apiURL + type + "/" + filterId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [GalleryData]? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getProjectBudgetAPI(projectId: String, corporateId: String, complition: @escaping((_ result: BudgetData?) -> Void)) {
        
        var apiURL = API.corpBudget.rawValue
        apiURL = apiURL + corporateId + "/" + "\(selectedFinancialId)" + "/1"
        apiURL = apiURL + "/" + projectId
        
        NetworkManager.shared.requestPost(path: apiURL, params: [:], contentType: .applicationJson, resultHandler: { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: BudgetData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        })
    }
    
    func getProjectOverViewAPI(projectId: String, complition: @escaping((_ result: ProjectOverviewData?) -> Void)) {
        
        var apiURL = API.projectOverview.rawValue
        apiURL = apiURL + projectId + "/" + "\(selectedFinancialId)"
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:], resultHandler: { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: ProjectOverviewData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        })
    }
    
    func getProjectReportAPI(projectId: String, type: String, complition: @escaping((_ result: ProjectReportData?) -> Void)) {
        var apiURL = API.projectReports.rawValue
        apiURL = apiURL + projectId + "/" + type
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let value: ProjectReportData? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getProjectMonthlyReportAPI(projectId: String, type: String, finYearId: String, complition: @escaping((_ result: [ProjectMonthlyData]?) -> Void)) {
        var apiURL = API.monthlyReport.rawValue
        apiURL = apiURL + projectId + "/" + type + "/" + finYearId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [ProjectMonthlyData]? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getProjectOverallReportAPI(projectId: String, finYearId: String, complition: @escaping((_ result: [ProjectMonthlyData]?) -> Void)) {
        var apiURL = API.monthlyReportTargetAchievement.rawValue
        apiURL = apiURL + projectId + "/" + finYearId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [ProjectMonthlyData]? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getProjectBudgetReportAPI(projectId: String, finYearId: String, complition: @escaping((_ result: [ProjectMonthlyData]?) -> Void)) {
        var apiURL = API.monthlyReportTargetAchievement.rawValue
        apiURL = apiURL + projectId + "/" + finYearId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [ProjectMonthlyData]? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getGalleryCategoryAPI(albumId: String, type: String, complition: @escaping((_ result: [GalleryData]?) -> Void)) {
        var apiURL = API.corporateGalleryCategory.rawValue
        apiURL = apiURL + type + "/" + albumId
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let value: [GalleryData]? = self.decodeObject(fromData: data)
                        complition(value)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
                
            }
        }
    }
    
    func getBudgetAPI(complition: @escaping((_ result: BudgetData?) -> Void)) {
        var apiURL = API.corpBudget.rawValue
        let user = Utils.shared.getAuthorizedUserInfo()
        let corporateId = "\(user?.corporateId ?? -1)"
        apiURL = apiURL + corporateId + "/" + "\(selectedFinancialId)" + "/1"
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: BudgetData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getActivityProgressAPI(complition: @escaping((_ result: ProjectProgressData?) -> Void)) {
        var apiURL = API.overallActivityProgress.rawValue
        let user = Utils.shared.getAuthorizedUserInfo()
        let corporateId = "\(user?.corporateId ?? -1)"
        let financialYearId = Utils.shared.getFinancialYearId()
        apiURL = "\(apiURL)\(corporateId)/\(financialYearId)"
        print("URL:::::\(apiURL)")
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: ProjectProgressData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getRFPListAPI(complition: @escaping((_ result: [RFPData]?) -> Void)) {
        let apiURL = API.corporateRfpList.rawValue
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: [RFPData]? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getCompanyDetailAPI(complition: @escaping((_ result: CompanyProfileDetails?) -> Void)) {
        let apiURL = API.companyProfile.rawValue
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: CompanyProfileDetails? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getDocumentDetailsAPI(param: String, complition: @escaping((_ result: [DocumentsDetails]?) -> Void)) {
        var apiURL = API.corporateProjectsDocuments.rawValue
        apiURL = apiURL + param
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in    
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: [DocumentsDetails]? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getDocumentFolderAPI(param: String, complition: @escaping((_ result: [DocumentsDetails]?) -> Void)) {
        var apiURL = API.projDocDrectoryListings.rawValue
        apiURL = apiURL + param
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: [DocumentsDetails]? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getNgoContactDetailsAPI(projectId: String, param: String, complition: @escaping((_ result: [NgoContactData]?) -> Void)) {
        var apiURL = API.ngoContact.rawValue
        apiURL = apiURL + projectId
        
        if param != "" {
            apiURL = apiURL + "?" + param
        }
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: [NgoContactData]? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getProjectActivityAPI(page: String ,projectType: String, projectId: String, complition: @escaping((_ result: ActivitiesData?) -> Void)) {
        var apiURL = API.projectActivities.rawValue
            apiURL = apiURL + projectId + "/" + projectType + page
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: ActivitiesData? = self.decodeObject(fromData: value)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getMeetingActivityAPI(page: String ,projectType: String, projectId: String, param: String, complition: @escaping((_ result: ActivitiesData?) -> Void)) {
        var apiURL = API.meetings.rawValue
        
        if param != "" {
            apiURL = apiURL + projectId + "/" + projectType + param + page
        } else {
            apiURL = apiURL + projectId + "/" + projectType + page
        }
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: ActivitiesData? = self.decodeObject(fromData: value)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getActivityDetailAPI(activityId: String, projectId: String, complition: @escaping((_ result: ActivityDetailsData?) -> Void)) {
        var apiURL = API.activitieView.rawValue
        apiURL = apiURL + projectId + "/" + activityId
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: ActivityDetailsData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getActivityProgressAPI( projectId: String, complition: @escaping((_ result: ActivityProgressReportingData?) -> Void)) {
        var apiURL = API.projectActivityProgress.rawValue
        apiURL = apiURL + projectId
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: ActivityProgressReportingData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getDemoComplitionProgressReportAPI(projectId: String, tabId: String, complition: @escaping((_ result: ComplitionWiseData?) -> Void)) {
        var apiURL = API.demoProgressReport.rawValue
        apiURL = apiURL + projectId + "/" + "\(selectedFinancialId)" + "/" + tabId
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: ComplitionWiseData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getDemoActivityProgressReportAPI(projectId: String, tabId: String, complition: @escaping((_ result: ActivityWiseData?) -> Void)) {
        var apiURL = API.demoProgressReport.rawValue
        apiURL = apiURL + projectId + "/" + "\(selectedFinancialId)" + "/" + tabId
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: ActivityWiseData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getMeetingDetailAPI(meetingId: String, projectId: String, complition: @escaping((_ result: MeetingDetailData?) -> Void)) {
        var apiURL = API.meetingView.rawValue
        apiURL = apiURL + projectId + "/" + meetingId
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        let list: MeetingDetailData? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getNgoProposalAPI(filters: String?, complition: @escaping((_ result: NgodataModel?) -> Void)) {
        
        var apiURL = API.corporateNGOApplications.rawValue
       
        if filters != nil {
            apiURL = apiURL + (filters ?? "")
        }
        
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if value["data"] is [Any] {
                        let list: NgodataModel? = self.decodeObject(fromData: value)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getNgoProposalSearchAPI(complition: @escaping((_ result: Filtersdata?) -> Void)) {
        
        let apiURL = API.corporateNGOApplicationsSearchVal.rawValue
       
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in

                    let list: Filtersdata? = self.decodeObject(fromData: value)
                        complition(list)
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getCSRKnowledgeBaseAPI(complition: @escaping((_ result: [CSRData]?) -> Void)) {
        
        let apiURL = API.corporateCSRKnowledgeBase.rawValue
       
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                        let list: [CSRData]? = self.decodeObject(fromData: data)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getImplementingPartnersAPI(param: String?, complition: @escaping((_ result: NgosData?) -> Void)) {
        
        var apiURL = API.corpImplementingPartnersLists.rawValue
        
        if param != nil {
            apiURL = apiURL + "?" + (param ?? "")
        }
       
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                            let list: NgosData? = self.decodeObject(fromData: data)
                            complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getAllUsersAPI(param: String?, complition: @escaping((_ result: AllUsersData?) -> Void)) {
        
        var apiURL = API.allUsers.rawValue
        apiURL = apiURL + (param ?? "")
       
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [Any] {
                            let list: AllUsersData? = self.decodeObject(fromData: value)
                            complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getImplementingPartnersDetailsAPI(corporateId: String, partnerId: String, complition: @escaping((_ result: ImplementingPartnerDetailsData?) -> Void)) {
        
        var apiURL = API.corpImplementingPartnersDetails.rawValue
        let user = Utils.shared.getAuthorizedUserInfo()
        let userCorporateId = "\(user?.corporateId ?? -1)"
        apiURL = apiURL + partnerId + "/" + userCorporateId
               
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if let data = value["data"] as? [String: Any] {
                        debugPrint("data:::\(data)")
                            let list: ImplementingPartnerDetailsData? = self.decodeObject(fromData: data)
                        debugPrint("list:::\(list)")
                            complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    func getNgoApplicationAPI(ngoApplicationId: String?, complition: @escaping((_ result: NgoApplicationData?) -> Void)) {
        
        var apiURL = API.corporateViewNGOApplications.rawValue
        apiURL = apiURL + (ngoApplicationId ?? "")
       
        NetworkManager.shared.requestGet(path: apiURL, params: [:]) { (result, error, statusCode) in
            if error == nil {
                self.handleResponse(result: result) { (value) in
                    if value["data"] is [String: Any] {
                        let list: NgoApplicationData? = self.decodeObject(fromData: value)
                        complition(list)
                    }
                }
            } else {
                if statusCode == 401 {
                    if Utils.shared.didSessionEnd() {
                        self.logout(message: error?.localizedDescription ?? "")
                    }
                    Utils.hideSpinner()
                } else {
                    Utils.hideSpinner()
                    Utils.alert(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
        
    func logout(message: String) {
        Utils.shared.resetUserData()
        Utils.shared.saveUserLogedIn(false)
        Utils.alert(message: message)
        Utils.shared.setSession(false)
        AppDelegate.shared?.setAuthorizationStoryBoard()
    }
    
    func handleError(_ message: String) {
        Utils.hideSpinner()
        if !message.isEmpty {
            Utils.alert(message: message)
        }
    }
    
    func decodeObject<T: Decodable>(fromData data: Any?) -> T? {
        if let data = data {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .secondsSince1970
            do {
                let object = try jsonDecoder.decode(
                    T.self, from: JSONSerialization.data(withJSONObject: data, options: [])
                ) as T?
                return object
            }catch{
                print("decoding Unexpected error: \(error).")
            }
        }
        return nil
    }
}
