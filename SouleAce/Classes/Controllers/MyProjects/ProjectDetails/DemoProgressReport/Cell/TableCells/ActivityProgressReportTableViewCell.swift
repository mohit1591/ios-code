//
//  ActivityProgressReportTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 22/03/24.
//

import UIKit

class ActivityProgressReportTableViewCell: UITableViewCell {
   
    @IBOutlet weak var corporateStatusLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var remarksLabel: UILabel!
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var completionLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var docPhotoStackView: UIStackView!
    @IBOutlet weak var remarkStakeView: UIView!
    @IBOutlet weak var outComeStackView: UIView!
    var sdgData : [String] = []
    
    
    @IBOutlet weak var activityHideShowButton: UIButton!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var activityMainView: UIView!
    
    @IBOutlet weak var mainStackView: UIStackView!
    var handleShowHideAction: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        borderView.layer.cornerRadius = 12
//        borderView.layer.borderWidth = 0.3
        DispatchQueue.main.async {
            self.mainStackView.layer.cornerRadius = 12
        }
//        borderView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
        mainStackView.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        mainStackView.layer.shadowOpacity = 0.3
        mainStackView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainStackView.layer.shadowRadius = 3
        mainStackView.layer.masksToBounds = false
    }
    
    func setupCollectionView() {
//        collectionView.register(cell: Cell.SDGDemoProgressCV)
//        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.register(cell: Cell.sdgDemoProgressCollectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.isScrollEnabled = true
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
    }
    func setUpData(data: ProgressReport?) {
        if let data = data {
            deadlineLabel.text = data.deadlineDate?.converDateInto()
            completionLabel.text = data.completionDateActual?.converDateInto()
            outcomeLabel.text = data.outcomeGoal
            remarksLabel.text = data.remarksAsOnDeadline
            statusLabel.text = data.completedStatus
            corporateStatusLabel.text = data.status
            outComeStackView.isHidden = data.outcomeGoal ?? "" == ""
            remarkStakeView.isHidden = data.remarksAsOnDeadline ?? "" == ""
            sdgData = data.photosDocuments ?? []
            collectionView.reloadData()
            print("sdgData:::\(sdgData.count)")
            //header
            activityMainView.backgroundColor = UIColor.systemYellow
            activityTitleLabel.textColor = UIColor.black
            activityTitleLabel.text = data.activity
            if sdgData.count > 0 {
                docPhotoStackView.isHidden = false
            } else {
                docPhotoStackView.isHidden = true
            }
        }
    }
    @IBAction func handleShowHideAction(_ sender: UIButton) {
        handleShowHideAction?()
    }
}

extension ActivityProgressReportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sdgData.count
//        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.SDGDemoProgressCV, for: indexPath) as? SDGDemoProgressCV else { return UICollectionViewCell() }
//        cell.imageView.image = UIImage(systemName: "circle")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDemoProgressCollectionViewCell, for: indexPath) as? SDGDemoProgressCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = UIImage(systemName: "circle")
        if (sdgData.count > 0) {
            let imageUrl = URL(string: sdgData[indexPath.row])
            print("imageUrl:::\(imageUrl)")
            cell.imageView.sd_setImage(with: imageUrl)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.openURL(link: sdgData[indexPath.row])
    }
    func openURL(link: String) {
        if let url = NSURL(string: link) {
            UIApplication.shared.open(url as URL)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        if sdgData.count == 1 {
//            let width = (collectionView.bounds.width - 100) / 2
//            return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
//        } else if sdgData.count == 2 {
//            let width = (collectionView.bounds.width - 200 - 20) / 2
//            return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
//        } else if sdgData.count == 3 {
//            let width = (collectionView.bounds.width - 300 - 30) / 2
//            return UIEdgeInsets(top: 0, left: width, bottom: 0, right: width)
//        } else {
//            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        }
//        
//    }
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
