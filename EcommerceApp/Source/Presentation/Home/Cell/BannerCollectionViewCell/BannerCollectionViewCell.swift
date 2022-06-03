//
//  BannerCollectionViewCell.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let id = "BannerCollectionViewCell"

    @IBOutlet weak var vwImage: UIImageView!

    func set(banner: HomeData.Value) {
        vwImage.sd_setImage(with: URL(string: banner.bannerURL ?? ""), placeholderImage: UIImage(named: "ic.placeholder"))

    }
}
