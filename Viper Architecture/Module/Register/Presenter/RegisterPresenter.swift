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
    
    init(view: RegisterPresenterToViewProtocol, interactor: RegisterPresenterToInteractorProtocol, router: RegisterPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func registerProcess(name: String, email: String, password: String, avatar: String) {
        interactor?.registerProcess(name: name, email: email, password: password, avatar: avatar)
    }
    
}

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    
    func registerSuccess() {
        view?.registerSuccess.accept(())
    }
    
    func registerFailed() {
        view?.registerFailed.accept(())
    }
    
}
