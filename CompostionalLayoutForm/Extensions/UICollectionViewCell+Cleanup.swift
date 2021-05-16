//
//  UICollectionViewCell+Cleanup.swift
//  CompostionalLayoutForm
//
//  Created by tobi adegoroye on 16/05/2021.
//

import UIKit

extension UICollectionViewCell {
    
    func removeViews() {
        contentView.subviews.forEach{ $0.removeFromSuperview() }
    }
}
