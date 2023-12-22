//
//  LoginInteractor.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import Foundation
import Alamofire
import RxSwift

class LoginInteractor: LoginPresenterToInteractorProtocol {
    
    var presenter: LoginInteractorToPresenterProtocol?
    var loginSuccess: Bool?
    
    private func getPath() -> String {
        return LoginBaseEndpoint.getBasePath() + "auth/"
    }
    
    func loginProcess(username: String, password: String) -> Observable<LoginEntity?> {
        let endpoint = URL(string: getPath() + "login")!
        let parameters: [String: Any] = ["username": username, "password": password]
        
        let data: Observable<LoginEntity?> = NetworkManager.shared.excuteQueryWithEncoding(url: endpoint, method: .post, parameters: parameters)
        return data
    }
}
