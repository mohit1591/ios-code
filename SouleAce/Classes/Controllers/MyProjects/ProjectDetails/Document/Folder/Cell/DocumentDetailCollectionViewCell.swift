//
//  DocumentDetailCollectionViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/03/24.
//

import UIKit

class DocumentDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()    }
    
    func setupUI() {
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell() {
        
    }

}
