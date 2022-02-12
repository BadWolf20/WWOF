//
//  AppDelegate.swift
//  WWOF
//
//  Created by Roman on 15.01.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()

        let navigationController = UINavigationController.init(rootViewController: SignInViewController())
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

