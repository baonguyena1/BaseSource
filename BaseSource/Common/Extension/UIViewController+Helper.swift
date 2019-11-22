//
//  UIViewController+Helper.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/22/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    func showError(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
