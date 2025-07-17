//
//  KeyManagmentTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import UIKit

class KeyManagmentTableViewCell: UITableViewCell {

    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
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
    
    func fillCell(data: KeyManagements?) {
        titleLabel.text = data?.contact_name
        designationLabel.text = data?.designation
        emailIdLabel.text = data?.email_id
        mobileNoLabel.text = data?.contact_mobile_no
    }
    
}
