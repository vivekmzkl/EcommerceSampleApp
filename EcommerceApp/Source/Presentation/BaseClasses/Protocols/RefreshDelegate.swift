//
//  HomeViewController.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

protocol RefreshDelegate: AnyObject {
    func viewControllerNeedToRefresh(_ vc: UIViewController)
}
