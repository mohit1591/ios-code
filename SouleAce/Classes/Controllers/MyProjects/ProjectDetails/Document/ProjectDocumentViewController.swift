//
//  ProjectDocumentViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 13/03/24.
//

import UIKit

class ProjectDocumentViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var projectSelectedView: UIView!
    @IBOutlet weak var statutorySelectedView: UIView!
    
    var documents: [DocumentsDetails]?
    var projectName = ""
    var implementingPartner = ""
    var year = selectedFinancialYear
    var projectId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupCollectionView()
        projectSelected()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cell: Cell.reportCollectionViewCell)
        collectionView.register(cell: Cell.documentDetailCollectionViewCell)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView!.collectionViewLayout = layout
    }
    
    func statutorySelected() {
        projectSelectedView.isHidden = true
        statutorySelectedView.isHidden = false
        getDocuments(isFromProject: false)
    }
    
    func projectSelected() {
        projectSelectedView.isHidden = false
        statutorySelectedView.isHidden = true
        getDocuments(isFromProject: true)
    }
    
    func moveTDirectory(directoryId: Int, projectId: Int) {
        let storyBoard = UIStoryboard(name: StoryBoard.projects, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.folderViewController) as? FolderViewController {
            vc.directoryId = directoryId
            vc.projectId = projectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
// MARK: - Button Action
    
    @IBAction func statutoryAction(_ sender: UIButton) {
        statutorySelected()
    }
    
    @IBAction func projectAction(_ sender: UIButton) {
        projectSelected()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
