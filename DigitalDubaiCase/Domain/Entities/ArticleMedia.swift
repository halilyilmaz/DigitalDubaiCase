//
//  ArticleMedia.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation

final class ArticleMedia: Decodable {
    var type: String?
    var subtype: String?
    var caption: String?
    var copyright: String?
    var mediaMetaData: [MediaMetaData]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case mediaMetaData = "media-metadata"
    }
}
