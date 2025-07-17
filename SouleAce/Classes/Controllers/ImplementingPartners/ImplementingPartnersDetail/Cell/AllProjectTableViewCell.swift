//
//  AllProjectTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import UIKit

class AllProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var budgetPlannedLabel: UILabel!
    @IBOutlet weak var noOfBeneficiariesLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var titleNameLabel: UILabel!
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
    
    func fillCell(data: NgoProjects?) {
        
        budgetPlannedLabel.text = "Rs. \(data?.total_project_budget?.convertIntToCrString() ?? "") Cr"
        noOfBeneficiariesLabel.text = data?.target_beneficiaries
        stateLabel.text = data?.states
        titleNameLabel.text = data?.project_name
    }
    
}
