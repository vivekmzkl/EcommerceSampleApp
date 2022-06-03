//
//  CategoryCollectionViewCell.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let id = "CategoryCollectionViewCell"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vwImage: UIImageView!

    func set(category: HomeData.Value) {
        lblName.text = category.name
        vwImage.sd_setImage(with: URL(string: category.imageURL ?? ""), placeholderImage: UIImage(named: "ic.placeholder"))

    }
}
