//
//  ProductCollectionViewCell.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let id = "ProductCollectionViewCell"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vwImage: UIImageView!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblDiscountedPrice: UILabel!
    @IBOutlet weak var lblOffPercentage: UILabel!
    @IBOutlet weak var vwExpress: UIView!
    @IBOutlet weak var vwContainer: UIView!
    
    override func awakeFromNib() {
        vwContainer.layer.borderColor = UIColor(named: "cl.border")?.cgColor
    }

    var viewModel: ProductCollectionViewCellViewModel!

    func set(product: HomeData.Value) {
        self.viewModel = ProductCollectionViewCellViewModel(product: product)
        
        lblName.text = product.name
        vwImage.sd_setImage(with: URL(string: product.image ?? ""), placeholderImage: UIImage(named: "ic.placeholder"))
        
        if let actualPrice = product.actualPrice {
            let attributeString =  NSMutableAttributedString(string: actualPrice)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            lblOriginalPrice.attributedText = attributeString
        }
        
        lblDiscountedPrice.text = product.offerPrice
        vwExpress.isHidden = self.viewModel.hideExpressView
        lblOffPercentage.superview?.isHidden = viewModel.hideOfferPercentageView
        if !viewModel.hideOfferPercentageView {
            lblOffPercentage.text = viewModel.discountPercentage
        }
        
    }
}
