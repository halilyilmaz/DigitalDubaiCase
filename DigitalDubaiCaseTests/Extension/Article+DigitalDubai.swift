//
//  Article+DigitalDubai.swift
//  DigitalDubaiCaseTests
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
@testable import DigitalDubaiCase

extension ArticleModel {
    static func mock(id: Int, title: String, abstract: String) -> ArticleModel {
        let model = ArticleModel()
        model.id = id
        model.title = title
        model.abstract = abstract
        return model
    }
}
