//
//  HomeViewModelTests.swift
//  DigitalDubaiCaseTests
//
//  Created by Halil İbrahim Yılmaz on 19.03.2022.
//

@testable import DigitalDubaiCase
import XCTest
import Combine

class HomeViewModelTests: XCTestCase {
    private var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_whenFetchPopularArticleFetchedSuccessful() throws {
        // given
        let mockNetworkManager = APIServiceSuccessMock()
        viewModel = HomeViewModel(networkManager: mockNetworkManager, actions: nil)
        
        // when
        viewModel.viewDidLoad()
        
        let model = try awaitPublisher(mockNetworkManager.fetchMostPopularArticles(section: .all, period: .one))
        
        // then
        XCTAssertEqual(model.results, [ArticleModel.mock(id: 1, title: "", abstract: "")])
        XCTAssertEqual(viewModel.cellTypes.count, 1)
    }
    
    func test_whenFetchPopularArticleFetchedFailed() throws {
        // given
        let mockNetworkManager = APIServiceFailMock()
        viewModel = HomeViewModel(networkManager: mockNetworkManager, actions: nil)
        
        // when
        viewModel.viewDidLoad()
        
        let model = try awaitPublisher(mockNetworkManager.fetchMostPopularArticles(section: .all, period: .one))
        
        // then
        XCTAssertNil(model.results)
        XCTAssertEqual(viewModel.cellTypes, [.empty(model: EmptyComponentModel(message: ""))])
    }
}
