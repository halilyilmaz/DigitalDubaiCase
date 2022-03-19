//
//  AppDIContainer.swift
//  DigitalDubaiCase
//
//  Created by Halil İbrahim Yılmaz on 18.03.2022.
//

import Foundation

final class AppDIContainer {
    private let networkManager = NetworkManager()
    
    // MARK: HomeDI Container
    func makeHomeDIContainer() -> HomeDIContainer {
        return HomeDIContainer(networkManager: networkManager)
    }
}
