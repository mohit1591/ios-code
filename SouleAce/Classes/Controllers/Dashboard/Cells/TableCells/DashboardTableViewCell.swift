//
//  DashboardTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/02/24.
//

import UIKit
import SDWebImage

class DashboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var hearderLabel: UILabel!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    
    var currentDashboardData = DashboardList.projectSummary
    var projectSummary: ProjectSummary?
    var beneficiaryInformation : BeneficiaryInformation?
    var projectLocations : ProjectLocations?
    var projectBudget : ProjectBudget?
    var activity : Activity?
    var thematicAreas : [Thematic_areas]?
    var sdgData : [Sdg_data]?
    var impacts : [ImpactValue]?
    var collectionHeight = 0
    var totalRow = 1
    var totalCol = 2
    var heightOfCollectionView = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cell: Cell.dashboardCollectionCell)
    }
    
    func collectionViewHeight() {
        
        var height = 110
        
        switch currentDashboardData {
        case .projectSummary:
            height = 90
            break
        case .beneficaryInformation:
            height = 90
            break
        case .projectLocation:
            height = 90
            break
        case .projectBudget:
            height = 90
            height = height * 2
            break
        case .projectActivityDetails:
            height = 0 // 100
            break
        case .projectThematicAreas:
            height = 90
            let rows = Int(ceil(Double(thematicAreas?.count ?? 2) / 2))
            height = height * rows
            break
        case .impacts:
            height = 90
            let rows = Int(ceil(Double(impacts?.count ?? 2) / 2))
            height = height * rows
        case .sdgData:
            height = 100
            break
        }
        heightOfCollectionView = height
        collectionHeightConstraint.constant = CGFloat(height)
        collectionView.layoutSubviews()
        collectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension DashboardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch currentDashboardData {
        case .projectSummary:
            return 2
        case .beneficaryInformation:
            return 2
        case .projectLocation:
            return 2
        case .projectBudget:
            return 4
        case .projectActivityDetails:
            return 0 // 3
        case .projectThematicAreas:
            return thematicAreas?.count ?? 0
        case .impacts:
            return impacts?.count ?? 0
        case .sdgData:
            return sdgData?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch currentDashboardData {
        case .projectSummary:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#E5E4DA")
            if indexPath.row == 0 {
                cell.headerLabel.text = "Projects"
                cell.descriptionLabel.text = "\(projectSummary?.projects ?? 0)"
            } else if indexPath.row == 1 {
                cell.headerLabel.text = "Implementing Partners"
                cell.descriptionLabel.text = "\(projectSummary?.ngos ?? 0)"
            }
            return cell
        case .beneficaryInformation:
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#ffebc3")
            if indexPath.row == 0 {
                cell.headerLabel.text = "Target Benificiary"
                cell.descriptionLabel.text = "\(beneficiaryInformation?.target_benificaries?.formattedWithSeparator ?? "")"
            } else if indexPath.row == 1 {
                cell.headerLabel.text = "Benificiary Covered"
                cell.descriptionLabel.text = "\(beneficiaryInformation?.covered_benificaries?.formattedWithSeparator ?? "")"
            }
            
            return cell
        case .projectLocation:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#eaaeb3")
            if indexPath.row == 0 {
                cell.headerLabel.text = "Total States"
                cell.descriptionLabel.text = "\(projectLocations?.states ?? 0)"
            } else if indexPath.row == 1 {
                cell.headerLabel.text = "Total Districts"
                cell.descriptionLabel.text = "\(projectLocations?.districts ?? 0)"
            } 
//            else if indexPath.row == 2 {
//                cell.headerLabel.text = "Asprorational Districts"
//                cell.descriptionLabel.text = "\(projectLocations?.asp_districts ?? 0)"
//            }
            return cell
        case .projectBudget:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#E0F2F2")
            if indexPath.row == 0 {
                cell.headerLabel.text = "Total Budget"
                cell.descriptionLabel.text = "Rs. \(projectBudget?.total?.formattedWithSeparator ?? "")"
            } else if indexPath.row == 1 {
                cell.headerLabel.text = "Disbursed Amount"
                cell.descriptionLabel.text = "Rs. \(projectBudget?.disbursed?.formattedWithSeparator ?? "")"
            } else if indexPath.row == 2 {
                cell.headerLabel.text = "Utilized Amount"
                cell.descriptionLabel.text = "Rs. \(projectBudget?.utilized?.formattedWithSeparator ?? "")"
            } else if indexPath.row == 3 {
                cell.headerLabel.text = "Unutilized Amount"
                cell.descriptionLabel.text = "Rs. \(projectBudget?.unutilized?.formattedWithSeparator ?? "")"
            }
            
            return cell
        case .projectActivityDetails:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#ead5ba")
            if indexPath.row == 0 {
                cell.headerLabel.text = "Total Activity"
                cell.descriptionLabel.text = "\(activity?.total_activity ?? 0)"
            } else if indexPath.row == 1 {
                cell.headerLabel.text = "Completed Activity"
                cell.descriptionLabel.text = "\(activity?.completed_activity ?? 0)"
            } else if indexPath.row == 2 {
                cell.headerLabel.text = "Wip Activity"
                cell.descriptionLabel.text = "\(activity?.wip_activity ?? 0)"
            }
            return cell
        case .projectThematicAreas:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#81d7d3")
            cell.headerLabel.text = thematicAreas?[indexPath.row].theme_name
            cell.descriptionLabel.text = "\(thematicAreas?[indexPath.row].total_projects ?? 0)"
            return cell
        case .impacts:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#ffebc3")
            cell.headerLabel.text = impacts?[indexPath.row].key ?? ""
            cell.descriptionLabel.text = impacts?[indexPath.row].value ?? ""
            return cell
        case .sdgData:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDashboardCollectionViewCell, for: indexPath) as? SDGDashboardCollectionViewCell else { return UICollectionViewCell() }

            let imageUrl = URL(string: sdgData?[indexPath.row].sdg_img ?? "")
            cell.imageView.sd_setImage(with: imageUrl)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if currentDashboardData == DashboardList.sdgData {
            if sdgData?.count ?? 0 == 1 {
                let width = (collectionView.bounds.width - 100) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if sdgData?.count ?? 0 == 2 {
                let width = (collectionView.bounds.width - 200 - 20) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else if sdgData?.count ?? 0 == 3 {
                let width = (collectionView.bounds.width - 300 - 30) / 2
                return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
            } else {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
        } else {
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var noOfCol = 2  //number of column you want
        
        var availableHeight = 100
        var size = 0
        var totalSpace = 0.0
        
        switch currentDashboardData {
        case .projectSummary:
            noOfCol = 2  //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
            return CGSize(width: size, height: 80)
        case .beneficaryInformation:
            noOfCol = 2  //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
            return CGSize(width: size, height: 80)
        case .projectLocation:
            noOfCol = 2  //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
            
            return CGSize(width: size, height: 80)
        case .projectBudget:
            noOfCol = 2 //number of column you want
            availableHeight = availableHeight * 2
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
            
            return CGSize(width: size, height: 80)
        case .projectActivityDetails:
            noOfCol = 3  //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 21) / CGFloat(noOfCol))
            
            return CGSize(width: 0, height: 0) // CGSize(width: size, height: 90)
        case .projectThematicAreas:
            noOfCol = 2 //number of column you want
            availableHeight = availableHeight * 2
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
            
            return CGSize(width: size, height: 80)
        case .impacts:
            noOfCol = 2 //number of column you want
            availableHeight = availableHeight * 2
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
            size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
            return CGSize(width: size, height: 80)
        case .sdgData:
            
            return CGSize(width: 100, height: 100)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
