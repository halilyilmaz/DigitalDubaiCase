//
//  URLRequest+DigitalDubai.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 26.02.2022.
//

import Foundation

extension URLRequest {
    mutating func encoded(encodable: Encodable, encoder: JSONEncoder = JSONEncoder()) throws -> URLRequest {
        do {
            let encodable = AnyEncodable(encodable)
            httpBody = try encoder.encode(encodable)
            
            let contentTypeHeaderName = "Content-Type"
            if value(forHTTPHeaderField: contentTypeHeaderName) == nil {
                setValue("application/json", forHTTPHeaderField: contentTypeHeaderName)
            }
            
            return self
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
