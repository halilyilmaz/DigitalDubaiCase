//
//  StackView.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

final class HYStackView: UIStackView {
    private var style: StackViewStyle = .none {
        didSet {
            style.install(to: self)
        }
    }
    
    convenience init(style: StackViewStyle) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        defer {
            self.style = style
        }
    }
    
    func set(props: StackViewStyle...) {
        props.forEach { (prop) in
            prop.install(to: self)
        }
    }
}
