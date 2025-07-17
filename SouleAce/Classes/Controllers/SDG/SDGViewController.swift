//
//  SDGViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 20/02/24.
//

import UIKit

class SDGViewController: BaseViewController {

    @IBOutlet weak var sdgCollectionVIew: UICollectionView!
    
    var sdgProjects: [Sdgs]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getSDG()
        sideMenuDelegate = self
    }
        
    func setupCollectionView() {
        sdgCollectionVIew.dataSource = self
        sdgCollectionVIew.delegate = self
        sdgCollectionVIew.register(cell: Cell.sdgCollectionViewCell)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        sdgCollectionVIew!.collectionViewLayout = layout
    }
    
    func moveToSDGDetailView(sdg: Sdgs?) {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.sdgDetailVC) as? SDGDetailViewController {
            vc.sdg = sdg
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func sideMenuAction(_ sender: Any) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
}

// MARK: - SideMenuDelegate

extension SDGViewController: yearChangedDelegate {
    func yearChanged() {
    }
}
