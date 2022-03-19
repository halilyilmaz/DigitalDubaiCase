//
//  LoadingComponent.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import UIKit
import MagazineLayout

final class LoadingComponentModel {
    var isLoading: Bool
    
    init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}

final class LoadingComponent: UICollectionViewCell, Reusable {
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        activityIndicator.centerX(to: contentView)
        activityIndicator.centerY(to: contentView)
    }
    
    func configure(model: LoadingComponentModel) {
        if model.isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension LoadingComponent: MagazineLayoutable {
    static func itemSizeMode() -> MagazineLayoutItemSizeMode {
        return MagazineLayoutItemSizeMode(widthMode: .fullWidth(respectsHorizontalInsets: false), heightMode: .static(height: 300))
    }
}
