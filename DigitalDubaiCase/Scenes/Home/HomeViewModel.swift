//
//  HomeViewModel.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import Combine

struct HomeViewModelActions {
    var showArticleDetail: (ArticleModel) -> Void
}

protocol HomeViewModelInput {
    func viewDidLoad()
    func showArticle(indexPath: IndexPath)
    func loadMostPopularArticles(section: PopularArticleSection, period: PopularArticlePeriod)
}

protocol HomeViewModelOutput {
    var cellTypes: [HomeCellType] { get }
    var articleComponentModels: [ArticleComponentModel] { get }
    var selectedArticlePeriod: PopularArticlePeriod { get }
    var selectedArticleSection: PopularArticleSection { get }
}

final class HomeViewModel: HomeViewModelOutput {
    private let networkManager: APIServiceProtocol
    private var actions: HomeViewModelActions?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Outputs
    @Published private(set) var cellTypes: [HomeCellType] = []
    private(set) var articleComponentModels: [ArticleComponentModel] = []
    private(set) var selectedArticlePeriod: PopularArticlePeriod = .one
    private(set) var selectedArticleSection: PopularArticleSection = .all
    
    init(networkManager: APIServiceProtocol, actions: HomeViewModelActions?) {
        self.networkManager = networkManager
        self.actions = actions
    }
    
    private func fetchMostPopularArticles() {
        cellTypes = [.loading]
        networkManager.fetchMostPopularArticles(section: selectedArticleSection, period: selectedArticlePeriod)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    LogManager.log("Error \(error.localizedDescription)")
                    self.cellTypes = [.empty(model: EmptyComponentModel(message: "An error occurred."))]
                case .finished:
                    LogManager.log("Finished")
                }
            } receiveValue: { response in
                LogManager.log("VALUE \(response)")
                self.articleComponentModels = response.results?.compactMap { ArticleComponentModel(article: $0) } ?? []
                if self.articleComponentModels.isEmpty == false {
                    self.cellTypes = self.articleComponentModels.compactMap { _ in return .article }
                } else {
                    self.cellTypes = [.empty(model: EmptyComponentModel(message: "Article doesn't found."))]
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: ViewModel Input
extension HomeViewModel: HomeViewModelInput {
    func viewDidLoad() {
        fetchMostPopularArticles()
    }
    
    func showArticle(indexPath: IndexPath) {
        let model = articleComponentModels[indexPath.row]
        actions?.showArticleDetail(model.article)
    }
    
    func loadMostPopularArticles(section: PopularArticleSection, period: PopularArticlePeriod) {
        selectedArticleSection = section
        selectedArticlePeriod = period
        fetchMostPopularArticles()
    }
}
