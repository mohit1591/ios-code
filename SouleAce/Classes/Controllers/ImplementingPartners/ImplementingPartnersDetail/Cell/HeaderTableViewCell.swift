//
//  HeaderView.swift
//  SouleAce
//
//  Created by ideveloper7 on 07/03/24.
//

import UIKit

class HeaderTableViewCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titlelLabel: UILabel!
    @IBOutlet weak var hideShowButton: UIButton!
    
    var handleShowHideAction: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setTitle(text: String) {
        titlelLabel.text = text
    }
    
    @IBAction func showHideRowsAction(_ sender: UIButton) {
        handleShowHideAction?()
    }
}
