//
//  RegisterRoute.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

import UIKit

class RegisterRoute: RegisterPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let router = RegisterRoute()
        let view = RegisterViewController()
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
