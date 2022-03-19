//
//  UIView+DigitalDubai.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit

extension UIView {
    func edges(to view: UIView, constant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }
    
    func edges(to view: UIView, topConstant: CGFloat = 0, bottomConstant: CGFloat = 0, leadingConstant: CGFloat = 0, trailingConstant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingConstant).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomConstant).isActive = true
    }
    
    func edges(safe view: UIView, topConstant: CGFloat = 0, bottomConstant: CGFloat = 0, leadingConstant: CGFloat = 0, trailingConstant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingConstant).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: trailingConstant).isActive = true
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomConstant).isActive = true
    }
    
    @discardableResult
    func top(to view: UIView, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(to view: UIView, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(to view: UIView, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(to layoutAnchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(equalTo: layoutAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(to layoutAnchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(equalTo: layoutAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(to layoutAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(equalTo: layoutAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(to layoutAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(equalTo: layoutAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(to view: UIView, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(to view: UIView, constant: CGFloat = 0) -> UIView {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(to view: UIView, constant: CGFloat = 0) -> UIView {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
}
