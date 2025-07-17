//
//  CSRKnowledgeBaseTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 05/03/24.
//

import UIKit

class CSRKnowledgeBaseTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var changesSectionNotificationLabel: UILabel!
    @IBOutlet weak var amendmentLabel: UILabel!
    @IBOutlet weak var keywordsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var handleViewAttachmentClick: (()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
    
    func fillCell(data: CSRData?) {
        descriptionLabel.text = data?.csr_description
        titleLabel.text = data?.csr_title
        changesSectionNotificationLabel.text = data?.changes_section_notification
        amendmentLabel.text = data?.amendment
        keywordsLabel.text = data?.csr_keywords
        dateLabel.text = data?.csr_released_date
    }
    
    @IBAction func viewAttachmentAction(_ sender: UIButton) {
        handleViewAttachmentClick?()
    }
}
