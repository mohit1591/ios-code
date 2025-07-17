//
//  ProjectBudgetListTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/04/24.
//

import UIKit

class ProjectBudgetListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var budgetAllocatedLabel: UILabel!
    @IBOutlet weak var unUtilizedAmountLabel: UILabel!
    @IBOutlet weak var utilizedAmountLabel: UILabel!
    @IBOutlet weak var disbursedAmountLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dataStackView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 8
        borderView.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        borderView.layer.shadowOpacity = 0.5
        borderView.layer.shadowOffset = CGSize(width: 0, height: 1)
        borderView.layer.shadowRadius = 2
        borderView.layer.borderWidth = 0.3
    }
    
    func fillProjectValueCell(data: ProjectBudgetValue?) {
        if data?.type ?? 0 == 1 {
            titleView.backgroundColor = .black
            titleLabel.textColor = .white
        }else {
            titleView.backgroundColor = .systemYellow
            titleLabel.textColor = .black
        }
        titleLabel.text = data?.budgetHeader
        
        if data?.planned ?? 0 == 0 && data?.spent ?? 0 == 0 && data?.unspent ?? 0 == 0 && data?.disbursed ?? 0 == 0 {
            dataStackView.isHidden = true
            return
        }
        dataStackView.isHidden = false
        budgetAllocatedLabel.text = "Rs. " + (data?.planned?.formattedWithSeparator ?? "0")
        utilizedAmountLabel.text = "Rs. " + (data?.spent?.formattedWithSeparator ?? "0")
        unUtilizedAmountLabel.text = "Rs. " + (data?.unspent?.formattedWithSeparator ?? "0")
        disbursedAmountLabel.text = "Rs. " + (data?.disbursed?.formattedWithSeparator ?? "0")
    }
    
    func fillProjectBudgetCell(data: ProjectBudgetData?) {
        budgetAllocatedLabel.text = "Rs. " + (data?.planned?.formattedWithSeparator ?? "0")
        titleLabel.text = data?.project_name
        utilizedAmountLabel.text = "Rs. " + (data?.utilized?.formattedWithSeparator ?? "0")
        unUtilizedAmountLabel.text = "Rs. " + (data?.unutilized?.formattedWithSeparator ?? "0")
        disbursedAmountLabel.text =  "Rs. " + (data?.disbursed?.formattedWithSeparator ?? "0")
    }
    
}
