//
//  ProgressReportingMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import Foundation
import UIKit

extension ProgressReportingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerValues?.count ?? 0 == 0 ? 0 : ((headerValues?.count ?? 0) + 1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // projectProgressList?.count ?? 0
        } else {
            return 1
//            var isShow = false
//            
//            isShow = showSection?.contains(section) ?? false
//            if isShow {
//                return 1
//            } else {
//                return 0
//            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.progressReportingDetailTableViewCell, for: indexPath) as? ProgressReportingDetailTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: progress)
            return cell
        } else {
            let sectionNo = indexPath.section - 1
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.progressReportListTableViewCell, for: indexPath) as? ProgressReportListTableViewCell else { return UITableViewCell() }
            cell.mainView.backgroundColor = UIColor.systemYellow
            cell.titlelLabel.textColor = UIColor.black
            cell.fillCell(data: headerValues?[sectionNo])
            let section = indexPath.section
            if showSection?.contains(section) ?? false {
                let image = UIImage(systemName: "chevron.up.circle")
                cell.hideShowButton.setImage(image, for: .normal)
                cell.detailView.isHidden = false
            }else {
                let image = UIImage(systemName: "chevron.down.circle")
                cell.hideShowButton.setImage(image, for: .normal)
                cell.detailView.isHidden = true
            }
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
                self.tableView.reloadData()
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section != 0 {
//            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else { return UIView() }
//            headerView.mainView.backgroundColor = UIColor.systemYellow
//            headerView.titlelLabel.textColor = UIColor.black
//            let sectionNo = section - 1
//            headerView.titlelLabel.text = headerValues?[sectionNo].activity
//            
//            var isShow = false
//            
//            isShow = showSection?.contains(section) ?? false
//            if isShow {
//                let image = UIImage(systemName: "chevron.up.circle")
//                headerView.hideShowButton.setImage(image, for: .normal)
//            } else {
//                let image = UIImage(systemName: "chevron.down.circle")
//                headerView.hideShowButton.setImage(image, for: .normal)
//            }
//            
//            headerView.handleShowHideAction = { [self] in
//                
//                var isShow = false
//                
//                if showSection?.count == 0 || showSection == nil {
//                    isShow = true
//                    showSection = [section]
//                } else {
//                    isShow = showSection?.contains(section) ?? false
//                    if !isShow {
//                        showSection?.append(section)
//                    } else {
//                        showSection?.removeAll(where: { $0 == section })
//                    }
//                }
//                
//                tableView.reloadData()
//                
//            }
//            return headerView
//        } else {
//            let view = UIView()
//            view.frame.size.height = 0
//            return view
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0
////        if section == 0 {
////        } else {
////            return 100
////        }
//    }
    
}
