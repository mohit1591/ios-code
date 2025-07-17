//
//  NgoTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import UIKit

class NgoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appliedLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var ngolabel: UILabel!
    @IBOutlet weak var reviewedDateLabel: UILabel!
    @IBOutlet weak var reviewedByLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    var handleKnowMoreAction: (()-> Void)?
    
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
    
    func fillCell(data: NgoData?) {
        appliedLabel.text = data?.applied_date?.converDateInto()
        stateLabel.text = data?.state_name
        themeLabel.text = data?.theme_name
        ngolabel.text = data?.ngo_name
        reviewedByLabel.text = data?.reviewed_by
        reviewedDateLabel.text = data?.reviewed_date?.converDateInto()
        stateLabel.text = data?.state_name
        stageLabel.text = data?.stages_name
        budgetLabel.text = data?.budget
        titleLabel.text = data?.proposal_title
        statusLabel.text = data?.proposal_status
    }
    
    @IBAction func knowMoreAction(_ sender: UIButton) {
        handleKnowMoreAction?()
    }
    
}
