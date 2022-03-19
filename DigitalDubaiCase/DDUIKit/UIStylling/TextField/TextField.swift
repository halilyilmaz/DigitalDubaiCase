//
//  TextField.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 26.02.2022.
//

import Foundation
import UIKit

final class HYTextField: UITextField {
    
    var style: TextFieldStyle = .none {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: TextFieldStyle) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        defer {
            self.style = style
        }
    }

    public func set(props: TextFieldProp...) -> Self {
        props.forEach { (prop) in
            prop.bind(to: self)
        }
        return self
    }
}
