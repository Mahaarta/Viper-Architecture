//
//  MockNetworkManager.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 22/12/2023.
//

import RxSwift
import Alamofire
import Foundation
@testable import Viper_Architecture

struct MockResponse: Codable, Equatable {
    let message: String
}

class MockNetworkManager: NetworkManagerProtocol {
    var shouldSucceed: Bool = true

    func excuteQuery<T>(url: URL, method: HTTPMethod, parameters: Parameters?) -> Observable<T> where T: Codable {
        return Observable.create { observer in
            
            if self.shouldSucceed {
                /// Simulate `Successful Response`
                let mockResponse = MockResponse(message: "Mocked success!")
                do {
                    let encodedData = try JSONEncoder().encode(mockResponse)
                    if let decodedData = try? JSONDecoder().decode(T.self, from: encodedData) {
                        observer.onNext(decodedData)
                        observer.onCompleted()
                    } else {
                        let error = NSError(domain: "MockErrorDomain", code: 42, userInfo: nil)
                        observer.onError(error)
                    }
                } catch {
                    observer.onError(error)
                }
                
            } else {
                /// Simulate `Failure Response`
                let error = NSError(domain: "MockErrorDomain", code: 42, userInfo: nil)
                observer.onError(error)
            }

            return Disposables.create()
        }
    }
}
