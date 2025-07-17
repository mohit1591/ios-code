//
//  ProjectTimeLineTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/04/24.
//

import UIKit

class ProjectTimeLineTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var duractionLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var duractionView: UIView!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var startDateView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        borderView(view: startDateView)
        borderView(view: endDateView)
        borderView(view: duractionView)
        borderView(view: statusView)
    }
    
    func borderView(view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
    }
    
    func fillCell(data: ProjectTimeline?) {
        statusLabel.text = data?.project_status
        duractionLabel.text = data?.project_duration
        startDateLabel.text = data?.project_start_date
        endDateLabel.text = data?.project_end_date
    }
    
}
