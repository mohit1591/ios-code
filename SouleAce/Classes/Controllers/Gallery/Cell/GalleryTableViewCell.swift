//
//  GalleryTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 26/02/24.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
        // Configure the view for the selected state
    }
    
}
