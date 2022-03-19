//
//  UIFont+DigitalDubai.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit

extension UIFont {
    static var dd_largeTitle: UIFont {
        return DDTextStyle.largeTitle.font
    }
    
    static var dd_title1: UIFont {
        return DDTextStyle.title1.font
    }
    
    static var dd_title2: UIFont {
        return DDTextStyle.title2.font
    }
    
    static var dd_title3: UIFont {
        return DDTextStyle.title3.font
    }
    
    static var dd_headline: UIFont {
        return DDTextStyle.headline.font
    }
    
    static var dd_subheadline: UIFont {
        return DDTextStyle.subheadline.font
    }
    
    static var dd_body: UIFont {
        return DDTextStyle.body.font
    }
    
    static var dd_callout: UIFont {
        return DDTextStyle.callout.font
    }
    
    static var dd_footnote: UIFont {
        return DDTextStyle.footnote.font
    }
    
    static var dd_caption1: UIFont {
        return DDTextStyle.caption1.font
    }
    
    static var dd_caption2: UIFont {
        return DDTextStyle.caption2.font
    }
}

public enum DDTextStyle {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case subheadline
    case body
    case callout
    case footnote
    case caption1
    case caption2
}

extension DDTextStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .largeTitle:
            return FontDescription(font: .medium, size: 48, style: .largeTitle)
        case .title1:
            return FontDescription(font: .medium, size: 28, style: .title1)
        case .title2:
            return FontDescription(font: .medium, size: 22, style: .title2)
        case .title3:
            return FontDescription(font: .medium, size: 20, style: .title3)
        case .headline:
            return FontDescription(font: .demiBold, size: 17, style: .headline)
        case .subheadline:
            return FontDescription(font: .medium, size: 15, style: .subheadline)
        case .body:
            return FontDescription(font: .medium, size: 17, style: .body)
        case .callout:
            return FontDescription(font: .medium, size: 16, style: .callout)
        case .footnote:
            return FontDescription(font: .medium, size: 13, style: .footnote)
        case .caption1:
            return FontDescription(font: .medium, size: 12, style: .caption1)
        case .caption2:
            return FontDescription(font: .medium, size: 11, style: .caption2)
        }
    }
}

extension DDTextStyle {
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
            return UIFont.preferredFont(forTextStyle: fontDescription.style)
        }

        let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
        return fontMetrics.scaledFont(for: font)
    }
}

struct FontDescription {
    let font: DDFont
    let size: CGFloat
    let style: UIFont.TextStyle
}

public enum DDFont: String {
    case regular = "Avenir-Regular"
    case demiBold = "Avenir-DemiBold"
    case medium = "Avenir-Medium"
    case heavy = "Avenir-Heavy"

    var name: String {
        return self.rawValue
    }
}
