//
//  OrganaizationDetailTableViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 04/03/24.
//

import UIKit

class OrganaizationDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var factSheetLabel: UILabel!
    @IBOutlet weak var antiBriberyDeclaration: UILabel!
    @IBOutlet weak var professionalTaxCertificate: UILabel!
    @IBOutlet weak var deedLabel: UILabel!
    @IBOutlet weak var certificateLabel: UILabel!
    @IBOutlet weak var csrForm1Label: UILabel!
    @IBOutlet weak var copyOfPanLabel: UILabel!
    @IBOutlet weak var yearOfRegistrationLabel: UILabel!
    @IBOutlet weak var darpanNoLabel: UILabel!
    @IBOutlet weak var registrationNoLabel: UILabel!
    @IBOutlet weak var csrRegistrationLabel: UILabel!
    @IBOutlet weak var panNoLabel: UILabel!
    @IBOutlet weak var organizationTypeLabel: UILabel!
    @IBOutlet weak var organizationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fillOrgaionzationDataCell(data: OrgaionzationData?) {
        
        if data?.anti_bribery_certificate?.isEmpty ?? false || data?.anti_bribery_certificate == nil {
            antiBriberyDeclaration.text = "No"
        } else {
            antiBriberyDeclaration.text = "Yes"
        }
        if data?.professional_tax_certificate?.isEmpty ?? false || data?.professional_tax_certificate == nil {
            professionalTaxCertificate.text = "No"
        } else {
            professionalTaxCertificate.text = "Yes"
        }
        
        if data?.moa_deed?.isEmpty ?? false || data?.moa_deed == nil {
            deedLabel.text = "No"
        } else {
            deedLabel.text = "Yes"
        }
        
        if data?.copy_of_pan?.isEmpty ?? false || data?.copy_of_pan == nil {
            copyOfPanLabel.text = "No"
        } else {
            copyOfPanLabel.text = "Yes"
        }
        
        if data?.registration_certificate?.isEmpty ?? false || data?.registration_certificate == nil {
            certificateLabel.text = "No"
        } else {
            certificateLabel.text = "Yes"
        }
        
        if data?.csr_form_1?.isEmpty ?? false || data?.csr_form_1 == nil {
            csrForm1Label.text = "No"
        } else {
            csrForm1Label.text = "Yes"
        }
        
        if data?.fact_sheet?.isEmpty ?? false || data?.csr_form_1 == nil {
            factSheetLabel.text = "No"
        } else {
            factSheetLabel.text = "Yes"
        }
        
        organizationNameLabel.text = data?.ngo_name
        organizationTypeLabel.text = data?.organisation_type
        panNoLabel.text = data?.pan_no
        csrRegistrationLabel.text = data?.csr_reg_no
        registrationNoLabel.text = data?.registration_no
        darpanNoLabel.text = data?.darpan_number
        yearOfRegistrationLabel.text = data?.registration_year
    }
    
}
