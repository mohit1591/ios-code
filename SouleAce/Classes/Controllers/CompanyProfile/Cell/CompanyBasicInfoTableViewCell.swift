//
//  CompanyProfileTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 11/03/24.
//

import UIKit
import SDWebImage

class CompanyBasicInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyImageView: UIImageView!
    
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var organizationCodeView: UIStackView!
    @IBOutlet weak var organizationEmailStackView: UIStackView!
    @IBOutlet weak var contactNoLabel: UILabel!
    @IBOutlet weak var organizationCodeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var organizationEmail: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var pinCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func fillCell(data: CompanyProfileDetails?, isFromAdmin: Bool) {
        if isFromAdmin {
            nameTitleLabel.text = "Admin Name"
            contactTitleLabel.text = "Admin Mobile No."
            contactNoLabel.text = data?.org_admin_mobile_no
            nameLabel.text = data?.org_admin_first_name
            addressLabel.text = data?.org_admin_address
            stateLabel.text = data?.org_admin_state
            districtLabel.text = data?.org_admin_district
            cityLabel.text = data?.org_admin_area
            pinCodeLabel.text = data?.org_admin_pin_code
        } else {
            nameTitleLabel.text = "Organization Name"
            contactTitleLabel.text = "Organization Contact No."
            contactNoLabel.text = data?.corporate_contact_no
            organizationCodeLabel.text = data?.corporate_code
            organizationEmail.text = data?.corporate_email
            nameLabel.text = data?.corporate_name
            addressLabel.text = data?.corporate_address_1
            stateLabel.text = data?.corporate_state
            districtLabel.text = data?.corporate_district
            cityLabel.text = data?.corporate_area
            pinCodeLabel.text = data?.corporate_pin_code
            let imageUrl = URL(string: data?.corporate_logo ?? "")
            companyImageView.sd_setImage(with: imageUrl)
        }
    }
    
}
