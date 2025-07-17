//
//  ImplementingPartnersMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import Foundation
import UIKit

extension ImplementingPartnersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partnersData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.implementingPartnersTableViewCell, for: indexPath) as? ImplementingPartnersTableViewCell else { return UITableViewCell() }
        cell.fillCell(data: partnersData?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let corporateId = "\(partnersData?[indexPath.row].corporate_id ?? 0)"
        let partnerId = "\(partnersData?[indexPath.row].ngo_id ?? 0)"
        moveToImplementPartneDetail(corporateId: corporateId, partnerId: partnerId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
