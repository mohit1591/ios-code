//
//  ProjectProgressReportTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 02/04/24.
//

import UIKit

class ProjectProgressReportTableViewCell: UITableViewCell {

    @IBOutlet weak var behindScheduleLabel: UILabel!
    @IBOutlet weak var onTimeLabel: UILabel!
    @IBOutlet weak var yetToStartLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var inProgressLabel: UILabel!
    @IBOutlet weak var totalActivityLabel: UILabel!
    @IBOutlet weak var behindScheduleView: UIView!
    @IBOutlet weak var onTimeView: UIView!
    @IBOutlet weak var yetToStartView: UIView!
    @IBOutlet weak var completedView: UIView!
    @IBOutlet weak var inProgressView: UIView!
    @IBOutlet weak var totalActivityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        borderView(view: behindScheduleView)
        borderView(view: onTimeView)
        borderView(view: completedView)
        borderView(view: inProgressView)
        borderView(view: yetToStartView)
        borderView(view: totalActivityView)
    }
    
    func borderView(view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
    }
    
    func fillCell(data: ProgressReports?) {
        totalActivityLabel.text = "\(data?.total_activity ?? 0)"
        inProgressLabel.text = "\(data?.wip ?? 0)"
        completedLabel.text = "\(data?.completed ?? 0)"
        yetToStartLabel.text = "\(data?.pending_activity ?? 0)"
        onTimeLabel.text = "\(data?.ontime ?? 0)"
        behindScheduleLabel.text = "\(data?.behind_schedule ?? 0)"
    }
    
}
