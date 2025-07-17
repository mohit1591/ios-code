//
//  ContactDetilsTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/03/24.
//

import UIKit
import SDWebImage

class ContactDetilsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var involvementLabel: UILabel!
    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
        layoutIfNeeded()
    }
    
    func fillCell(data: NgoContactData?) {
        involvementLabel.text = data?.involvement_time
        mobileNoLabel.text = data?.contact_mobile_no
        organizationLabel.text = data?.organization_name
        designationLabel.text = data?.designation
        titleLabel.text = data?.contact_name
        let imageUrl = URL(string: data?.profile_image_url ?? "")
        previewImageView.sd_setImage(with: imageUrl)
    }
}
