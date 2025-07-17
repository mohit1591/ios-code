//
//  ImplementingPartnersTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 06/03/24.
//

import UIKit

class ImplementingPartnersTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var adminUsernameLabel: UILabel!
    @IBOutlet weak var adminLabel: UILabel!
    @IBOutlet weak var contactNoLabel: UILabel!
    @IBOutlet weak var contactPersonLabel: UILabel!
    @IBOutlet weak var panNoLabel: UILabel!
    @IBOutlet weak var registrationNoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    func setupUI() {
        borderView.layer.cornerRadius = 12
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell(data: Ngos?) {
        adminUsernameLabel.text = data?.username
        contactNoLabel.text = data?.ngo_contact_number
        contactPersonLabel.text = data?.ngo_contact_person
        panNoLabel.text = data?.ngo_pan_number
        registrationNoLabel.text = data?.ngo_registration_no
        titleLabel.text = data?.ngo_name
        adminLabel.text = data?.first_name
    }
    
}
