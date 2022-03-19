//
//  ImageViewStyle.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import UIKit

enum ImageViewStyle {
    case rounded(_: CGFloat)
    case normal(contentMode: UIView.ContentMode, image: String)
    case aspectFill
    case aspectFit
    case fill
    case none
    
    private var style: HYStyle<ImageViewProp> {
        switch self {
        case .rounded(let radius):
            return .with(
                .cornerRadius(radius),
                .clipsToBounds(true)
            )
        case .normal(let contentMode, let image):
            return .with(
                .clipsToBounds(true),
                .contentMode(contentMode),
                .image(image)
            )
        case .aspectFill:
            return .with(.contentMode(UIView.ContentMode.scaleAspectFill),
                         .clipsToBounds(true))
        case .aspectFit:
            return .with(.contentMode(UIView.ContentMode.scaleAspectFit))
        case .fill:
            return .with(.contentMode(UIView.ContentMode.scaleToFill))
        case .none:
            return HYStyle()
        }
        
    }
    
    func install(to imageView: UIImageView) {
        style.install(to: imageView)
    }
}
