//
//  ArticleBodyComponent.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import UIKit
import MagazineLayout
import Kingfisher

final class ArticleBodyComponentModel {
    var article: ArticleModel
    var description: String
    
    init(article: ArticleModel) {
        self.article = article
        self.description = article.abstract ?? ""
    }
}

final class ArticleBodyComponent: UICollectionViewCell, Reusable {
    private let descriptionLB: HYLabel = HYLabel(style: .body)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        [descriptionLB].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupContraints() {
        descriptionLB.edges(to: contentView, constant: Constants.UI.defaultPadding)
    }
    
    func configure(model: ArticleBodyComponentModel) {
        descriptionLB.text = model.description
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLB.text = ""
    }
}

extension ArticleBodyComponent: MagazineLayoutable {
    static func itemSizeMode() -> MagazineLayoutItemSizeMode {
        return MagazineLayoutItemSizeMode.init(widthMode: .fullWidth(respectsHorizontalInsets: false), heightMode: .dynamic)
    }
}
