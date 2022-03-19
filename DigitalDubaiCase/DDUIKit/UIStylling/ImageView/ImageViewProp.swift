//
//  ImageViewProp.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import UIKit

enum ImageViewProp: StylingProp {
    typealias T = UIImageView
    case cornerRadius(_ : CGFloat)
    case clipsToBounds(_: Bool)
    case contentMode(_ : UIView.ContentMode)
    case image(_ : String)
    case template(_ : UIImage, tintColor: UIColor)
    
    func bind(to imageView: UIImageView) {
        switch self {
        case .cornerRadius(let radius):
            imageView.layer.cornerRadius = radius
        case .clipsToBounds(let bound):
            imageView.clipsToBounds = bound
        case .contentMode(let contentMode):
            imageView.contentMode = contentMode
        case .image(let img):
            imageView.image = UIImage(named: img)
        case .template(let img, let tintColor):
            imageView.image = img.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = tintColor
        }
    }
}
