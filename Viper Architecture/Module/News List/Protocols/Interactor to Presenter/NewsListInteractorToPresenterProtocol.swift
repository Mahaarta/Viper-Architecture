//
//  NewsListInteractorToPresenterProtocol.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import Foundation

protocol NewsListInteractorToPresenterProtocol: Any {
    
    func newsListFetched(newsData: NewsResponse?)
    func newsListFetchedFailed()
    
}
