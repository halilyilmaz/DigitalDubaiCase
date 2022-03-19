//
//  ButtonStyle.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import UIKit

public enum ButtonStyle {
    case none
    case primary
    case secondary
    
    private var style: HYStyle<ButtonProp> {
        switch self {
        case .none:
            return .with(
                .textColor(.blue)
                )
        case .primary:
            return .with(
                .cornerRadius(8),
                .backgroundColor(UIColor.DD_Yellow),
                .textColor(.black)
            )
        case .secondary:
            return .with(
                .backgroundColor(UIColor.clear)
            )
        }
    }
    
    func install(to label: UIButton) {
        style.install(to: label)
    }
}
