//
//  NetworkError.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation

enum NetworkError: Error {
    case parametersNil
    case encodingFailed
    case decodingFailed
    case missingURL
    case noData
    case error(model: Error)
    case jsonError(data: Data)
    case badRequest
    
    public var localizedDescription: String {
        switch self {
        case .parametersNil: return "Parameters were nil."
        case .encodingFailed: return "Parameter encoding failed."
        case .missingURL: return "URL is nil."
        case .decodingFailed: return "Model not decoded"
        case .noData: return "No data"
        case .badRequest: return "Bad request"
        case .jsonError(let data): return String(data: data, encoding: .utf8) ?? "JSON Error"
        case .error(let model): return model.localizedDescription
        }
    }
}
