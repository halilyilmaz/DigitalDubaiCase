//
//  HomeCoordinator.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit

protocol HomeCoordinatorDependencies {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
    func makeDetailViewController(actions: DetailViewModelActions, article: ArticleModel) -> DetailViewController
}

final class HomeCoordinator: Coordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: HomeCoordinatorDependencies
    private weak var homeVC: HomeViewController?
    
    init(navigationController: UINavigationController, dependencies: HomeCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = HomeViewModelActions(showArticleDetail: showArticleDetail)
        let vc = dependencies.makeHomeViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: false)
        homeVC = vc
    }
    
    private func showArticleDetail(article: ArticleModel) {
        let actions = DetailViewModelActions()
        let vc = dependencies.makeDetailViewController(actions: actions, article: article)
        navigationController?.pushViewController(vc, animated: true)
    }
}
