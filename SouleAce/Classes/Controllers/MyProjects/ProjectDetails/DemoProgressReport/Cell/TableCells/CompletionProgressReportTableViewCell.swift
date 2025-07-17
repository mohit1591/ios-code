//
//  CompletionProgressReportTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/03/24.
//

import UIKit

class CompletionProgressReportTableViewCell: UITableViewCell {

    @IBOutlet weak var progressViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell(data: ComplitionData?) {
//        progressLabel.text = "\(data?.perc_of_completion ?? 0)%"
        titleLabel.text = data?.monthYear
        descriptionLabel.text = data?.remark
        
        let width = self.frame.width - 32
        progressViewWidthConstraint.constant = CGFloat((Int(width) * (data?.perc_of_completion ?? 0)) / 100)
        progressLabel.text = "\(data?.perc_of_completion ?? 0)%"
        layoutSubviews()
    }
    
}
