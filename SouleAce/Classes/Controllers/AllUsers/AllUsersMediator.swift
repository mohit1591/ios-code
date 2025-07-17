//
//  AllUsersMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import Foundation
import UIKit

extension AllUsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUser?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.allUsersTableViewCell, for: indexPath) as? AllUsersTableViewCell else { return UITableViewCell() }
        cell.fillCell(data: allUser?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (allUser?.count ?? 0) - 1 {
            if allUserData?.has_more ?? false {
                currentPage += 1
                getPartnersData(isFilter: true)
            }
        }
    }
}
