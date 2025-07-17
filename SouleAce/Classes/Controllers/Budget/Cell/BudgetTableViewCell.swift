//
//  BudgetTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/02/24.
//

import UIKit

class BudgetTableViewCell: UITableViewCell {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var projectYearLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var unUtilizedLabel: UILabel!
    @IBOutlet weak var utilizedLabel: UILabel!
    @IBOutlet weak var disbursedLabel: UILabel!
    @IBOutlet weak var plannedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        borderView.layer.cornerRadius = 12
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell(data: Fdata?) {
        totalLabel.text = "Rs.\(data?.total?.convertIntToCrString() ?? "")Cr"
        projectYearLabel.text = "Year " + (data?.year ?? "")
        unUtilizedLabel.text = "Rs.\(data?.unutilized?.convertIntToCrString() ?? "")Cr"
        utilizedLabel.text = "Rs.\(data?.utilized?.convertIntToCrString() ?? "")Cr"
        disbursedLabel.text = "Rs.\(data?.disbursed?.convertIntToCrString() ?? "")Cr"
        plannedLabel.text = "Rs.\(data?.planned?.convertIntToCrString() ?? "")Cr"
    }
    
}
