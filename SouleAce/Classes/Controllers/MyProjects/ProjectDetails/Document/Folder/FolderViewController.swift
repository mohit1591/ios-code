//
//  FolderViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 14/03/24.
//

import UIKit

class FolderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var projectId = 0
    var directoryId = 0
    var documents: [DocumentsDetails]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupCollectionView()
        getDocumentFolders()
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

    @IBAction func backAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
