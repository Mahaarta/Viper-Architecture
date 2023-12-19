//
//  RegisterPresenterToInteractorProtocol.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

protocol RegisterPresenterToInteractorProtocol: Any {
    
    var presenter: RegisterInteractorToPresenterProtocol? { get set }
    var registerData: RegisterEntity? { get set }
    
    func registerProcess(name: String, email: String, password: String, avatar: String)
    
}
