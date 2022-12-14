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

    func test저장안된키워드로검색후_해당이력지움() throws {
        // given
        let interactor = GitHubSearchMainInteractor(worker: .init(db: RecentMemoryDB()))
        let presenter = GitHubSearchMainPresenter()
        let viewControllerMock = GitHubSearchMainViewMock()
        interactor.presenter = presenter
        presenter.viewController = viewControllerMock

        interactor.searchRepositories(request: .init(keyword: "test"))

        // when
        interactor.removeKeyWord(request: .init(keyword: "test"))
        

        // then
        XCTAssertFalse(viewControllerMock.keywords.contains("test"))
    }
    
    func test저장안된키워드로두번검색후_해당이력한개() throws {
        // given
        let interactor = GitHubSearchMainInteractor(worker: .init(db: RecentMemoryDB()))
        let presenter = GitHubSearchMainPresenter()
        let viewControllerMock = GitHubSearchMainViewMock()
        interactor.presenter = presenter
        presenter.viewController = viewControllerMock

        interactor.searchRepositories(request: .init(keyword: "test"))
        interactor.searchRepositories(request: .init(keyword: "test"))

        // when
        interactor.showRecentKeyWord(request: .init(show: true))
        

        // then
        XCTAssertEqual(viewControllerMock.keywords.count, 1)
    }
    
    func test저장안된키워드로여러번검색후_이력다지움() throws {
        // given
        let interactor = GitHubSearchMainInteractor(worker: .init(db: RecentMemoryDB()))
        let presenter = GitHubSearchMainPresenter()
        let viewControllerMock = GitHubSearchMainViewMock()
        interactor.presenter = presenter
        presenter.viewController = viewControllerMock

        interactor.searchRepositories(request: .init(keyword: "test"))
        interactor.searchRepositories(request: .init(keyword: "123"))
        interactor.searchRepositories(request: .init(keyword: "456"))
        interactor.searchRepositories(request: .init(keyword: "화해"))

        // when
        interactor.removeAllKeyWord(request: .init())
        

        // then
        XCTAssertEqual(viewControllerMock.keywords.count, 0)
    }
    
    func test검색하여_검색화면으로이동() throws {
        // given
        let interactor = GitHubSearchMainInteractor(worker: .init(db: RecentMemoryDB()))
        let presenter = GitHubSearchMainPresenter()
        let viewControllerMock = GitHubSearchMainViewMock()
        interactor.presenter = presenter
        presenter.viewController = viewControllerMock

        interactor.searchRepositories(request: .init(keyword: "test1"))

        // when
        interactor.removeAllKeyWord(request: .init())
        
        // then
        XCTAssertEqual(viewControllerMock.searchKeywrd, "test1")
    }
}

class GitHubSearchMainViewMock: GitHubSearchMainDisplayLogic {
    var keywords: [String] = []
    var searchKeywrd = ""
    
    func displayRecentKeyWord(viewModel: GitHubSearchMain.ShowRecentKeyWord.ViewModel) {
        self.keywords = viewModel.keywords
    }
    
    func displaySearchRepositories(viewModel: GitHubSearchMain.SearchRepositories.ViewModel) {
        searchKeywrd = viewModel.keyword
    }
}
