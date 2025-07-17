//
//  PartnersDetailHeaderTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import UIKit
import SDWebImage

class PartnersDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var partnerImageView: UIImageView!
    @IBOutlet weak var partnerNameLabel: UILabel!
    
    @IBOutlet weak var foundationYearLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var registrationNoLabel: UILabel!
    
    @IBOutlet weak var panNoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(data: NgoProfile?) {
        partnerNameLabel.text = data?.ngo_name
        foundationYearLabel.text = "\(data?.year_of_foundation ?? 0)"
        addressLabel.text = data?.ngo_address
        registrationNoLabel.text = data?.ngo_registration_no
        panNoLabel.text = data?.ngo_pan_number
        let imageUrl = URL(string: data?.ngo_logo ?? "")
        partnerImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "download1"))
    }
    
}
