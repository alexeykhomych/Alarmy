//
//  AppDelegate.swift
//  Alarmy
//
//  Created by Alexey Khomych on 4/25/17.
//  Copyright © 2017 Alexey Khomych. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.sharedManager().enable = true
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let navigationController = UINavigationController(rootViewController: AlarmListViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
}
