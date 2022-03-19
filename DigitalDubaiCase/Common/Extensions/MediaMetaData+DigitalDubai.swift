//
//  MediaMetaData+DigitalDubai.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation

extension Array where Element == MediaMetaData {
    func getBiggestImage() -> MediaMetaData? {
        return sorted { $0.width ?? 0 > $1.width ?? 0 }.first
    }
}
