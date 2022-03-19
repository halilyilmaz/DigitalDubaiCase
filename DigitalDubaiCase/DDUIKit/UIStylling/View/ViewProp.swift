//
//  ViewProp.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//


import Foundation
import UIKit

enum ViewProp: StylingProp {
    typealias T = UIView
    case backgroundColor(_: UIColor)
    case cornerRadius(_ radius: CGFloat)
    case borderColor(_ color: UIColor)
    case clipsToBounds
    case shadow
    
    func bind(to view: UIView) {
        switch self {
        case .backgroundColor(let color):
            view.backgroundColor = color
        case .cornerRadius(let radius):
            view.layer.cornerRadius = radius
        case .borderColor(let color):
            view.layer.borderWidth = 1
            view.layer.borderColor = color.cgColor
        case .clipsToBounds:
            view.clipsToBounds = true
        case .shadow:
            view.layer.shadowOffset = CGSize(width: 0, height: 3)
            view.layer.cornerRadius = 10.0
            view.layer.shadowColor = UIColor.gray.cgColor
            view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            view.layer.shadowRadius = 6.0
            view.layer.shadowOpacity = 0.7
        }
    }
}
