//
//  BaseModel.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation

final class BaseModel<T: Decodable>: Decodable {
    var status: String?
    var num_results: Int?
    var results: T?
}
