//
//  PersonalDetailTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import UIKit

class ProposalDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var potentialImpactText: UILabel!
    @IBOutlet weak var projectBriefAttachment: UILabel!
    @IBOutlet weak var projectBrief: UILabel!
    @IBOutlet weak var expectedBeneficarieLabel: UILabel!
    @IBOutlet weak var targetGroupLabel: UILabel!
    @IBOutlet weak var pleaseSpeciftTargetGroupLabel: UILabel!
    @IBOutlet weak var statesLabel: UILabel!
    @IBOutlet weak var actualBudgetLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var projectDuractionLabel: UILabel!
    @IBOutlet weak var trustLabel: UILabel!
    @IBOutlet weak var projectConceptLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func fillPersonalDetialCell(data: ProposalDetails?) {
        potentialImpactText.text = data?.potential_impact
        projectBrief.text = data?.project_brief
        expectedBeneficarieLabel.text = data?.expected_beneficiaries
        targetGroupLabel.text = data?.target_group
        pleaseSpeciftTargetGroupLabel.text = data?.target_group_others
        statesLabel.text = data?.states
        actualBudgetLabel.text = data?.actual_budget
        budgetLabel.text = data?.budget
        projectDuractionLabel.text = data?.project_duration
        trustLabel.text = data?.thrust_area
        projectConceptLabel.text = data?.project_concept
        
        if data?.project_brief_file?.isEmpty ?? false || data?.project_brief_file == nil {
            projectBriefAttachment.text = "No"
        } else {
            projectBriefAttachment.text = "Yes"
        }
        
    }
    
}
