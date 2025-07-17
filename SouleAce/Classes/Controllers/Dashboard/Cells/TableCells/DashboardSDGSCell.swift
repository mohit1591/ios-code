//
//  DasboardSDGSCell.swift
//  SouleAce
//
//  Created by Hitexa Kakadiya on 10/06/24.
//

import UIKit

class DashboardSDGSCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var hearderLabel: UILabel!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    
    var sdgData : [Sdg_data]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cell: Cell.sdgDashboardCollectionViewCell)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DashboardSDGSCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return sdgData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDashboardCollectionViewCell, for: indexPath) as? SDGDashboardCollectionViewCell else { return UICollectionViewCell() }
        let imageUrl = URL(string: sdgData?[indexPath.row].sdg_img ?? "")
        cell.imageView.sd_setImage(with: imageUrl)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
