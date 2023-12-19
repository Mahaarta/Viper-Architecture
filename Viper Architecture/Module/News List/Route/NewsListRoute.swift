//
//  NewsListRoute.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import UIKit

class NewsListRoute: NewsListPresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = NewsListViewController()
        var presenter: NewsListViewToPresenterProtocol & NewsListInteractorToPresenterProtocol = NewsListPresenter()
        var interactor: NewsListPresenterToInteractorProtocol = NewsListInteractor()
        let router: NewsListPresenterToRouterProtocol = NewsListRoute()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}

