//
//  CategoryTableViewCell.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let id = "CategoryTableViewCell"
    @IBOutlet weak var cvCategories: UICollectionView!
    
    var categories = [HomeData.Value]() {
        didSet {
            DispatchQueue.main.async {
                self.cvCategories.reloadData()
            }
        }
    }

    func set(categories: [HomeData.Value]) {
        self.categories = categories
    }

}

extension CategoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
    
    
}
