//
//  MockPresenter.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 27/12/2023.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Viper_Architecture

class MockPresenter: LoginInteractorToPresenterProtocol {
    
    var loginSuccess: Bool?
    var loginError: Error?
    
    func loginSuccess(loginEntity: LoginEntity?) {
        loginSuccess = true
    }
    
    func loginFailed(error: Error) {
        loginError = error
    }
    
}

