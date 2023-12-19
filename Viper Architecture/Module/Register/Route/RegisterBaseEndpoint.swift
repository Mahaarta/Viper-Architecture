//
//  RegisterBaseEndpoint.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

enum RegisterBaseEndpoint {
     static func getBasePath() -> String {
        #if DEBUG
        return "https://api.escuelajs.co/api/"
        #else
        return "https://api.escuelajs.co/api/"
        #endif
    }
}
