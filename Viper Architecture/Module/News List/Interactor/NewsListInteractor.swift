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
    
    /// Get `Base Endpoint`
    private func getPath() -> String {
        return NewsListBaseEndpoint.getBasePath() + "1/news"
    }
    
    /// - Parameters:
    ///   - source in String for query spesific topic
    func fetchNewsList(source: String) {
        let parameters: [String: Any] = ["q": source, "apikey": Constants.NEWS_API_KEY] /// use key chain for api key later
        
        AF.request(getPath(), parameters: parameters).response { response in
            if response.response?.statusCode == 200 {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    guard let articles = newsResponse.results else { return }
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
