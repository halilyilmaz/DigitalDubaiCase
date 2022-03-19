//
//  StylingProp.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import UIKit

protocol StylingProp {
    associatedtype T: UIView
    func bind(to view: T)
}
