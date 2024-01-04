//
//  MockRegisterInteractor.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 03/01/2024.
//

import XCTest
import RxSwift
import RxCocoa
@testable import Viper_Architecture

final class MockRegisterInteractor: RegisterPresenterToInteractorProtocol {
    
    var presenter: RegisterInteractorToPresenterProtocol?
    var registerData: RegisterEntity?
    var registerProcessCalled = false
    var result: Observable<RegisterEntity?> = Observable.empty()
    
    func registerProcess(name: String, email: String, password: String, avatar: String) -> Observable<RegisterEntity?> {
        registerProcessCalled = true
        return result
    }
    
}
