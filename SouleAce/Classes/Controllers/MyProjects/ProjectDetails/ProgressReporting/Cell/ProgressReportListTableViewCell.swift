//
//  ProgressReportListTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/03/24.
//

import UIKit

class ProgressReportListTableViewCell: UITableViewCell {

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var fromCorporateLabel: UILabel!
    @IBOutlet weak var fromNgoLabel: UILabel!
    @IBOutlet weak var onDeadlineLabel: UILabel!
    @IBOutlet weak var progressViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressCountLabel: UILabel!
    @IBOutlet weak var measurmentUnitLabel: UILabel!
    @IBOutlet weak var perfomanceIndicatorLabel: UILabel!
    @IBOutlet weak var progresLabel: UILabel!
    @IBOutlet weak var achivedLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var unspentLabel: UILabel!
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var allocatedLabel: UILabel!
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var completionLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var deadlineDateLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var detailView: UIView!
    
    
    //CollectionView
    @IBOutlet weak var photosDocumentSV: UIStackView!
    @IBOutlet weak var utilizationCertificateSV: UIStackView!
    @IBOutlet weak var photosDocumentCV: UICollectionView!
    @IBOutlet weak var utilizationCertificateCV: UICollectionView!
    @IBOutlet weak var photosDocumentImage: UIImageView!
    @IBOutlet weak var utilizationCertificateImage: UIImageView!
    
    
    //HeaderView
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titlelLabel: UILabel!
    @IBOutlet weak var hideShowButton: UIButton!
    
    
    var photoDocumentString: String = ""
    var utilizationCertificateString: String = ""
    
    var handleShowHideAction: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        // Initialization code
    }
    func setTitle(text: String) {
        titlelLabel.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
        progressView.layer.cornerRadius = 8
    }
    func setupCollectionView() {
        photosDocumentCV.register(cell: Cell.sdgDemoProgressCollectionViewCell)
        photosDocumentCV.dataSource = self
        photosDocumentCV.delegate = self
        
        photosDocumentCV.isScrollEnabled = true
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        photosDocumentCV.collectionViewLayout = flowLayout
        
        
        utilizationCertificateCV.register(cell: Cell.sdgDemoProgressCollectionViewCell)
        utilizationCertificateCV.dataSource = self
        utilizationCertificateCV.delegate = self
        
        utilizationCertificateCV.isScrollEnabled = true
        let flowLayout1 = UICollectionViewFlowLayout()
        flowLayout1.scrollDirection = .horizontal
        utilizationCertificateCV.collectionViewLayout = flowLayout1
    }
    
    func fillCell(data: HeaderValues?) {
        
        titlelLabel.text = data?.activity ?? ""
        
        
        
        measurmentUnitLabel.text = data?.unitOfMeasurement ?? ""
        perfomanceIndicatorLabel.text = data?.performanceIndicator ?? ""
        achivedLabel.text = "\(data?.achieved ?? 0)"
        targetLabel.text = "\(data?.totalTarget ?? 0)"
        unspentLabel.text = "Rs.\(data?.unspentAmount?.formattedWithSeparator ?? "0")"
        spentLabel.text = "Rs.\(data?.spentAmount?.formattedWithSeparator ?? "0")"
        allocatedLabel.text = "Rs.\(data?.allocatedBudget?.formattedWithSeparator ?? "0")"
        progresLabel.text = "\(data?.projectProgress ?? 0)%"
        outputLabel.text = data?.output
        outcomeLabel.text = data?.outcome
        categoryLabel.text = data?.categoryOfTask
        completionLabel.text = data?.completionDateActual?.converDateInto()
        reviewLabel.text = data?.reviewDateFromCorporate?.converDateInto()
        deadlineDateLabel.text = data?.deadlineDate?.converDateInto()
        
        onDeadlineLabel.text = data?.remarksAsOnDeadline
        fromNgoLabel.text = data?.remarksFromNGO
        fromCorporateLabel.text = data?.remarksFromCorporate
        
        photoDocumentString = data?.photosDocuments ?? ""
        utilizationCertificateString = data?.utilizationCertificatePDFUpload ?? ""
        print("photoDocumentString:\(photoDocumentString)")
        print("utilizationCertificateString:\(utilizationCertificateString)")
        photosDocumentSV.isHidden = false
        utilizationCertificateSV.isHidden = false
        if data?.photosDocuments ?? "" == "" {
            photosDocumentSV.isHidden = true
        }
        if data?.utilizationCertificatePDFUpload ?? "" == "" {
            utilizationCertificateSV.isHidden = true
        }
        photosDocumentCV.reloadData()
        utilizationCertificateCV.reloadData()
        let width = self.frame.width - 32
        progressViewWidthConstraint.constant = CGFloat((Int(width) * (data?.actualProgress ?? 0)) / 100)
        progressCountLabel.text = "\(data?.actualProgress ?? 0)%"
        layoutSubviews()
    }
    
    @IBAction func showHideRowsAction(_ sender: UIButton) {
        handleShowHideAction?()
    }
    
}

extension ProgressReportListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == photosDocumentCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDemoProgressCollectionViewCell, for: indexPath) as? SDGDemoProgressCollectionViewCell else { return UICollectionViewCell() }
            cell.imageView.image = UIImage(systemName: "circle")
            let imageUrl = URL(string: photoDocumentString)
            print("imageUrl: \(imageUrl)")
            cell.imageView.sd_setImage(with: imageUrl)
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.sdgDemoProgressCollectionViewCell, for: indexPath) as? SDGDemoProgressCollectionViewCell else { return UICollectionViewCell() }
            cell.imageView.image = UIImage(named: "pdf_icon")
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == photosDocumentCV {
            return CGSize(width: 100, height: 100)
        }else {
            return CGSize(width: 35, height: 60)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == photosDocumentCV {
            openURL(link: photoDocumentString)
        }else {
            openURL(link: utilizationCertificateString)
        }
    }
    func openURL(link: String) {
        if let url = NSURL(string: link) {
            UIApplication.shared.open(url as URL)
        }
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
