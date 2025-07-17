//
//  PreviewCollectionViewCell.swift
//  SouleAce
//
//  Created by ideveloper7 on 27/02/24.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var previewImgView: UIImageView!
    
    var handlePlayButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func playAction(_ sender: UIButton) {
        handlePlayButtonAction?()
    }
}
