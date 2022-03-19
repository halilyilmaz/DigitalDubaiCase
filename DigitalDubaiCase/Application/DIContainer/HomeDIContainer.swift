//
//  HomeDIContainer.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit

final class HomeDIContainer {
    private weak var navigationController: UINavigationController?
    private let networkManager: APIServiceProtocol
    
    init(networkManager: APIServiceProtocol) {
        self.networkManager = networkManager
    }
    
    // MARK: Flow Coordinators
    func makeHomeFlowCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension HomeDIContainer: HomeCoordinatorDependencies {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        return HomeViewController(viewModel: HomeViewModel(networkManager: networkManager, actions: actions))
    }
    
    func makeDetailViewController(actions: DetailViewModelActions, article: ArticleModel) -> DetailViewController {
        return DetailViewController(viewModel: DetailViewModel(networkManager: networkManager, actions: actions, article: article))
    }
}
