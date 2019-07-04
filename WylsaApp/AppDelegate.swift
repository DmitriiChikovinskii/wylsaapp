//
//  AppDelegate.swift
//  WylsaApp
//
//  Created by Dmitrii Space on 2019-06-30.
//  Copyright © 2019 Dmitrii Space. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let context = FeedContext(moduleOutput: nil)
        let container = FeedContainer.assemble(with: context)

        window.rootViewController = container.viewController
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
