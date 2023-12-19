//
//  RegisterRoute.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

import UIKit

class RegisterRoute: RegisterPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = RegisterViewController()
        var presenter: RegisterViewToPresenterProtocol & RegisterInteractorToPresenterProtocol = RegisterPresenter()
        var interactor: RegisterPresenterToInteractorProtocol = RegisterInteractor()
        let router: RegisterPresenterToRouterProtocol = RegisterRoute()
        
        view.presenter = presenter
        presenter.view = view as? RegisterPresenterToViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
