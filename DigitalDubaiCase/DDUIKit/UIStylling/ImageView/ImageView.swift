//
//  ImageView.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import UIKit

public final class HYImageView: UIImageView {
    var style: ImageViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }
    
    convenience init(style: ImageViewStyle) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        defer {
            self.style = style
        }
    }
    
    func set(props: ImageViewProp...) -> Self {
        props.forEach { $0.bind(to: self) }
        return self
    }
}
