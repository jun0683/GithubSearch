//
//  GithubSearchTests.swift
//  GithubSearchTests
//
//  Created by hongjunkim on 2022/10/13.
//

import XCTest
@testable import GithubSearch

class GithubSearchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test저장안된키워드로검색후_최근이력에있음() throws {
        // given
        let interactor = GitHubSearchMainInteractor(worker: .init(db: RecentMemoryDB()))
        let presenter = GitHubSearchMainPresenter()
        let viewControllerMock = GitHubSearchMainViewMock()
        interactor.presenter = presenter
        presenter.viewController = viewControllerMock

        interactor.searchRepositories(request: .init(keyword: "test"))

        // when
        interactor.showRecentKeyWord(request: .init(show: true))
        

        // then
        XCTAssertTrue(viewControllerMock.keywords.contains("test"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class GitHubSearchMainViewMock: GitHubSearchMainDisplayLogic {
    var keywords: [String] = []
    
    func displayRecentKeyWord(viewModel: GitHubSearchMain.ShowRecentKeyWord.ViewModel) {
        self.keywords = viewModel.keywords
    }
    
    func displaySearchRepositories(viewModel: GitHubSearchMain.SearchRepositories.ViewModel) {
        
    }
}
