//
//  HTTPTask.swift
//  NetworkLayer
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    case requestParametersWithModel(bodyParameter: Encodable,
        urlParameters: Parameters? = nil,
        additionHeaders: HTTPHeaders? = nil)
}

