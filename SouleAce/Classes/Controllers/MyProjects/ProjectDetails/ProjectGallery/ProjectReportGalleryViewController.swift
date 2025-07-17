//
//  ProjectReportGalleryViewController.swift
//  SouleAce
//
//  Created by ideveloper1 on 26/03/24.
//

import UIKit
import AVFoundation

class ProjectReportGalleryViewController: UIViewController {
    
    @IBOutlet weak var projectDetailBorderView: UIView!
    @IBOutlet weak var photoBorderView: UIView!
    @IBOutlet weak var videoBorderView: UIView!
    @IBOutlet weak var implementingPartnerLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var isPhoto = "1"
    var albumData : [Albums]?
    var galleryDetailData : [AlbumContent]?
    
    var projectName = ""
    var implementingPartner = ""
    var projectId = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        fetchReportAlbumData()
        setupTableView()
        
        projectNameLabel.text = projectName
        implementingPartnerLabel.text = implementingPartner
        yearLabel.text = "Year " + selectedFinancialYear
        
        projectDetailBorderView.layer.cornerRadius = 12
        projectDetailBorderView.layer.borderWidth = 0.3
        
        videoBorderView.isHidden = true
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: Cell.galleryTableViewCell)
        tableView.showsVerticalScrollIndicator = false
        
//        tableView.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
//        tableView.layer.shadowOpacity = 0.5
//        tableView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        tableView.layer.shadowRadius = 4
//        tableView.layer.masksToBounds = false
    }
    
    func moveToGalleryDetail(selectedAlbum: Albums?) {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: Controller.galleryDetailVC) as? GalleryDetailViewController {
            vc.albumData = selectedAlbum
            vc.isPhoto = isPhoto
            vc.isFromProjectDetailScreen = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
        let asset = AVAsset(url: URL(string: url)!)
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
    
    @IBAction func videoAlbumAction(_ sender: UIButton) {
        photoBorderView.isHidden = true
        videoBorderView.isHidden = false
        isPhoto = "2"
        fetchReportAlbumData()
    }
    
    @IBAction func photoAlbumButtonAction(_ sender: UIButton) {
        photoBorderView.isHidden = false
        videoBorderView.isHidden = true
        isPhoto = "1"
        fetchReportAlbumData()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

