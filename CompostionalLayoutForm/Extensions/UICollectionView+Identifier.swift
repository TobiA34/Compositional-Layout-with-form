//
//  UICollectionView+Identifier.swift
//  CompostionalLayoutForm
//
//  Created by tobi adegoroye on 16/05/2021.
//

import UIKit

extension UICollectionViewCell {
    
    static var cellId: String {
        String(describing: self)
    }
}
