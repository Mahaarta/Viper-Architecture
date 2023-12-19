//
//  AppDelegate.swift
//  Viper Architecture
//
//  Created by Minata on 15/12/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let loginView = LoginRoute.createModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = loginView
        window?.makeKeyAndVisible()
        
        return true
    }
}
