//
//  SDGCollectionViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/02/24.
//

import UIKit

class SDGCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sdgBeneficiaryLabel: UILabel!
    @IBOutlet weak var sdgProjectLabel: UILabel!
    @IBOutlet weak var sdgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addShadow()
    }
    
    func addShadow() {
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }

}
