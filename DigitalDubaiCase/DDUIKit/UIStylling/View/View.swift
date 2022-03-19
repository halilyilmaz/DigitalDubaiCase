//
//  View.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

final class HYView: UIView {
    private var style: ViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }
    
    convenience init(style: ViewStyle) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        defer {
            self.style = style
        }
    }
    
    func set(props: ViewStyle...) {
        props.forEach { (prop) in
            prop.install(to: self)
        }
    }
}
