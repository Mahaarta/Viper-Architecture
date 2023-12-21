//
//  LoginPresenter.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import UIKit
import Foundation

class LoginPresenter: LoginViewToPresenterProtocol {
    
    var view: LoginPresenterToViewProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    init(view: LoginPresenterToViewProtocol, interactor: LoginPresenterToInteractorProtocol, router: LoginPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loginProcess(username: String, password: String) {
        interactor?.loginProcess(username: username, password: password)
    }
    
    func navigateToRegister() {
        router?.navigateToRegister(from: view)
    }
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func loginSuccess() {
        view?.loginSuccess.accept(())
    }
    
    func loginFailed() {
        view?.showError.accept(())
    }
}
