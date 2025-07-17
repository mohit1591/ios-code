//
//  GalleryDetailViewController.swift
//  SouleAce
//
//  Created by ideveloper7 on 26/02/24.
//

import UIKit
import AVFoundation
import AVKit
import Photos

class GalleryDetailViewController: UIViewController {

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewView: UIView!
    
    @IBOutlet weak var previewCollectionView: UICollectionView!
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    var id = "0"
    var albumData : Albums?
    var galleryData : [GalleryData]?
    var galleryDetailData : [AlbumContent]?
    var isPhoto = "1"
    var selectedPreviewImgIndex = 0
    var player : AVPlayer?
    var isFromProjectDetailScreen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
        if isFromProjectDetailScreen {
            titleLabel.text = albumData?.name
            galleryDetailData = albumData?.album_content
            galleryCollectionView.reloadData()
        } else {
            getMediaData()
        }
        
        setupCollectionView()
        setupPreviewCollectionView()
        previewView.isHidden = true

    }
    
    func setupCollectionView() {
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.register(cell: Cell.galleryDetailCollectionViewCell)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        galleryCollectionView!.collectionViewLayout = layout
    }
    
    func setupPreviewCollectionView() {
        previewCollectionView.delegate = self
        previewCollectionView.dataSource = self
        previewCollectionView.register(cell: Cell.previewCollectionViewCell)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        previewCollectionView?.collectionViewLayout = layout
    }
        
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        
        let vc = AVPlayerViewController()
        vc.player = player
        
        self.present(vc, animated: true) { vc.player?.play() }
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
    
    func downloadFile(from urlString: String, completion: @escaping (URL?, Error?) -> Void) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let destinationURL = documentsDirectory.appendingPathComponent(url.lastPathComponent)
                
                do {
                    try data.write(to: destinationURL)
                    completion(destinationURL, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                let error = NSError(domain: "HTTP", code: statusCode, userInfo: nil)
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func saveMediaToGallery(from fileURL: URL) {
        let assetType: PHAssetMediaType
        if fileURL.pathExtension.lowercased() == "jpg" || fileURL.pathExtension.lowercased() == "png" {
            assetType = .image
        } else if fileURL.pathExtension.lowercased() == "mp4" || fileURL.pathExtension.lowercased() == "mov" {
            assetType = .video
        } else {
            print("Unsupported file type.")
            Utils.hideSpinner()
            Utils.alert(message: "Error saving to gallery")
            return
        }

        PHPhotoLibrary.shared().performChanges({
            if assetType == .image {
                PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: fileURL)
            } else if assetType == .video {
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: fileURL)
            }
        }) { success, error in
            Utils.hideSpinner()
            if success {
                if assetType == .image {
                    print("Image saved to gallery successfully.")
                } else if assetType == .video {
                    print("Video saved to gallery successfully.")
                }
                Utils.alert(message: "Downloaded Successfully")
            } else {
                if assetType == .image {
                    Utils.alert(message: "Error saving image to gallery")
                    print("Error saving image to gallery: \(error?.localizedDescription ?? "Unknown error")")
                } else if assetType == .video {
                    Utils.alert(message: "Error saving video to gallery")
                    print("Error saving video to gallery: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
    
//    MARK: - Button Action

    @IBAction func hidePreviewAction(_ sender: UIButton) {
        previewView.isHidden = true
        player?.pause()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
