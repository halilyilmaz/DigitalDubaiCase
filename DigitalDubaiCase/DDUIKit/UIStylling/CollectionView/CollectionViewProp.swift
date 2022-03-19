//
//  CollectionViewProp.swift
//
//  Created by Halil İbrahim YILMAZ on 25.03.2021.
//

import Foundation
import UIKit

enum CollectionViewProp: StylingProp {
    typealias T = UICollectionView
    
    case background(_ color: UIColor)
    
    func bind(to view: UICollectionView) {
        switch self {
        case .background(let color):
            view.backgroundColor = color
        }
    }
}
