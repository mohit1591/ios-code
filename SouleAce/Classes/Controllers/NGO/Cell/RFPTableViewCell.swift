//
//  RFPTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/03/24.
//

import UIKit

class RFPTableViewCell: UITableViewCell {

    @IBOutlet weak var extendedDuewDateStack: UIStackView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var proposalsLabel: UILabel!
    @IBOutlet weak var extendedDueDateLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var ngoLabel: UILabel!
    @IBOutlet weak var themelabel: UILabel!
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
    
    func fillCell(data: RFPData?) {
        
        if data?.rfp_extended_due_date == nil {
            extendedDuewDateStack.isHidden = true
        } else {
            extendedDuewDateStack.isHidden = false
        }
        
        proposalsLabel.text = "\(data?.proposal_count ?? 0)"
        extendedDueDateLabel.text = data?.rfp_extended_due_date?.converDateInto()
        dueDateLabel.text = data?.rfp_due_date?.converDateInto()
        ngoLabel.text = data?.ngos
        themelabel.text = data?.theme_name
        titleLabel.text = data?.rfp_title
        locationLabel.text = data?.rfp_location
    }
    
}
