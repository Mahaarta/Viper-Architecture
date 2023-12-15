//
//  NewsListInteractor.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import Foundation
import Alamofire

class NewsListInteractor: NewsListPresenterToInteractorProtocol {
    
    var presenter: NewsListInteractorToPresenterProtocol?
    var newsListDatas: [NewsListEntity]?
    
    func fetchNewsList() {
        AF.request(Constants.URL).response { response in
            if response.response?.statusCode == 200 {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    guard let articles = newsResponse.articles else { return }
                    self.newsListDatas = articles
                    self.presenter?.newsListFetched()
                } catch let error {
                    print(error)
                }
                
            } else {
                self.presenter?.newsListFetchedFailed()
            }
        }
    }
    
}
