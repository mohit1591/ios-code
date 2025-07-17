//
//  MyProjectsMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/02/24.
//

import Foundation
import UIKit

extension MyProjectsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.myProjectsTableViewCell, for: indexPath) as? MyProjectsTableViewCell else { return UITableViewCell() }
        cell.fillCell(project: projectList?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let projectId = projectList?[indexPath.row].projectID ?? 0
        moveToProjectDetails(projectId: projectId)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (projectList?.count ?? 0) - 1 {
            if myProjects?.has_more ?? false {
                getMyProjectList()
            }
        }
    }
    
}
