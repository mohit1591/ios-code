//
//  MyProjectsTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 15/02/24.
//

import UIKit
import SDWebImage

class MyProjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var beneficaryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var ngoLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        borderView.layer.cornerRadius = 12
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell(project: Projects?) {
        beneficaryLabel.text = project?.targetBeneficiaries ?? ""
        stateLabel.text = project?.locState ?? ""
        ngoLabel.text = project?.ngoName ?? ""
        themeLabel.text = project?.theme ?? ""
        projectNameLabel.text = project?.projectName ?? ""
//        let imageUrl = URL(string: project?.projectImage ?? "")
//        projectImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "download"))
    }
    
    func fillContactDetailCell(data: NgoContactData?) {
        
    }
    
}
