//
//  NGOMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import Foundation
import UIKit

extension NGOViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if rfpSelectedView.isHidden {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rfpSelectedView.isHidden {
            if section == 0 {
                return 1
            } else {
                return ngodata?.count ?? 0
            }
        } else {
            return rfpData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if rfpSelectedView.isHidden {
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ngoHeaderTableViewCell, for: indexPath) as? NgoHeaderTableViewCell else { return UITableViewCell() }
                cell.fillCell(data: ngoHeader)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ngoTableViewCell, for: indexPath) as? NgoTableViewCell else { return UITableViewCell() }
                cell.fillCell(data: ngodata?[indexPath.row])
                cell.handleKnowMoreAction = {
                    self.moveToNGOApplictionScreen(id: "\(self.ngodata?[indexPath.row].application_proposal_id ?? 0)")
                }
                return cell
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.rfpTableViewCell, for: indexPath) as? RFPTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: rfpData?[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if rfpSelectedView.isHidden {
            if indexPath.section == 1 {
                self.moveToNGOApplictionScreen(id: "\(self.ngodata?[indexPath.row].application_proposal_id ?? 0)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
