//
//  AppDelegate.swift
//  JPTest
//
//  Created by Insu Park on 2020/03/23.
//  Copyright © 2020 INSWAG. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        Application.shared.presentInitialScreen(in: window)
        return true
    }

}

