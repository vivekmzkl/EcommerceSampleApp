//
//  HomeData.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import Foundation

struct HomeData: Decodable {
    let type: HomeType
    let values: [Value]
    
    enum HomeType: String, Decodable {
        case category
        case banners
        case products
    }
    
    struct Value: Decodable {
        let id: Int
        let name: String?
        let imageURL, bannerURL: String?
        let image: String?
        let actualPrice, offerPrice: String?
        let offer: Int?
        let isExpress: Bool?

        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
            case bannerURL = "banner_url"
            case image
            case actualPrice = "actual_price"
            case offerPrice = "offer_price"
            case offer
            case isExpress = "is_express"
        }
    }
}
