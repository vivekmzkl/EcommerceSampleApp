//
//  HomeTableViewCell.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var vwCollection: UICollectionView!
    
    private var homeData: HomeData? {
        didSet {
            self.vwCollection.reloadData()
        }
    }

    func set(homeData: HomeData) {
        self.homeData = homeData
    }

}

extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeData?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch homeData?.type {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.id, for: indexPath) as! CategoryCollectionViewCell
            cell.set(category: homeData!.values[indexPath.row])
            return cell
        case .banners:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as! BannerCollectionViewCell
            cell.set(banner: homeData!.values[indexPath.row])
            return cell
        case .products:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.id, for: indexPath) as! ProductCollectionViewCell
            cell.set(product: homeData!.values[indexPath.row])
            return cell
        default:
            fatalError("Unknown cell")
        }
        
    }
}
