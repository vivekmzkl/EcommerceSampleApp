//
//  HomeViewController.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var vwSearchContainer: UIView!
    @IBOutlet weak var cvCategories: UICollectionView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setViews()
    }
    
}

// MARK: - UI updates
extension HomeViewController {
    func setViews() {
        vwSearchContainer.layer.borderColor = UIColor(named: "cl.border")?.cgColor
    }
}
