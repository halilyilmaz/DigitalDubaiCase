//
//  LabelStyle.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import UIKit

enum LabelStyle {
    case title
    case body
    case titleWhite
    case description
    case emptyMessage
    
    private var style: HYStyle<LabelProp> {
        switch self {
        case .title:
            return .with(
                .align(.center),
                .color(.black),
                .font(UIFont.dd_title3)
            )
        case .body:
            return .with(.align(.left),
                         .color(.black),
                         .numberOfLines(0),
                         .font(UIFont.dd_body),
                         .backgroundColor(.clear)
            )
        case .titleWhite:
            return .with(
                .align(.left),
                .color(.white),
                .numberOfLines(2),
                .font(UIFont.dd_title3)
            )
        case .description:
            return .with(.align(.left),
                         .color(.black),
                         .font(UIFont.dd_body),
                         .numberOfLines(0)
            )
        case .emptyMessage:
            return .with(.align(.center),
                         .color(.black),
                         .font(UIFont.dd_body),
                         .numberOfLines(0)
            )
        }
    }
    
    func install(to label: UILabel) {
        style.install(to: label)
    }
}
