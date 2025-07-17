//
//  DemoProgressReportMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/03/24.
//

import Foundation
import UIKit

extension DemoProgressReportViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isActivitySelected {
            return (progressReport?.count ?? 0) == 0 ? 0 : ((progressReport?.count ?? 0) + 1)
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isActivitySelected {
            if section == 0 {
                return 1
            } else {
                return 1
//                var isShow = false
//                isShow = showSection?.contains(section) ?? false
//                if isShow {
//                    return 1
//                } else {
//                    return 0
//                }
            }
        } else {
            return complitiondata?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !isActivitySelected {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.completionProgressReportTableViewCell, for: indexPath) as? CompletionProgressReportTableViewCell else { return UITableViewCell() }
                        cell.fillCell(data: complitiondata?[indexPath.row])
            return cell
        } else {
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.progressReportingDetailTableViewCell, for: indexPath) as? ProgressReportingDetailTableViewCell else { return UITableViewCell() }
                                cell.fillCell(data: blocks)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.activityProgressReportTableViewCell, for: indexPath) as? ActivityProgressReportTableViewCell else { return UITableViewCell() }
                let sectionNo = indexPath.section - 1
                var isShow = false
                let section = indexPath.section
                isShow = showSection?.contains(section) ?? false
                if isShow {
                    let image = UIImage(systemName: "chevron.up.circle")
                    cell.activityHideShowButton.setImage(image, for: .normal)
//                    cell.activityMainView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 0)
                } else {
                    let image = UIImage(systemName: "chevron.down.circle")
                    cell.activityHideShowButton.setImage(image, for: .normal)
//                    cell.activityMainView.layer.cornerRadius = 8
                }
                cell.setUpData(data: progressReport?[sectionNo])
                cell.detailView.isHidden = !isShow
                cell.handleShowHideAction = { [self] in
                    
                    var isShow = false
                    if showSection?.count == 0 || showSection == nil {
                        isShow = true
                        showSection = [section]
                    } else {
                        isShow = showSection?.contains(section) ?? false
                        if !isShow {
                            showSection?.append(section)
                        } else {
                            showSection?.removeAll(where: { $0 == section })
                        }
                    }
                    self.tableView.reloadRows(at: [indexPath], with: .none)
                }
                
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if isActivitySelected {
//            if section != 0 {
//                guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ActivityWiseHeaderTableViewCell") as? ActivityWiseHeaderTableViewCell else { return UIView() }
//                
//                headerView.activityMainView.backgroundColor = UIColor.systemYellow
//                headerView.activityTitleLabel.textColor = UIColor.black
//                let sectionNo = section - 1
//                headerView.activityTitleLabel.text = progressReport?[sectionNo].activity
//
//                
//                var isShow = false
//                
//                isShow = showSection?.contains(section) ?? false
//                if isShow {
//                    let image = UIImage(systemName: "chevron.up.circle")
//                    headerView.activityHideShowButton.setImage(image, for: .normal)
//                    headerView.activityMainView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 0)
//                } else {
//                    let image = UIImage(systemName: "chevron.down.circle")
//                    headerView.activityHideShowButton.setImage(image, for: .normal)
//                    headerView.activityMainView.layer.cornerRadius = 8
//                }
//                
//                headerView.handleShowHideAction = { [self] in
//                    
//                    var isShow = false
//                    
//                    if showSection?.count == 0 || showSection == nil {
//                        isShow = true
//                        showSection = [section]
//                    } else {
//                        isShow = showSection?.contains(section) ?? false
//                        if !isShow {
//                            showSection?.append(section)
//                        } else {
//                            showSection?.removeAll(where: { $0 == section })
//                        }
//                    }
//                    
//                    tableView.reloadData()
//                }
//                return headerView
//            } else {
//                let view = UIView()
//                view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
//                return view
//            }
//        } else {
//            let view = UIView()
//            view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
//            return view
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if isActivitySelected {
//            
//            if section == 0 {
//                return 0
//            } else {
//                return 50
//            }
//        } else{
//            return 0
//        }
//    }
    
}
