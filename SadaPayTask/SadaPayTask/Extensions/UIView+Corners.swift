//
//  UIView+RoundedCorners.swift
//  SadaPayTask
//
//  Created by Safa Ads on 18/06/2023.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
    
    func addBorders(color: CGColor,
                    borderWidth: CGFloat = 1,
                    radius: CGFloat) {
        layer.borderColor = color
        layer.borderWidth = borderWidth
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
