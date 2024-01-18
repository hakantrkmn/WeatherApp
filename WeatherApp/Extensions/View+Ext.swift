//
//  View+Ext.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//


import UIKit


extension UIView
{
    func addSubViews(_ views : UIView...)
    {
        for view in views
        {
            addSubview(view)
        }
    }
}

