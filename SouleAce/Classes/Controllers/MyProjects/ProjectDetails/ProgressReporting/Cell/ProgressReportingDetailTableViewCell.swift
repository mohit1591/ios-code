//
//  ProgressReportingDetailTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/03/24.
//

import UIKit

class ProgressReportingDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var inProgressLabel: UILabel!
    @IBOutlet weak var yetToStartLabel: UILabel!
    @IBOutlet weak var onTimeLabel: UILabel!
    @IBOutlet weak var behindSheduleLabel: UILabel!
    @IBOutlet weak var totalActivityLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var percentageCompletedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        progressView.layer.cornerRadius = 8
    }
    
    func fillCell(data: ProgressData?) {
        completedLabel.text = "\(data?.completed ?? 0)"
        inProgressLabel.text = "\(data?.wip ?? 0)"
        yetToStartLabel.text = "\(data?.pending_activity ?? 0)"
        onTimeLabel.text = "\(data?.ontime ?? 0)"
        behindSheduleLabel.text = "\(data?.behind_schedule ?? 0)"
        totalActivityLabel.text = "\(data?.total_activity ?? 0)"
        
        let width = self.frame.width - 32
        progressViewWidthConstraint.constant = CGFloat((Int(width) * (data?.progress ?? 0)) / 100)
        percentageCompletedLabel.text = "\(data?.progress ?? 0)%"
        layoutSubviews()
        layoutIfNeeded()
    }
    
    func fillCell(data: Blocks?) {
        completedLabel.text = "\(data?.completed ?? 0)"
        inProgressLabel.text = "\(data?.wip ?? 0)"
        yetToStartLabel.text = "\(data?.pending_activity ?? 0)"
        onTimeLabel.text = "\(data?.ontime ?? 0)"
        behindSheduleLabel.text = "\(data?.behind_schedule ?? 0)"
        totalActivityLabel.text = "\(data?.total_activity ?? 0)"
        
        let width = self.frame.width - 32
        progressViewWidthConstraint.constant = CGFloat((Int(width) * (data?.progress ?? 0)) / 100)
        percentageCompletedLabel.text = "\(data?.progress ?? 0)%"
        layoutSubviews()
        layoutIfNeeded()
    }

    
}
