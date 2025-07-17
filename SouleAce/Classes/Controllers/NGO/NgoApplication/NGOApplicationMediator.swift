//
//  NGOApplicationMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import Foundation
import UIKit

extension NGOApplicationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.organaizationDetailTableViewCell, for: indexPath) as? OrganaizationDetailTableViewCell else { return UITableViewCell() }
            cell.fillOrgaionzationDataCell(data: orgaionzationData)
            return cell
        } else if indexPath.row == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.proposalDetailsTableViewCell, for: indexPath) as? ProposalDetailsTableViewCell else { return UITableViewCell() }
            cell.fillPersonalDetialCell(data: proposalDetails)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.isRegisterTableViewCell, for: indexPath) as? IsRegisterTableViewCell else { return UITableViewCell() }
            if indexPath.row == 1 { // 12 A registerd
                cell.fillCert12aCell(data: cert12a)
            } else if indexPath.row == 2 { // 80 G registerd
                cell.fillCert80gCell(data: cert80g)
            } else if indexPath.row == 3 { // FCRA registerd
                cell.fillCertFcraCell(data: certFcra)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
