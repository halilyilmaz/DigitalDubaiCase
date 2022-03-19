//
//  CollectionView.swift
//
//  Created by Halil İbrahim YILMAZ on 7.03.2021.
//

import Foundation
import UIKit
import MagazineLayout

public final class CollectionView: UICollectionView {
    private var style: CollectionViewStyle = .vertical {
        didSet {
            style.install(to: self)
        }
    }
    
    public convenience init(style: CollectionViewStyle) {
        switch style {
        case .horizontal:
            let layout = UICollectionViewFlowLayout()
            self.init(frame: .zero, collectionViewLayout: layout)
            setupHorizontalLayout()
        case .vertical:
            let layout = MagazineLayout()
            self.init(frame: .zero, collectionViewLayout: layout)
        }
        defer {
            self.style = style
        }
        isPrefetchingEnabled = false
        backgroundColor = .white
        contentInsetAdjustmentBehavior = .automatic
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupHorizontalLayout() {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let width = UIScreen.main.bounds.width
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: width, height: 200)
        layout.invalidateLayout()
        collectionViewLayout = layout
    }
    
    func set(props: CollectionViewProp...) {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        collectionViewLayout = layout!
    }
}

