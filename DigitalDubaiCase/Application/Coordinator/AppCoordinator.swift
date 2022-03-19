//
//  AppCoordinator.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let appDependencyContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDependencyContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDependencyContainer = appDependencyContainer
    }
    
    func start() {
        showHome()
    }
    
    private func showHome() {
        let homeDIContainer = appDependencyContainer.makeHomeDIContainer()
        let flow = homeDIContainer.makeHomeFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
