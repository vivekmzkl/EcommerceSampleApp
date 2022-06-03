//
//  ProductCollectionViewCellViewModel.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import Foundation

struct ProductCollectionViewCellViewModel {
    
    var product: HomeData.Value
    
    var hideExpressView: Bool {
        !(product.isExpress ?? false)
    }
    
    var hideOfferPercentageView: Bool {
        (product.offer ?? 0) <= 0
    }
    
    var discountPercentage: String? {
        if let offer = product.offer {
            return "\(offer)% OFF"
        }
        return nil
    }
}
