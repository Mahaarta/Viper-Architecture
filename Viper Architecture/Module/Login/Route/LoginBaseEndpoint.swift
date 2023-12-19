//
//  LoginBaseEndpoint.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

enum LoginBaseEndpoint {
     static func getBasePath() -> String {
        #if DEBUG
        return "https://fakestoreapi.com/"
        #else
        return "https://fakestoreapi.com/"
        #endif
    }
}
