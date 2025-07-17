//
//  ProjectBudgetTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/03/24.
//

import UIKit

class ProjectBudgetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var projectBudgetData: [ProjectBudgetData]?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
        
    func setupCollectionView() {
                collectionView.dataSource = self
                collectionView.delegate = self
        collectionView.register(cell: Cell.dashboardCollectionCell)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        collectionView.isScrollEnabled = false
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ProjectBudgetTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dashboardCollectionCell, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
        
                    cell.mainView.backgroundColor = UIColor.hexStringToUIColor(hex: "#ffebc3")
                    if indexPath.row == 0 {
                        cell.headerLabel.text = "Planned Amount"
                        cell.descriptionLabel.text = "Rs. \(projectBudgetData?.first?.planned?.formattedWithSeparator ?? "")"
                    } else if indexPath.row == 1 {
                        cell.headerLabel.text = "Disbursed Amount"
                        cell.descriptionLabel.text = "Rs. \(projectBudgetData?.first?.disbursed?.formattedWithSeparator ?? "")"
                    } else if indexPath.row == 2 {
                        cell.headerLabel.text = "Spent Amount"
                        cell.descriptionLabel.text = "Rs. \(projectBudgetData?.first?.utilized?.formattedWithSeparator ?? "")"
                    } else if indexPath.row == 3 {
                        cell.headerLabel.text = "Unspent Amount"
                        cell.descriptionLabel.text = "Rs. \(projectBudgetData?.first?.unutilized?.formattedWithSeparator ?? "")"
                    }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var noOfCol = 2  //number of column you want
        
        var availableHeight = 100
        var size = 0
        var totalSpace = 0.0
        noOfCol = 2 //number of column you want
        availableHeight = availableHeight * 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCol - 1))
        size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCol))
        
        return CGSize(width: size, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
