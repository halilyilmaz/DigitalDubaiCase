//
//  LabelProp.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

enum LabelProp: StylingProp {
    typealias T = UILabel
    
    case align(_: NSTextAlignment)
    case text(_: String)
    case color(_: UIColor)
    case backgroundColor(_: UIColor)
    case font(_: UIFont)
    case numberOfLines(_ lines: Int)
    
    func bind(to label: UILabel) {
        switch self {
        case .align(let align):
            label.textAlignment = align
        case .text(let string):
            label.text = string
        case .color(let color):
            label.textColor = color
        case .backgroundColor(let color):
            label.backgroundColor = color
        case .font(let font):
            label.font = font
        case .numberOfLines(let lines):
            label.numberOfLines = lines
        }
    }
}
