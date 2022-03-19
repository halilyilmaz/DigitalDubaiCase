//
//  DigitalDubaiEndPoint.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//  Copyright © 2020 Halil Yılmaz. All rights reserved.
//

import Foundation

enum DigitalDubaiEndPoint {
    case mostPopular(section: PopularArticleSection, period: PopularArticlePeriod)
}

extension DigitalDubaiEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "http://api.nytimes.com/svc") else { fatalError("baseURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .mostPopular(let section, let period): return "mostpopular/" + apiVersion + "/mostviewed/" + section.value + "/" + period.value + ".json"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        default: return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["api-key": Constants.API.apiKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json"]
    }
    
    var apiVersion: String {
        switch self {
        case .mostPopular: return APIVersion.v2.rawValue
        default: return APIVersion.v1.rawValue
        }
    }
}
