//
//  MockNewsListView.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 28/12/2023.
//

import UIKit
import XCTest
import RxSwift
import RxCocoa
@testable import Viper_Architecture

class MockNewsListView: UIViewController, NewsListPresenterToViewProtocol {
    
    var reloadData = PublishRelay<Void>()
    var showError = PublishRelay<Void>()
    var newsListFetchedCalled = false
    
}
