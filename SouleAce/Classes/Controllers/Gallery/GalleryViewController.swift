//
//  GalleryViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 23/02/24.
//

import UIKit
import AVFoundation

class GalleryViewController: BaseViewController {
    
    @IBOutlet weak var photoBorderView: UIView!
    @IBOutlet weak var videoBorderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterTitleLabel: UILabel!
    @IBOutlet weak var filterTableView: UITableView!
    
    var filters : [ReportFilterData]?
    var selectedFilter : ReportFilterData?
    var isPhoto = "1"
    var galleryData : [GalleryData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filterTableView.isHidden = true
//        isPhoto = "1"
    }
    
    func setupUI() {
        getFilterData()
        videoBorderView.isHidden = true
        setupTableView()
        sideMenuDelegate = self
        filterTableView.isHidden = true
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.galleryTableViewCell)
        
        filterTableView.delegate = self
        filterTableView.dataSource = self
        filterTableView.register(cell: Cell.sideMenuCell)
        
        filterTableView.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        filterTableView.layer.shadowOpacity = 0.5
        filterTableView.layer.shadowOffset = CGSize(width: 0, height: 2)
        filterTableView.layer.shadowRadius = 4
        filterTableView.layer.masksToBounds = false
    }
    
    func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
        let asset = AVAsset(url: URL(string: url) ?? URL(fileURLWithPath: ""))
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        //Can set this to improve performance if target size is known before hand
        //assetImgGenerate.maximumSize = CGSize(width,height)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
          print(error.localizedDescription)
          return nil
        }
    }
    
    func moveToGalleryDetail(selectedIndex: Int) {
        print("galllry data::\(galleryData?[selectedIndex])")
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.galleryDetailVC) as? GalleryDetailViewController {
            vc.id = "\(galleryData?[selectedIndex].id ?? 0)"
            vc.isPhoto = isPhoto
            vc.isFromProjectDetailScreen = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //    MARK: - Button Action
    
    @IBAction func sideMenuActionButton(_ sender: UIButton) {
        self.sideMenuView.isHidden = false
        view.bringSubviewToFront(sideMenuView)
        sideMenuController?.openMenu(animation: true)
    }
    
    @IBAction func openFilterViewAction(_ sender: UIButton) {
        filterTableView.isHidden = false
    }
    
    @IBAction func videoAlbumAction(_ sender: UIButton) {
        photoBorderView.isHidden = true
        videoBorderView.isHidden = false
        filterTableView.isHidden = true
        isPhoto = "2"
        getAlbum()
    }
    
    @IBAction func photoAlbumButtonAction(_ sender: UIButton) {
        photoBorderView.isHidden = false
        videoBorderView.isHidden = true
        filterTableView.isHidden = true
        isPhoto = "1"
        getAlbum()
    }
    
}

// MARK: - yearChangedDelegate

extension GalleryViewController: yearChangedDelegate {
    
    func yearChanged() {
    }
    
}
