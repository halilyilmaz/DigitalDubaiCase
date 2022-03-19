//
//  NetworkManager.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 29.08.2021.
//

import Foundation
import Combine

final class NetworkManager: APIServiceProtocol {
    private var cancellable = Set<AnyCancellable>()
    private let session = URLSession(configuration: .default)
    private let router = Router<DigitalDubaiEndPoint>()
    private let decoder = JSONDecoder()
    
    init() { }
    
    func fetchMostPopularArticles(section: PopularArticleSection = .all, period: PopularArticlePeriod = .one) -> AnyPublisher<BaseModel<[ArticleModel]>, Error> {
        return fetch(endpoint: .mostPopular(section: section, period: period))
    }
    
    private func fetch<T: Decodable>(endpoint: DigitalDubaiEndPoint) -> AnyPublisher<T, Error> {
        do {
            let request = try router.buildRequest(from: endpoint)
            
            return session.dataTaskPublisher(for: request)
                .subscribe(on: DispatchQueue.global())
                .receive(on: DispatchQueue.main)
                .validateStatusCode { (200..<300).contains($0) }
                .mapJsonValueBaseModel(to: T.self, decoder: decoder)
                .eraseToAnyPublisher()
        } catch {
            return Fail(outputType: T.self, failure: NetworkError.badRequest).eraseToAnyPublisher()
        }
    }
}
