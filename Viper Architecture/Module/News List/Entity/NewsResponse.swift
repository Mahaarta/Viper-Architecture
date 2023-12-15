//
//  NewsResponse.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import Foundation

struct NewsResponse: Codable {
    
    let status: String?
    let source: String?
    let sortBy: String?
    let articles: [NewsListEntity]?
    
}
