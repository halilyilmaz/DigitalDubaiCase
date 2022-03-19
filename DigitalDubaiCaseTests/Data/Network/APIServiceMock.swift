//
//  APIServiceMock.swift
//  DigitalDubaiCaseTests
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
@testable import DigitalDubaiCase
import Combine

final class APIServiceSuccessMock: APIServiceProtocol {
    func fetchMostPopularArticles(section: PopularArticleSection, period: PopularArticlePeriod) -> AnyPublisher<BaseModel<[ArticleModel]>, Error> {
        let model = BaseModel<[ArticleModel]>()
        model.results = [ArticleModel.mock(id: 1, title: "Title 1", abstract: "Abstract 1")]
        
        return Just(model)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

final class APIServiceFailMock: APIServiceProtocol {
    func fetchMostPopularArticles(section: PopularArticleSection, period: PopularArticlePeriod) -> AnyPublisher<BaseModel<[ArticleModel]>, Error> {
        let model = BaseModel<[ArticleModel]>()
        
        return Just(model)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
