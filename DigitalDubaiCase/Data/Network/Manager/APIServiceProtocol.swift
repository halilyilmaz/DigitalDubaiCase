//
//  APIServiceProtocol.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func fetchMostPopularArticles(section: PopularArticleSection, period: PopularArticlePeriod) -> AnyPublisher<BaseModel<[ArticleModel]>, Error>
}
