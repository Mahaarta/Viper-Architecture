//
//  RegisterPresenterTest.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 03/01/2024.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
@testable import Viper_Architecture

final class RegisterPresenterTest: XCTestCase {

    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    func testRegisterSuccess() {
        let route = RegisterRoute()
        let mockView = MockRegisterView()
        let interactor = MockRegisterInteractor()
        let presenter = RegisterPresenter(view: mockView, interactor: interactor, router: route)
        
        let registerEntity = RegisterEntity(
            id: 0,
            name: "mock name", 
            role: "mock role", 
            email: "mockEmail@mail.com",
            avatar: "https://mock-image.png",
            password: "mock password",
            updatedAt: "2024-01-01",
            creationAt: "2024-01-01"
        )
        
        let testScheduler = scheduler
        let registerSuccessRelay = PublishRelay<Void>()
        mockView.registerSuccess = registerSuccessRelay
        
        interactor.registerData = registerEntity
        presenter.registerProcess(name: "mock name", email: "mockEmail@mail.com", password: "mockPassword", avatar: "https://mock-avatar.png")
        mockView.viewDidLoad()
        
        testScheduler?.start()
        
        XCTAssertTrue(interactor.registerProcessCalled)
        XCTAssertTrue(mockView.registerSuccessCalled)
    }

}
