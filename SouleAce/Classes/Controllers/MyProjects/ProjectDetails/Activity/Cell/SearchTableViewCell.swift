//
//  SearchTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 18/03/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var borderView: UIView!
    
    var handleSearchAction: (()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        borderView.layer.cornerRadius = 8
        borderView.layer.borderWidth = 0.3
        borderView.clipsToBounds = true
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        handleSearchAction?()
    }
    
}
