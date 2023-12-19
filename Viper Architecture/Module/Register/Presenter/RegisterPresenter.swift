//
//  RegisterPresenter.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

class RegisterPresenter: RegisterViewToPresenterProtocol {
    var view: RegisterPresenterToViewProtocol?
    var interactor: RegisterPresenterToInteractorProtocol?
    var router: RegisterPresenterToRouterProtocol?
    
    func registerProcess(name: String, email: String, password: String, avatar: String) {
        interactor?.registerProcess(name: name, email: email, password: password, avatar: "https://picsum.photos/800")
    }
}

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    func registerSuccess() {
        view?.registerSuccess()
    }
    
    func registerFailed() {
        view?.registerFailed()
    }
}
