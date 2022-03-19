//
//  Style.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

final class HYStyle<V: StylingProp> {
    var props = [V]()
    
    static func with(_ props: V...) -> HYStyle<V> {
        let style = HYStyle<V>()
        style.props = props
        return style
    }
    
    func install(to view: V.T) {
        props.forEach { (prop) in
            prop.bind(to: view)
        }
    }
}

