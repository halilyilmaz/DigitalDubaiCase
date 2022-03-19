//
//  ViewStyle.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import UIKit

enum ViewStyle {
    case none
    case transparentBackground
    case card
    
    private var style: HYStyle<ViewProp> {
        switch self {
        case .card:
            return .with(
                .backgroundColor(UIColor.white),
                .shadow
            )
        case .transparentBackground:
            return .with(
                .backgroundColor(UIColor.black.withAlphaComponent(0.4))
            )
        default:
            return HYStyle()
        }
    }
    
    func install(to view: UIView) {
        style.install(to: view)
    }
}
