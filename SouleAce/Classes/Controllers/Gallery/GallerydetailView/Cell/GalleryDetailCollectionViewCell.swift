//
//  GalleryDetailCollectionViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 27/02/24.
//

import UIKit

class GalleryDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var downloadView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var handleDownloadAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.3
    }

    @IBAction func downloadAction(_ sender: UIButton) {
        handleDownloadAction?()
    }
}
