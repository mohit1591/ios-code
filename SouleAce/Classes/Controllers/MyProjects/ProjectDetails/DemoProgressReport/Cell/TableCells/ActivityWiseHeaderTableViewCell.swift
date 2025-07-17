//
//  ActivityWiseHeaderTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 26/03/24.
//

import UIKit

class ActivityWiseHeaderTableViewCell: UITableViewHeaderFooterView {
    
//    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityHideShowButton: UIButton!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var activityMainView: UIView!
    
    var handleShowHideAction: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func handleShowHideAction(_ sender: UIButton) {
        handleShowHideAction?()
    }
    
}
