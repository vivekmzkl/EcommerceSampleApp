//
//  HomeViewController.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import UIKit

protocol ViewModel {
    var itemsDidChange: ((Any?) -> Void)? { get set }
    var errorOccured: ((String) -> Void)? { get set }
    var presentAlert: ((_ alert: String) -> Void)? { get set }
}

extension ViewModel {
    func alert(title: String, message: String) -> UIAlertController {
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
        }))
        return refreshAlert
    }
}
