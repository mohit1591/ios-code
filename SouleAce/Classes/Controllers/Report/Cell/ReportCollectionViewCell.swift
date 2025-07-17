//
//  ReportCollectionViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 23/02/24.
//

import UIKit

class ReportCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillCell(value: ReportData?) {
        titleLabel.text = value?.report_title
            
        var extention = value?.report_file_name
        extention = extention?.after(first: ".")
        
        if extention == "pdf" {
            imageView.image = UIImage(named: "pdf_icon")
        } else if extention == "docx" {
            imageView.image = UIImage(named: "document_icon")
        } else if extention == "doc" {
            imageView.image = UIImage(named: "document_icon")
        } else if extention == "xls" {
            imageView.image = UIImage(named: "xls_icon")
        } else if extention == "xlsx" {
            imageView.image = UIImage(named: "xls_icon")
        } else if extention == "csv" {
            imageView.image = UIImage(named: "csv_icon")
        } else if extention == "ppt" {
            imageView.image = UIImage(named: "ppt_icon")
        } else if extention == "pptx" {
            imageView.image = UIImage(named: "ppt_icon")
        } else if extention == "folder" {
            imageView.image = UIImage(named: "folder_icon")
        }
    }
    
    func fillDocumentCell(data: DocumentsDetails?) {
        
        titleLabel.text = data?.title
        if data?.type == "pdf" {
            imageView.image = UIImage(named: "pdf_icon")
        } else if data?.type == "doc" {
            imageView.image = UIImage(named: "document_icon")
        } else if data?.type == "docx" {
            imageView.image = UIImage(named: "document_icon")
        } else if data?.type == "csv" {
            imageView.image = UIImage(named: "csv_icon")
        } else if data?.type == "xls" {
            imageView.image = UIImage(named: "xls_icon")
        } else if data?.type == "xlsx" {
            imageView.image = UIImage(named: "xls_icon")
        } else if data?.type == "ppt" {
            imageView.image = UIImage(named: "ppt_icon")
        } else if data?.type == "pptx" {
            imageView.image = UIImage(named: "ppt_icon")
        } else if data?.type == "folder" {
            imageView.image = UIImage(named: "folder_icon")
        }
    }
    
    func fillProjectReportCell(data: ProjectReports?) {
        titleLabel.text = data?.report_title
        if data?.file_type == "pdf" {
            imageView.image = UIImage(named: "pdf_icon")
        } else if data?.file_type == "doc" {
            imageView.image = UIImage(named: "document_icon")
        } else if data?.file_type == "docx" {
            imageView.image = UIImage(named: "document_icon")
        } else if data?.file_type == "xls" {
            imageView.image = UIImage(named: "xls_icon")
        } else if data?.file_type == "xlsx" {
            imageView.image = UIImage(named: "xls_icon")
        } else if data?.file_type == "csv" {
            imageView.image = UIImage(named: "csv_icon")
        }else if data?.file_type == "ppt" {
            imageView.image = UIImage(named: "ppt_icon")
        }else if data?.file_type == "pptx" {
            imageView.image = UIImage(named: "ppt_icon")
        } else if data?.file_type == "folder" {
            imageView.image = UIImage(named: "folder_icon")
        }
    }

}
