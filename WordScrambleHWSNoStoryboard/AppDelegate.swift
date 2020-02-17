//
//  AppDelegate.swift
//  WordScrambleHWSNoStoryboard
//
//  Created by Herve Desrosiers on 2020-02-17.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController? // declare the navigationController that will be the entry point of the app
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 1. instantiate a new UIWindow with the size of our phone screen and assign it to the window property.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainVC = ViewController()
        navigationController = UINavigationController(rootViewController: mainVC) // the starting point of the navigation stack is mainVC, an instance of ViewController
        // 2. instantiate the view controller we want to display when the app launches and assign it to the rootViewController property of window
        window?.rootViewController = navigationController // the app's entry point is the navigationController (Is Initial View Controller)
        // 3. make the window “key” and “visible”. Basically telling our app that this is our active window
        window?.makeKeyAndVisible()
        return true
    }


}

