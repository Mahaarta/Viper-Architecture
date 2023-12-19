//
//  RegisterViewToPresenterProtocol.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

protocol RegisterViewToPresenterProtocol: Any {
    
    var view: RegisterPresenterToViewProtocol? { get set }
    var interactor: RegisterPresenterToInteractorProtocol? { get set }
    var router: RegisterPresenterToRouterProtocol? { get set }
    
    func registerProcess(name: String, email: String, password: String, avatar: String)
}
