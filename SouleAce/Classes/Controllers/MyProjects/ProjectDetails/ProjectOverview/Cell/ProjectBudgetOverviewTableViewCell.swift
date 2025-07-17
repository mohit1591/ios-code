//
//  ProjectBudgetTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 02/04/24.
//

import UIKit

class ProjectBudgetOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var utilizedLabel: UILabel!
    @IBOutlet weak var unutilizedLabel: UILabel!
    @IBOutlet weak var plannedLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var disbursedAmountLabel: UILabel!
    @IBOutlet weak var plannedView: UIView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var disbursedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        borderView(view: plannedView)
        borderView(view: totalView)
        borderView(view: disbursedView)
    }
    
    func borderView(view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
    }
    
    func fillCell(data: ProjectOverviewData?) {
        totalLabel.text = (data?.total_budget ?? "")
        plannedLabel.text = (data?.planned_budget ?? "")
        disbursedAmountLabel.text = (data?.disbursed_budget ?? "")
        unutilizedLabel.text = (data?.unutilized_budget ?? "")
        utilizedLabel.text = (data?.utilized_budget ?? "")
    }
}
