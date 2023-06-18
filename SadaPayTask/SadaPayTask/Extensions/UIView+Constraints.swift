//
//  UIView+Constraints.swift
//  SadaPayTask
//
//  Created by Safa Ads on 18/06/2023.
//

import Foundation
import UIKit

extension UIView {
    func pinToEdges(_ view: UIView, constraint: CGFloat = 8) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: constraint),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraint),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraint),
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: constraint)
        ])
    }
}
