//
//  MediaMetaData.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation

final class MediaMetaData: Decodable {
    var url: String?
    var format: String?
    var height: Int?
    var width: Int?
}
