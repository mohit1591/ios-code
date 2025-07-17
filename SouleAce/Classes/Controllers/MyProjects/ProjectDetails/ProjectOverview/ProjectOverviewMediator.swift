//
//  ProjectOverviewMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/04/24.
//

import Foundation
import UIKit

extension ProjectOverviewViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectBasicInfoTableViewCell, for: indexPath) as? ProjectBasicInfoTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: projectData?.basic_info)
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectTimeLineTableViewCell, for: indexPath) as? ProjectTimeLineTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: projectData?.project_timeline)
            cell.statusView.backgroundColor = UIColor.hexStringToUIColor(hex: "#81D7D3")
            cell.startDateView.backgroundColor = UIColor.hexStringToUIColor(hex: "#E5E4DA")
            cell.duractionView.backgroundColor = UIColor.hexStringToUIColor(hex: "#FFEBC3")
            cell.endDateView.backgroundColor = UIColor.hexStringToUIColor(hex: "#EAD5BA")
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectBudgetOverviewTableViewCell, for: indexPath) as? ProjectBudgetOverviewTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: projectData)
            return cell
        } else if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.projectProgressReportTableViewCell, for: indexPath) as? ProjectProgressReportTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: projectData?.progress_reports)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
