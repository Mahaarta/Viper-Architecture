//
//  NewsListRoute.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import UIKit

class NewsListRoute: NewsListPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let router = NewsListRoute()
        let view = NewsListViewController()
        let interactor = NewsListInteractor()
        let presenter = NewsListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

