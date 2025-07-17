//
//  SideMenuMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 13/02/24.
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: Cell.sideMenuCell)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if showFinancialYearView {
            return 1
        } else {
            return headerSection.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showFinancialYearView {
            return financialYearList.count
        } else {
            if section == 0 { // overview
                return 4
            } else if section == 1 { // project
                return 1
            } else if section == 2 { // Due Diligence
                return 2
            } else if section == 3 { // Report & Gallery
                return 2
            } else if section == 4 { // Compliance
                return 1
            } else if section == 5 { // Admin Module
                return 2
            } else if section == 6 { // Other
                return 1
            } else if section == 7 { // Version
                return 1
            } else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.sideMenuCell, for: indexPath) as? SideMenuTableViewCell else {
            return UITableViewCell()
        }
        if showFinancialYearView {
            cell.iconImageView.isHidden = true
            cell.titleLabel.text = financialYearList[indexPath.row].financialYear
        } else {
            cell.iconImageView.isHidden = false
            
            switch indexPath.section {
            case 0:
                cell.titleLabel.text = dashboardMenuList[indexPath.row].rawValue
                cell.iconImageView.image = dashboardMenuList[indexPath.row].image
                cell.iconImageView.tintColor = .black
                break
            case 1:
                cell.titleLabel.text = "My Project"
                cell.iconImageView.image = UIImage(named: "overview")
                break
            case 2:
                if indexPath.row == 0 { // NGO Proposals
                    cell.titleLabel.text = "NGO Proposals"
                    cell.iconImageView.image = UIImage(named: "proposals")
                } else if indexPath.row == 1 { // Implementing Partners
                    cell.titleLabel.text = "Implementing Partners"
                    cell.iconImageView.image = UIImage(named: "partners")
                }
                break
            case 3:
                if indexPath.row == 0 { // Reports
                    cell.titleLabel.text = "Reports"
                    cell.iconImageView.image = UIImage(named: "reports")
                } else if indexPath.row == 1 { // Gallery
                    cell.titleLabel.text = "Gallery"
                    cell.iconImageView.image = UIImage(named: "gallery")
                }
                break
            case 4:
                cell.titleLabel.text = "CSR Knowledge Base"
                cell.iconImageView.image = UIImage(named: "knowlwedge_base")
                break
            case 5:
                if indexPath.row == 0 { // All Users
                    cell.titleLabel.text = "All Users"
                    cell.iconImageView.image = UIImage(named: "all_users")
                } else if indexPath.row == 1 { // Company Profile
                    cell.titleLabel.text = "Company Profile"
                    cell.iconImageView.image = UIImage(named: "company_profile")
                }
                break
            case 6:
                cell.titleLabel.text = "Log Out"
                cell.iconImageView.image = UIImage(named: "logout")
                break
            case 7:
                cell.iconImageView.isHidden = true
                cell.titleLabel.text = "V" + getAppVersion() + " / 19-06-2021"
                break
                
            default:
                break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !showFinancialYearView {
            switch section {
            case 0:
                return "  " + HeaderScection.dashboard.rawValue
            case 1:
                return "  " + HeaderScection.project.rawValue
            case 2:
                return "  " + HeaderScection.dueDiligence.rawValue
            case 3:
                return "  " + HeaderScection.reportGallery.rawValue
            case 4:
                return "  " + HeaderScection.compliance.rawValue
            case 5:
                return "  " + HeaderScection.adminModule.rawValue
            case 6:
                return "  " + HeaderScection.others.rawValue
            case 7:
                return "  " + HeaderScection.version.rawValue
            default:
                return ""
            }
        } else {
            return "  Financial Years"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && !showFinancialYearView {
            switch indexPath.section {
            case 0: // dashboard
                if indexPath.row == 0 { // OverView
                    if menuLists?[0].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                } else if indexPath.row == 1 { // Budget
                    if menuLists?[3].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                } else if indexPath.row == 2 { // Progress Reporting
                    if menuLists?[11].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                } else if indexPath.row == 3 { // Sdg
                    if menuLists?[8].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                }
            case 1: // project
                if menuLists?[1].access == 1 {
                    return UITableView.automaticDimension
                } else {
                    return 0
                }
            case 2: // dueDiligence
                if indexPath.row == 0 { // Ngo Proposals
                    if menuLists?[9].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                } else { // Implementing Partners
                    if menuLists?[2].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                }
            case 3: // reportGallery
                if indexPath.row == 0 { // Report
                    if menuLists?[4].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                } else { // Gallery
                    if menuLists?[10].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                }
            case 4: // compliance
                if menuLists?[6].access == 1 { // CSR Knowledge Base
                    return UITableView.automaticDimension
                } else {
                    return 0
                }
            case 5: // adminModule
                if indexPath.row == 0 { // All Users
                    if menuLists?[7].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                } else { // Company Profile
                    if menuLists?[5].access == 1 {
                        return UITableView.automaticDimension
                    } else {
                        return 0
                    }
                }
            case 6: // others
                return UITableView.automaticDimension
            case 7: // version
                return UITableView.automaticDimension
            default:
                return UITableView.automaticDimension
            }
            //        }
        } else {
            return UITableView.automaticDimension
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if showFinancialYearView { // Change financial year
            debugPrint("selectedFinancialId:::\(selectedFinancialId)")
            selectedFinancialId = financialYearList[indexPath.row].financialYearId ?? 0
            selectedFinancialYear = financialYearList[indexPath.row].financialYear ?? ""
            financialYearButton.setTitle(selectedFinancialYear, for: .normal)
            Utils.shared.saveFinancialYearId(selectedFinancialId)
            closeMenu(animation: true, isFormChangeYear: true)
        } else {
            switch indexPath.section {
            case 0:
                if indexPath.row == 0 { // Home
                    moveToHomeScreen()
                } else if indexPath.row == 1 { // Budget
                    moveToBudgetScreen()
                } else if indexPath.row == 2 { // Progress Reporting
                    moveToActivityProgressScreen()
                } else if indexPath.row == 3 { // SDG
                    moveToSDGScreen()
                }
                break
            case 1:
                moveToMyProjectScreen() // My Project
                break
            case 2:
                if indexPath.row == 0 { // NGO Proposals
                    moveToNgoView()
                } else if indexPath.row == 1 { // Implementing Partners
                    moveToImplementingPartnersScreen()
                }
                break
            case 3:
                if indexPath.row == 0 { // Reports
                    moveToReportcreen()
                } else if indexPath.row == 1 { // Gallery
                    moveToGalleryView()
                }
                break
            case 4:
                moveToCSRKnowledgeBaseScreen() // SCR Knowledge Base
                break
            case 5:
                if indexPath.row == 0 { // All Users
                    moveToAllUsersScreen()
                } else if indexPath.row == 1 { // Company Profile
                    moveToCompanyProfileScreen()
                }
                break
            case 6:
                moveToLoginScreen() // Log out
                break
            case 7:
                // Version
                break
            default:
                break
            }
            closeMenu(animation: true, isFormChangeYear: false)
        }
        
    }
}
