//
//  TextFieldProp.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 26.02.2022.
//

import Foundation
import UIKit

enum TextFieldProp: StylingProp {
    typealias T = UITextField
    
    case align(_: NSTextAlignment)
    case text(_: String)
    case color(_: UIColor)
    case backgroundColor(_: UIColor)
    case font(_: UIFont)
    case placeholder(_: String)
    
    func bind(to textfield: UITextField) {
        switch self {
        case .align(let align):
            textfield.textAlignment = align
        case .text(let string):
            textfield.text = string
        case .color(let color):
            textfield.textColor = color
        case .backgroundColor(let color):
            textfield.backgroundColor = color
        case .font(let font):
            textfield.font = font
        case .placeholder(let placeholder):
            textfield.placeholder = placeholder
        }
    }
}
