//
//  ActivityProgressTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 29/02/24.
//

import UIKit

class ActivityProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var progressBarLabel: UILabel!
    @IBOutlet weak var progressSuperView: UIView!
    @IBOutlet weak var preogessBarView: UIView!
    @IBOutlet weak var progressViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var projectTypeLabel: UILabel!
    @IBOutlet weak var approvedLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var inProgressLabel: UILabel!
    @IBOutlet weak var yetToStartLabel: UILabel!
    @IBOutlet weak var onTimeLabel: UILabel!
    @IBOutlet weak var behindSheduleLabel: UILabel!
    @IBOutlet weak var totalActivityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        setupUI()
    }
    
    func setupUI() {
        borderView.layer.cornerRadius = 12
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 0.3
        
        progressSuperView.layer.cornerRadius = 12
        progressSuperView.layer.masksToBounds = true
    }
        
    func fillCell(data: ProjectProgress?) {
        projectTypeLabel.text = data?.project_type ?? ""
        approvedLabel.text = "\(data?.approved ?? 0)"
        completedLabel.text = "\(data?.completed ?? 0)"
        inProgressLabel.text = "\(data?.wip ?? 0)"
        yetToStartLabel.text = "\(data?.yet_to_start ?? 0)"
        onTimeLabel.text = "\(data?.ontime ?? 0)"
        behindSheduleLabel.text = "\(data?.behindsch ?? 0)"
        totalActivityLabel.text = "\(data?.tot ?? 0)"
        titleLabel.text = data?.project_name
        
        let width = self.frame.width - 42
        progressViewWidthConstraint.constant = CGFloat((Int(width) * (data?.progress ?? 0)) / 100)
        progressBarLabel.text = "\(data?.progress ?? 0)%"
        layoutSubviews()
        layoutIfNeeded()
    }
    
}
