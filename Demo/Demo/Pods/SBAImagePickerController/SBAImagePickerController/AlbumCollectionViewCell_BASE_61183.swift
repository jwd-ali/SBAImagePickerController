//
//  AlbumCollectionViewCell.swift
//  Hidebox
//
//  Created by Shoaib Akhtar on 02/08/2019.
//  Copyright © 2019 QuantumCPH. All rights reserved.
//

import UIKit
import Photos

class AlbumCollectionViewCell: UICollectionViewCell,DequeueInitializable {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var thumnailImageView: UIImageView!
    
    var viewModel: AlbumCollectionViewCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumnailImageView.layer.cornerRadius = 5
        thumnailImageView.layer.masksToBounds = true
    }
    
    func config() {
        titleLabel.text = viewModel.title()
        countLabel.text = viewModel.photoCount()
        let size = thumnailImageView.frame.size
        viewModel.fetchFirstImageThumbnail {[weak self] (asset) in
            guard let strongself = self else {return}
            
            if let assets = asset, let viewAsset = assets.firstObject as? PHAsset {
                let _ =    PhotoManager.loadImage(for: viewAsset, targetSize: size, contentMode: .aspectFill, completion: { [weak self] (image) in
                    
                    self?.thumnailImageView.image = image
                    
                })
            } else {
                strongself.thumnailImageView.image = UIImage.bundleImage(named: "Placeholder")
            }
        }
    }
}
