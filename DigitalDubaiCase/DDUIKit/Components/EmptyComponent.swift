//
//  EmptyComponent.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 30.08.2021.
//

import Foundation
import UIKit
import MagazineLayout

final class EmptyComponentModel {
    var message: String
    
    init(message: String) {
        self.message = message
    }
}

final class EmptyComponent: UICollectionViewCell, Reusable {
    private let messageLB = HYLabel(style: .emptyMessage)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        contentView.addSubview(messageLB)
    }
    
    private func setupConstraints() {
        messageLB.edges(to: contentView)
    }
    
    func configure(model: EmptyComponentModel) {
        messageLB.text = model.message
    }
}

extension EmptyComponent: MagazineLayoutable {
    static func itemSizeMode() -> MagazineLayoutItemSizeMode {
        return MagazineLayoutItemSizeMode(widthMode: .fullWidth(respectsHorizontalInsets: false), heightMode: .static(height: 300))
    }
}
