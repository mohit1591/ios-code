//
//  ImplementingPartnersDetailMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import Foundation
import UIKit

extension ImplementingPartnersDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1  {
            if allProjectShow {
                debugPrint("ngoProjects?.count ?? 0:::\(ngoProjects?.count ?? 0)")
                return ngoProjects?.count ?? 0
            } else {
                return 0
            }
        } else if section == 2 {
            if keyManagmentPersonalShow {
                return keyManagements?.count ?? 0
            } else {
                return 0
            }   
        } else if section == 3 {
            if certiAwardsShow {
                return 1 // ngoCertifications?.count ?? 0
            } else {
                return 0
            }
        } else {
            if photosShow {
                return  1 // ngoPhotos?.count ?? 0
            } else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.partnersDetailTableViewCell, for: indexPath) as? PartnersDetailTableViewCell else { return UITableViewCell() }
             cell.fillCell(data: ngoProfile)
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.allProjectTableViewCell, for: indexPath) as? AllProjectTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: ngoProjects?[indexPath.row])
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.keyManagmentTableViewCell, for: indexPath) as? KeyManagmentTableViewCell else { return UITableViewCell() }
            cell.fillCell(data: keyManagements?[indexPath.row])
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.photosTableViewCell, for: indexPath) as? PhotosTableViewCell else { return UITableViewCell() }
            cell.ngoCertifications = ngoCertifications
            cell.isFromPhotos = false
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.photosTableViewCell, for: indexPath) as? PhotosTableViewCell else { return UITableViewCell() }
            cell.ngoPhotos = ngoPhotos
            cell.isFromPhotos = true
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else { return UIView() }
            let sectionNo = section - 1
            headerView.titlelLabel.text = titleSection[sectionNo]
            
            switch section {
            case 0:
                let image = UIImage(systemName: "chevron.down.circle")
                headerView.hideShowButton.setImage(image, for: .normal)
                break
            case 1:
                if allProjectShow {
                    let image = UIImage(systemName: "chevron.up.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                } else {
                    let image = UIImage(systemName: "chevron.down.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                }
                break
            case 2:
                if keyManagmentPersonalShow {
                    let image = UIImage(systemName: "chevron.up.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                } else {
                    let image = UIImage(systemName: "chevron.down.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                }
                break
            case 3:
                if certiAwardsShow {
                    let image = UIImage(systemName: "chevron.up.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                } else {
                    let image = UIImage(systemName: "chevron.down.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                }
                break
            case 4:
                if photosShow {
                    let image = UIImage(systemName: "chevron.up.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                } else {
                    let image = UIImage(systemName: "chevron.down.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                }
                break
            default :
                let image = UIImage(systemName: "chevron.down.circle")
                headerView.hideShowButton.setImage(image, for: .normal)
                break
            }

            headerView.handleShowHideAction = { [self] in
                switch section {
                case 0:
                    let image = UIImage(systemName: "chevron.down.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                    break
                case 1:
                    allProjectShow.toggle()
                    if allProjectShow {
                        let image = UIImage(systemName: "chevron.up.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    } else {
                        let image = UIImage(systemName: "chevron.down.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    }
                    break
                case 2:
                    keyManagmentPersonalShow.toggle()
                    if keyManagmentPersonalShow {
                        let image = UIImage(systemName: "chevron.up.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    } else {
                        let image = UIImage(systemName: "chevron.down.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    }
                    break
                case 3:
                    certiAwardsShow.toggle()
                    if certiAwardsShow {
                        let image = UIImage(systemName: "chevron.up.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    } else {
                        let image = UIImage(systemName: "chevron.down.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    }
                    break
                case 4:
                    photosShow.toggle()
                    if photosShow {
                        let image = UIImage(systemName: "chevron.up.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    } else {
                        let image = UIImage(systemName: "chevron.down.circle")
                        headerView.hideShowButton.setImage(image, for: .normal)
                    }
                    break
                default :
                    let image = UIImage(systemName: "chevron.down.circle")
                    headerView.hideShowButton.setImage(image, for: .normal)
                    break
                }
                tableView.reloadData()
            }
            return headerView
        } else {
            let view = UIView()
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 48
    }
    
}
