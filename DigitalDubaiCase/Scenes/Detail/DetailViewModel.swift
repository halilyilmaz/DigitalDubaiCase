//
//  DetailViewModel.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

import Foundation
import Combine

struct DetailViewModelActions {
    
}

protocol DetailViewModelInput {
    func viewDidLoad()
}

protocol DetailViewModelOutput {
    var cellTypes: [DetailCellType] { get }
    var articleComponentModels: [ArticleComponentModel] { get }
    var articleComponentModel: ArticleComponentModel { get }
    var articleBodyComponentModel: ArticleBodyComponentModel { get }
}

final class DetailViewModel: DetailViewModelOutput {
    private let networkManager: APIServiceProtocol
    private let actions: DetailViewModelActions
    private let article: ArticleModel
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Outputs
    @Published private(set) var cellTypes: [DetailCellType] = []
    private(set) var articleComponentModels: [ArticleComponentModel] = []
    private(set) var articleComponentModel: ArticleComponentModel
    private(set) var articleBodyComponentModel: ArticleBodyComponentModel
    
    init(networkManager: APIServiceProtocol, actions: DetailViewModelActions, article: ArticleModel) {
        self.networkManager = networkManager
        self.actions = actions
        self.article = article
        self.articleComponentModel = ArticleComponentModel(article: article)
        self.articleBodyComponentModel = ArticleBodyComponentModel(article: article)
    }
    
    private func loadData() {
        cellTypes = [.header, .body]
    }
}

// MARK: ViewModel Input
extension DetailViewModel: DetailViewModelInput {
    func viewDidLoad() {
        loadData()
    }
}
