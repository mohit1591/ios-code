//
//  BudgetDetailTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/02/24.
//

import UIKit

class BudgetDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var unUtilizedPercentageLabel: UILabel!
    @IBOutlet weak var unUtilizedAmountLabel: UILabel!
    @IBOutlet weak var utilizedPercentageLabel: UILabel!
    @IBOutlet weak var utilizedAmountLabel: UILabel!
    @IBOutlet weak var disbursedPercentageLabel: UILabel!
    @IBOutlet weak var disbursedAmountLabel: UILabel!
    @IBOutlet weak var budgetAlloctedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
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
    
    func fillCell(data: ProjectBudgetData?) {
        utilizedAmountLabel.text = "Rs.\(data?.utilized?.formattedWithSeparator ?? "")"
        unUtilizedAmountLabel.text = "Rs.\(data?.unutilized?.formattedWithSeparator ?? "")"
        disbursedAmountLabel.text = "Rs.\(data?.disbursed?.formattedWithSeparator ?? "")"
        utilizedPercentageLabel.text = "\(data?.utilized_percent ?? 0)%"
        unUtilizedPercentageLabel.text = "\(data?.unutilized_percent ?? 0)%"
        disbursedPercentageLabel.text = "\(data?.disbursed_percent ?? 0)%"
        budgetAlloctedLabel.text = "Rs.\(data?.planned?.formattedWithSeparator ?? "")"
        titleLabel.text = data?.project_name
    }
    
}
