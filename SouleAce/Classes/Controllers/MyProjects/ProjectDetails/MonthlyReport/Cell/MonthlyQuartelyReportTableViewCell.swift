//
//  MonthlyQuartelyReportTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 28/03/24.
//

import UIKit

class MonthlyQuartelyReportTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdMonthStack: UIStackView!
    @IBOutlet weak var secondMonthStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var thirdMonthTitleLabel: UILabel!
    @IBOutlet weak var secondMonthTitleLabel: UILabel!
    @IBOutlet weak var firstMonthTitleLabel: UILabel!
    @IBOutlet weak var totalDataLabel: UILabel!
    @IBOutlet weak var thirdMonthDataLabel: UILabel!
    @IBOutlet weak var secondMonthDataLabel: UILabel!
    @IBOutlet weak var firstMonthDataLabel: UILabel!
    
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
    
    func fillQ1Cell() {
        firstMonthTitleLabel.text = "Apr"
        secondMonthTitleLabel.text = "May"
        thirdMonthTitleLabel.text = "Jun"
        totalTitleLabel.text = "Total"
        secondMonthStack.isHidden = false
        thirdMonthStack.isHidden = false
    }
    
    func fillQ2Cell() {
        firstMonthTitleLabel.text = "Jul"
        secondMonthTitleLabel.text = "Aug"
        thirdMonthTitleLabel.text = "Sep"
        totalTitleLabel.text = "Total"
        secondMonthStack.isHidden = false
        thirdMonthStack.isHidden = false
    }
    
    func fillQ3Cell() {
        firstMonthTitleLabel.text = "Oct"
        secondMonthTitleLabel.text = "Nov"
        thirdMonthTitleLabel.text = "Dec"
        totalTitleLabel.text = "Total"
        secondMonthStack.isHidden = false
        thirdMonthStack.isHidden = false
    }
    
    func fillOverallCell() {
        firstMonthTitleLabel.text = "Target"
        totalTitleLabel.text = "Achievements"
        secondMonthStack.isHidden = true
        thirdMonthStack.isHidden = true
    }
    
    func fillMonthlyCell(data: ProjectMonthlyData?) {
        
        var firstMonth: Int = 0
        var secondMonth: Int = 0
        var thirdMonth: Int = 0
        var total: Int = 0
        
        firstMonth = Int(data?.month1?.numberWithoutFormat ?? "0") ?? 0
        secondMonth = Int(data?.month2?.numberWithoutFormat ?? "0") ?? 0
        thirdMonth = Int(data?.month3?.numberWithoutFormat ?? "0") ?? 0
        
        total = firstMonth + secondMonth + thirdMonth
        
        firstMonthDataLabel.text = data?.month1
        secondMonthDataLabel.text = data?.month2
        thirdMonthDataLabel.text = data?.month3
        totalDataLabel.text = total.formattedWithSeparator
        titleLabel.text = data?.title
    }
    
    func fillOverAllDataCell(data: ProjectMonthlyData?) {
        firstMonthDataLabel.text = data?.target
        totalDataLabel.text = data?.achievements
        titleLabel.text = data?.title
    }
    
}
