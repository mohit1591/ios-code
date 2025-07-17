//
//  SDGDetailMediatro.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/02/24.
//

import Foundation
import UIKit

extension SDGDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sdg?.projects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.sdgDetailTableViewCell, for: indexPath) as? SDGDetailTableViewCell else { return UITableViewCell() }
        cell.fillCell(project: sdg?.projects?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
