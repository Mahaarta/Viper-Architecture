//
//  LoginRoute.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import UIKit

class LoginRoute: LoginPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = LoginViewController()
        var presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
        var interactor: LoginPresenterToInteractorProtocol = LoginInteractor()
        let router: LoginPresenterToRouterProtocol = LoginRoute()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}
