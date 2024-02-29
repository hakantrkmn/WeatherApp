//
//  UIViewController+Ext.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 5.02.2024.
//

import Foundation
import UIKit

extension UIViewController
{
    func presentAlert(title : String, message : String , buttonTitle : String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
