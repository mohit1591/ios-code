//
//  ProjectBudgetHeaderTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/03/24.
//

import UIKit

class ProjectBudgetHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var budgetStackView: UIView!
    @IBOutlet weak var budgetAllocatedLabel: UILabel!
    @IBOutlet weak var budgetStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
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
    
}
