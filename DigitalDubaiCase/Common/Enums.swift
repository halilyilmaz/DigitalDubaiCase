//
//  Enums.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation

enum HomeCellType {
    case article
    case loading
    case empty(model: EmptyComponentModel)
}

extension HomeCellType: Equatable {
    static func ==(lhs: HomeCellType, rhs: HomeCellType) -> Bool {
        switch (lhs, rhs) {
        case (.article, .article): return true
        case (.loading, .loading): return true
        case (.empty, .empty): return true
        default: return false
        }
    }
}

enum DetailCellType {
    case header
    case body
}

enum PopularArticleSection: CaseIterable {
    case all
    case sports
    
    var value: String {
        switch self {
        case .all: return "all-sections"
        case .sports: return "sports"
        }
    }
}

enum PopularArticlePeriod: CaseIterable {
    case one
    case seven
    case thirty
    
    var value: String {
        switch self {
        case .one: return "1"
        case .seven: return "7"
        case .thirty: return "30"
        }
    }
}

enum APIVersion: String {
    case v1 = "v1"
    case v2 = "v2"
}
