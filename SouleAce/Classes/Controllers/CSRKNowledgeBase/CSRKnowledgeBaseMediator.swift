//
//  CSRKnowledgeBaseMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 05/03/24.
//

import Foundation
import UIKit

extension CSRKnowledgeBaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return csrData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.csrKnowledgeBaseTableViewCell, for: indexPath) as? CSRKnowledgeBaseTableViewCell else { return UITableViewCell() }
        cell.fillCell(data: csrData?[indexPath.row])
        cell.handleViewAttachmentClick = { [self] in
            let attachmenturl = csrData?[indexPath.row].amendment_file
            openURL(link: attachmenturl ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
