//
//  RegisterPresenterToViewProtocol.swift
//  Viper Architecture
//
//  Created by Minata on 19/12/2023.
//

import RxSwift
import RxCocoa

protocol RegisterPresenterToViewProtocol: Any {
    
    var registerSuccess: PublishRelay<Void> { get }
    var registerFailed: PublishRelay<Void> { get }
    
}
