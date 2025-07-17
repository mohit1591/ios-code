//
//  SDGDetailTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 21/02/24.
//

import UIKit

class SDGDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var beneficiaryLabel: UILabel!
    @IBOutlet weak var projectCodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addShadow()
    }
    
    func addShadow() {
        borderView.layer.cornerRadius = 12
        borderView.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        borderView.layer.shadowOpacity = 0.5
        borderView.layer.shadowOffset = CGSize(width: 0, height: 2)
        borderView.layer.shadowRadius = 2
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell(project: SdgsProjects?) {
        beneficiaryLabel.text = "\(project?.target_beneficiaries ?? "")"
        titleLabel.text = project?.project_name
        projectCodeLabel.text = project?.project_code
    }
}
