//
//  NewsListPresenterTest.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 28/12/2023.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Viper_Architecture

final class NewsListPresenterTest: XCTestCase {

    var disposeBag: DisposeBag!
    
    override func setUp() {
        disposeBag = DisposeBag()
    }
    
    func testFetchNewsListSuccess() {
        let mockView = MockNewsListView()
        let router = NewsListRoute()
        let mockInteractor = MockNewsListInteractor()
        let presenter = NewsListPresenter(view: mockView, interactor: mockInteractor, router: router)
        
        presenter.updateView(source: "tech")
        
        XCTAssertTrue(mockInteractor.fetchNewsCalled)
        XCTAssertEqual(mockInteractor.fetchNewsListSource, "tech")
    }

}
