//
//  LogManager.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation

final class LogManager {
    static func log(_ string: String) {
        #if DEBUG
            print(string)
        #endif
    }
}
