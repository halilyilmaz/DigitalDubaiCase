//
//  CollectionViewStyle.swift
//
//  Created by Halil İbrahim YILMAZ on 7.03.2021.
//

import Foundation
import UIKit

public enum CollectionViewStyle {
    case horizontal
    case vertical
    
    private var style: HYStyle<CollectionViewProp> {
        switch self {
        case .horizontal:
            return HYStyle()
        case .vertical:
            return HYStyle()
        }
    }
    
    func install(to collectionView: UICollectionView) {
        style.install(to: collectionView)
    }
}
