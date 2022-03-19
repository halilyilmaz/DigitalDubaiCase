//
//  Button.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

public final class HYButton: UIButton {
    var style: ButtonStyle = .none {
        didSet {
            style.install(to: self)
        }
    }
    
    public convenience init(style: ButtonStyle) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        defer {
            self.style = style
        }
    }
    
    @discardableResult
    func setProps(_ props: ButtonProp...) -> Self {
        props.forEach { $0.bind(to: self) }
        return self
    }
}

