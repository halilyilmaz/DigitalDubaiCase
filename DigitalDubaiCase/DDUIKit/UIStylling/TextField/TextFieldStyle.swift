//
//  TextFieldStyle.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 26.02.2022.
//

import Foundation
import UIKit

enum TextFieldStyle {
    case none
    case post(placeholder: String = "")
    
    private var style: HYStyle<TextFieldProp> {
        switch self {
        case .post(let placeholder):
            return .with(
                .align(.center),
                .color(UIColor.black),
                .font(UIFont.dd_title1),
                .placeholder(placeholder)
            )
        case .none:
            return .with(
                .align(.left),
                .color(UIColor.black)
            )
        }
    }
    
    func install(to textField: UITextField) {
        style.install(to: textField)
    }
}
