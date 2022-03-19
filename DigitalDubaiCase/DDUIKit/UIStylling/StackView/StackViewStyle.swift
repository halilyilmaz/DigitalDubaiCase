//
//  StackViewStyle.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

enum StackViewStyle {
    case horizontal(spacing: CGFloat)
    case none
    
    private var style: HYStyle<StackViewProp> {
        switch self {
        case .horizontal(let spacing):
            return .with(
                .alignment(.fill),
                .axis(.horizontal),
                .distribution(.fillProportionally),
                .spacing(spacing)
            )
        default:
            return HYStyle()
        }
    }
    
    func install(to view: UIStackView) {
        style.install(to: view)
    }
}
