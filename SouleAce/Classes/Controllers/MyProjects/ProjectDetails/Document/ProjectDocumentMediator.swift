//
//  ProjectDocumentMediator.swift
//  SouleAce
//
//  Created by ideveloper7 on 13/03/24.
//

import Foundation
import UIKit

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ProjectDocumentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
         return 1
        } else {
            return documents?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.documentDetailCollectionViewCell, for: indexPath) as? DocumentDetailCollectionViewCell else { return UICollectionViewCell() }
            cell.projectNameLabel.text = projectName
            cell.implementingPartnerLabel.text = implementingPartner
            cell.yearLabel.text = "Year \(selectedFinancialYear)"
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reportCollectionViewCell, for: indexPath) as? ReportCollectionViewCell else { return UICollectionViewCell() }
            cell.fillDocumentCell(data: documents?[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = Int((collectionView.bounds.width - 20))
         return CGSize(width: width, height: 145)
        } else {
            let noOfCellsInRow = 3   //number of column you want
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace - 20) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 140)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if documents?[indexPath.item].type == "pdf" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.item].type == "docx" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.row].type == "doc" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.row].type == "xls" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.row].type == "xlsx" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.row].type == "csv" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.row].type == "ppt" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.row].type == "pptx" {
                self.openURL(link: documents?[indexPath.item].path ?? "")
            } else if documents?[indexPath.item].type == "folder" {
                moveTDirectory(directoryId: documents?[indexPath.item].document_id ?? 0, projectId: documents?[indexPath.item].project_id ?? 0)
            }
        }
    }
    
}
