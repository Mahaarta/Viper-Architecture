//
//  NewsListPresenter.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import Foundation

class NewsListPresenter: NewsListViewToPresenterProtocol {
    
    var view: NewsListPresenterToViewProtocol?
    var interactor: NewsListPresenterToInteractorProtocol?
    var router: NewsListPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchNewsList()
    }
    
    func getNewsListCount() -> Int? {
        interactor?.newsListDatas?.count
    }
    
    func getNewsList(at index: Int) -> NewsListEntity? {
        interactor?.newsListDatas?[index]
    }
}

extension NewsListPresenter: NewsListInteractorToPresenterProtocol {
    
    func newsListFetched() {
        view?.showNewsList()
    }
    
    func newsListFetchedFailed() {
        view?.showError()
    }
    
}
