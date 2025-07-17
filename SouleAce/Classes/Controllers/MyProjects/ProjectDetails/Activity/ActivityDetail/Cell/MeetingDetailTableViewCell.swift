//
//  MeetingDetailTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 19/03/24.
//

import UIKit

class MeetingDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
    }
    
}
