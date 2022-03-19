//
//  ArticleComponent.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit
import MagazineLayout
import Kingfisher

final class ArticleComponentModel {
    var article: ArticleModel
    var photoUrl: URL?
    var title: String
    
    init(article: ArticleModel) {
        self.article = article
        self.photoUrl = URL(string: article.media?.first?.mediaMetaData?.getBiggestImage()?.url ?? "")
        self.title = article.title ?? ""
    }
}

final class ArticleComponent: UICollectionViewCell, Reusable {
    private let articleIV: HYImageView = HYImageView(style: .aspectFill)
    private let nameLB: HYLabel = HYLabel(style: .titleWhite)
    private let transparentBackgroundView = HYView(style: .transparentBackground)
    private let descriptionLB: HYLabel = HYLabel(style: .description)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        [articleIV, transparentBackgroundView].forEach {
            contentView.addSubview($0)
        }
        
        [nameLB, descriptionLB].forEach {
            transparentBackgroundView.addSubview($0)
        }
    }
    
    private func setupContraints() {
        articleIV
            .edges(to: contentView)
        
        transparentBackgroundView
            .leading(to: contentView)
            .trailing(to: contentView)
            .bottom(to: contentView)
            .height(constant: Constants.UI.defaultHeight)
        
        descriptionLB
            .leading(to: contentView, constant: Constants.UI.defaultLeadingPadding)
            .top(to: contentView, constant: 12)
        
        nameLB
            .leading(to: transparentBackgroundView, constant: Constants.UI.defaultLeadingPadding)
            .trailing(to: transparentBackgroundView, constant: -Constants.UI.defaultLeadingPadding)
            .top(to: transparentBackgroundView)
            .bottom(to: transparentBackgroundView)
    }
    
    func configure(model: ArticleComponentModel) {
        articleIV.kf.setImage(with: model.photoUrl)
        nameLB.text = model.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleIV.image = nil
        nameLB.text = ""
        descriptionLB.text = ""
    }
}

extension ArticleComponent: MagazineLayoutable {
    static func itemSizeMode() -> MagazineLayoutItemSizeMode {
        return MagazineLayoutItemSizeMode.init(widthMode: .fullWidth(respectsHorizontalInsets: false), heightMode: .static(height: 250))
    }
}
