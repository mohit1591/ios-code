//
//  IsRegisterTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import UIKit

class IsRegisterTableViewCell: UITableViewCell {

    @IBOutlet weak var regCertificateLabel: UILabel!
    @IBOutlet weak var regNumnerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        // Configure the view for the selected state
    }
    
    func setupUI() {
        borderView.layer.cornerRadius = 12
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 0.3
    }
    
    func fillCert80gCell(data: Cert80g?) {
        titlelabel.text = "Is 80 G Registerd?"
        regNumnerLabel.text = data?.registration_number
        
        if data?.registration_certificate_file?.isEmpty ?? false || data?.registration_certificate_file == nil {
            regCertificateLabel.text = "No"
        } else {
            regCertificateLabel.text = "Yes"
        }
        statusLabel.text = data?.status
    }
    
    func fillCert12aCell(data: Cert12a?) {
        titlelabel.text = "Is 12 A Registerd?"
        regNumnerLabel.text = data?.registration_number
        
        if data?.registration_certificate_file?.isEmpty ?? false || data?.registration_certificate_file == nil {
            regCertificateLabel.text = "No"
        } else {
            regCertificateLabel.text = "Yes"
        }
        statusLabel.text = data?.status
    }
    
    func fillCertFcraCell(data: CertFcra?) {
        titlelabel.text = "Is FCRA Registerd?"
        regNumnerLabel.text = data?.registration_number
        if data?.registration_certificate_file?.isEmpty ?? false || data?.registration_certificate_file == nil {
            regCertificateLabel.text = "No"
        } else {
            regCertificateLabel.text = "Yes"
        }
        statusLabel.text = data?.status
    }
    
}
