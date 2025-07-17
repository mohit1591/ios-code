//
//  ActivityProgressMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/02/24.
//

import Foundation
import UIKit

extension ActivityProgressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectProgressList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.activityProgressTableViewCell, for: indexPath) as? ActivityProgressTableViewCell else { return UITableViewCell() }
        cell.fillCell(data: projectProgressList?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.progressReportingVC) as? ProgressReportingViewController {
            vc.projectName = projectProgressList?[indexPath.row].project_name ?? ""//projectDetails?.themeName ?? ""
            vc.implementingPartner = projectProgressList?[indexPath.row].implementingPartner ?? ""
            vc.projectId = projectProgressList?[indexPath.row].project_id ?? 0

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
