//
//  HYLabel.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

final class HYLabel: UILabel {
    var style: LabelStyle = .title {
        didSet {
            style.install(to: self)
        }
    }

    convenience init(style: LabelStyle) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        defer {
            self.style = style
        }
    }

    public func set(props: LabelProp...) -> Self {
        props.forEach { (prop) in
            prop.bind(to: self)
        }
        return self
    }
}
