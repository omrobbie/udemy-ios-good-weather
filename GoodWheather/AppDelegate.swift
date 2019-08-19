//
//  AppDelegate.swift
//  GoodWheather
//
//  Created by omrobbie on 19/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appearance = UINavigationBar.appearance()

        appearance.barTintColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1)
        appearance.tintColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        return true
    }
}
