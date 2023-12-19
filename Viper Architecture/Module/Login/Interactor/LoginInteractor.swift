//
//  LoginInteractor.swift
//  Viper Architecture
//
//  Created by Minata on 18/12/2023.
//

import Foundation
import Alamofire

class LoginInteractor: LoginPresenterToInteractorProtocol {
    
    var presenter: LoginInteractorToPresenterProtocol?
    var loginSuccess: Bool?
    
    private func getPath() -> String {
        return LoginBaseEndpoint.getBasePath() + "auth/"
    }
    
    func loginProcess(username: String, password: String) {
        let endpoint = getPath() + "login"
        let parameters: [String: Any] = ["username": username, "password": password]
        
        AF.request(
            endpoint,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        ).response { response in
            
            if response.response?.statusCode == 200 {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let loginResponse = try decoder.decode(LoginEntity.self, from: data)
                    guard let _ = loginResponse.token else { return }
                    self.presenter?.loginSuccess()
                } catch let error {
                    print(error)
                }
                
            } else {
                self.presenter?.loginFailed()
            }
        }
    }
}
