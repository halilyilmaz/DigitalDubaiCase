//
//  ArticleModel.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation

final class ArticleModel: Decodable {
    var uri: String?
    var url: String?
    var id: Int?
    var asset_id: Int?
    var source: String?
    var published_date: String?
    var updated: String?
    var section: String?
    var subsection: String?
    var nytdsection: String?
    var adx_keywords: String?
    var column: String?
    var byline: String?
    var type: String?
    var title: String?
    var abstract: String?
    var media: [ArticleMedia]?
}

extension ArticleModel: Equatable {
    static func ==(lhs: ArticleModel, rhs: ArticleModel) -> Bool {
        return lhs.id == rhs.id
    }
}
