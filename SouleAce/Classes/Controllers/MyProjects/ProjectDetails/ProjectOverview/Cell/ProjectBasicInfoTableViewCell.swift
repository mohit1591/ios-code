//
//  ProjectBasicInfoTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 01/04/24.
//

import UIKit

class ProjectBasicInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var implementationModeLabel: UILabel!
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var projectThemeLabel: UILabel!
    @IBOutlet weak var projectBeneficiariesLabel: UILabel!
    @IBOutlet weak var projectCodeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameBorderView: UIView!
    @IBOutlet weak var themeBorderView: UIView!
    @IBOutlet weak var beneficiarieyBorderView: UIView!
    @IBOutlet weak var projectCodeBorderView: UIView!
    @IBOutlet weak var modOfImplementationBorderView: UIView!
    @IBOutlet weak var stateBorderView: UIView!
    @IBOutlet weak var districtBorderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView(view: nameBorderView)
        borderView(view: themeBorderView)
        borderView(view: beneficiarieyBorderView)
        borderView(view: projectCodeBorderView)
        borderView(view: modOfImplementationBorderView)
        borderView(view: stateBorderView)
        borderView(view: districtBorderView)
    }
    
    func borderView(view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
    }
    
    func fillCell(data: BasicInfo?) {
        districtLabel.text = data?.district
        titleLabel.text = data?.project_name
        descLabel.text = data?.projectSummary
        
        projectCodeLabel.text = data?.projectCode
        projectBeneficiariesLabel.text = data?.projectBeneficiaries
        projectThemeLabel.text = data?.projectTheme
        activityNameLabel.text = data?.activityName
        implementationModeLabel.text = data?.modeOfImplementation
        stateLabel.text = data?.state
    }
    
}
