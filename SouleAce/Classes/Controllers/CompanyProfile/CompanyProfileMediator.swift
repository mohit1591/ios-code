//
//  CompanyProfileMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import Foundation
import UIKit

extension CompanyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if basicInfoShow {
                return 1
            } else {
                return 0
            }
        } else {
            if adminInfoShow {
                return 1
            } else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.companyBasicInfoTableViewCell, for: indexPath) as? CompanyBasicInfoTableViewCell else { return UITableViewCell() }

        if indexPath.section == 0 {
       
            cell.imageViewHeightConstraint.constant = 130
            cell.organizationCodeView.isHidden = false
            cell.organizationEmailStackView.isHidden = false
            cell.companyImageView.isHidden = false
            cell.fillCell(data: companyDetail, isFromAdmin: false)
          
        } else {
            cell.imageViewHeightConstraint.constant = 0
            cell.organizationCodeView.isHidden = true
            cell.organizationEmailStackView.isHidden = true
            cell.companyImageView.isHidden = true
            cell.fillCell(data: companyDetail, isFromAdmin: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else { return UIView() }
        headerView.imageView.isHidden = false
        headerView.mainView.backgroundColor = .systemYellow
        headerView.imageView.tintColor = .black
        headerView.titlelLabel.textColor = .black
        headerView.titlelLabel.text = titleSection[section]
        
        switch section {
        case 0:
            if basicInfoShow {
                let image = UIImage(systemName: "chevron.up.circle")
                headerView.hideShowButton.setImage(image, for: .normal)
            } else {
                let image = UIImage(systemName: "chevron.down.circle")
                headerView.hideShowButton.setImage(image, for: .normal)
            }
            break
        case 1:
            if adminInfoShow {
                let image = UIImage(systemName: "chevron.up.circle")
                headerView.hideShowButton.setImage(image, for: .normal)
            } else {
                let image = UIImage(systemName: "chevron.down.circle")
                headerView.hideShowButton.setImage(image, for: .normal)
            }
            break
        default :
            break
        }
        
        headerView.handleShowHideAction = { [self] in
            switch section {
            case 0:
                basicInfoShow.toggle()
                break
            case 1:
                adminInfoShow.toggle()
                break
            default :
                break
            }
            tableView.reloadData()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
}
