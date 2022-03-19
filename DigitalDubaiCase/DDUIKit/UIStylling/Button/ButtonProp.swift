//
//  ButtonProp.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

enum ButtonProp: StylingProp {
    typealias T = UIButton
    case title(_ title: String)
    case border(_ width: CGFloat)
    case cornerRadius(_ radius: CGFloat)
    case borderColor(_ color: UIColor)
    case backgroundColor(_ color: UIColor)
    case textColor(_ color: UIColor)
    case font(_ font: UIFont)
    case image(_ image: UIImage)
    case hidden(_ isHidden: Bool)
    case leftImage(_ image: UIImage)
    
    func bind(to button: UIButton) {
        switch self {
        case .title(let title):
            button.setTitle(title, for: .normal)
        case .border(let width):
            button.layer.borderWidth = width
        case .cornerRadius(let radius):
            button.layer.cornerRadius = radius
        case .borderColor(let color):
            button.layer.borderColor = color.cgColor
        case .backgroundColor(let color):
            button.backgroundColor = color
        case .textColor(let color):
            button.setTitleColor(color, for: .normal)
        case .font(let font):
            button.titleLabel?.font = font
        case .image(let image):
            button.setImage(image, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        case .hidden(let isHidden):
            button.isHidden = isHidden
        case .leftImage(let image):
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
            button.contentHorizontalAlignment = .leading
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets.left = -90
            button.titleEdgeInsets.left = -140
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
}
