//
//  NewsListBaseEndpoint.swift
//  Viper Architecture
//
//  Created by Minata on 21/12/2023.
//

enum NewsListBaseEndpoint {
     static func getBasePath() -> String {
        #if DEBUG
        return "https://newsdata.io/api/"
        #else
        return "https://newsdata.io/api/"
        #endif
    }
}
