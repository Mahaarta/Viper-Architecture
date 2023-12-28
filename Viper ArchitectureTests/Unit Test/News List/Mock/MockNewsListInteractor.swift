//
//  MockNewsListInteractor.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 28/12/2023.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Viper_Architecture

class MockNewsListInteractor: NewsListPresenterToInteractorProtocol {
    
    var presenter: NewsListInteractorToPresenterProtocol?
    var newsListDatas: [NewsListEntity]?
    var fetchNewsCalled: Bool = false
    var fetchNewsListSource: String?
    var result: Observable<NewsResponse?> = Observable.empty()
    
    func fetchNewsList(source: String) -> Observable<NewsResponse?> {
        fetchNewsCalled = true
        fetchNewsListSource = source
        return result
    }
    
}
