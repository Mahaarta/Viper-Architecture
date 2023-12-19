//
//  RegisterInteractor.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

import Foundation
import Alamofire

class RegisterInteractor: RegisterPresenterToInteractorProtocol {
    var presenter: RegisterInteractorToPresenterProtocol?
    var registerData: RegisterEntity?
    
    private func getPath() -> String {
        return LoginBaseEndpoint.getBasePath() + "v1/"
    }
    
    func registerProcess(name: String, email: String, password: String, avatar: String) {
        let endpoint = getPath() + "/users"
        let parameters: [String: Any] = ["name": name, "password": password, "email": email, "avatar": avatar]
        
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
                    let registerResponse = try decoder.decode(RegisterEntity.self, from: data)
                    self.registerData = registerResponse
                    self.presenter?.registerSuccess()
                } catch let error {
                    print(error)
                }
                
            } else {
                self.presenter?.registerFailed()
            }
        }
    }
}
