//
//  NgoheaderTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import UIKit

class NgoHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var rejectedLabel: UILabel!
    @IBOutlet weak var additionalInfoLabel: UILabel!
    @IBOutlet weak var underReviewLabel: UILabel!
    @IBOutlet weak var newApplicationLabel: UILabel!
    @IBOutlet weak var approveLabel: UILabel!
    @IBOutlet weak var totalApplicationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(data: NgoHeaderData?) {
        totalApplicationLabel.text = "\(data?.total_Application ?? 0)"
        approveLabel.text = "\(data?.approved_Application ?? 0)"
        newApplicationLabel.text = "\(data?.new_Application ?? 0)"
        underReviewLabel.text = "\(data?.under_Review ?? 0)"
        additionalInfoLabel.text = "\(data?.additional_Info ?? 0)"
        rejectedLabel.text = "\(data?.rejected ?? 0)"
    }
    
}
