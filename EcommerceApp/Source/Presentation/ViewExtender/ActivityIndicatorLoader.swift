//
//  ActivityIndicatorLoader.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

extension UIViewController {
    func showActivityIndicator() -> UIActivityIndicatorView {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: 80, height: 80) // Set X and Y whatever you want
        container.backgroundColor = .clear

        let activityView = UIActivityIndicatorView(style: .large)
        activityView.center = self.view.center

        container.addSubview(activityView)
        self.view.addSubview(container)
        activityView.startAnimating()
        return activityView
    }
    
    func hideActivityIndicator(_ indicator: UIActivityIndicatorView) {
        indicator.stopAnimating()
        indicator.superview?.removeFromSuperview()
    }
}
