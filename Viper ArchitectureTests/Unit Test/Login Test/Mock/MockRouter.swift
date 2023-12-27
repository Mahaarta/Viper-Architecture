//
//  MockRouter.swift
//  Viper ArchitectureTests
//
//  Created by Minata on 27/12/2023.
//

import UIKit
import XCTest
@testable import Viper_Architecture

class MockRouter: LoginRoute {
    
    var navigateToRegisterCalled = false
    
    override func navigateToRegister(from view: LoginPresenterToViewProtocol?) {
        super.navigateToRegister(from: view)
        navigateToRegisterCalled = true
    }
    
}
