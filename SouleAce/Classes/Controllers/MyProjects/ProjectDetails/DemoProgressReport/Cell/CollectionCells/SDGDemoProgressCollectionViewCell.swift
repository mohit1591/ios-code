//
//  SDGDemoProgressCollectionViewCell.swift
//  SouleAce
//
//  Created by ideveloper1 on 26/03/24.
//

import UIKit

class SDGDemoProgressCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addShadow()
    }

    func addShadow() {
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }

}
