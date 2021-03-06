//
//  AppDelegate.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        let homeController = HomeController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: homeController)
        
        setupNavigationBar()
        setupStatusBar(application)
        
        return true
    }
    
    private func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = .redNavigationBar
        
        // Remove the shadow below navigation bar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupStatusBar(_ application: UIApplication) {
        application.statusBarStyle = .lightContent
        
        // Exclude iPhone X (status bar height is 44 in Portrait)
        if UIDevice().userInterfaceIdiom == .phone, UIScreen.main.nativeBounds.height == 2436 {
            return
        }
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = .redStatusBar
        window?.addSubview(statusBarBackgroundView)
        statusBarBackgroundView.anchor(window?.topAnchor, left: window?.leftAnchor, bottom: nil, right: window?.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }
}

