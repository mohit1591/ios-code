//
//  AllUsersTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 08/03/24.
//

import UIKit

class AllUsersTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var userStatusLabel: UILabel!
    @IBOutlet weak var userTypeLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var mobileNoLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    func setupUI() {
        borderView.layer.cornerRadius = 12
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCell(data: AllUsers?) {
        userNameLabel.text = data?.first_name ?? ""
        userStatusLabel.text = data?.user_status
        userTypeLabel.text = data?.user_type_title
        projectNameLabel.text = data?.project_name
        mobileNoLabel.text = data?.mobile_no
        userIdLabel.text = data?.username
    }
    
}
