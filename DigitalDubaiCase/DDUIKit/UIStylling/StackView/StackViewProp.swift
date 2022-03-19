//
//  StackViewProps.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//


import Foundation
import UIKit

enum StackViewProp: StylingProp {
    typealias T = UIStackView
    
    case alignment(_: UIStackView.Alignment)
    case axis(_: NSLayoutConstraint.Axis)
    case distribution(_: UIStackView.Distribution)
    case spacing(_: CGFloat)
    
    func bind(to stackView: UIStackView) {
        switch self {
        case .alignment(let alignment):
            stackView.alignment = alignment
        case .axis(let axis):
            stackView.axis = axis
        case .distribution(let distribution):
            stackView.distribution = distribution
        case .spacing(let space):
            stackView.spacing = space
        }
    }
}
