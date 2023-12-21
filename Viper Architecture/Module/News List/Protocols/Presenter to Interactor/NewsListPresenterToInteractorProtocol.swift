//
//  NewsListPresenterToInteractorProtocol.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import Foundation

protocol NewsListPresenterToInteractorProtocol: Any {
 
    var presenter: NewsListInteractorToPresenterProtocol? { get set }
    var newsListDatas: [NewsListEntity]? { get }
    
    func fetchNewsList(source: String)
}
