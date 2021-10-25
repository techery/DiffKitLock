//
//  AppDelegate.swift
//  DiffKitLock
//
//  Created by Deszip on 25.10.2021.
//

import UIKit
import AppSpectorSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppSpector.run(with: AppSpectorConfig(apiKey: "ios_YzBjMzY0M2EtZjY2MC00YWVmLTgyMmItMTc0MDdjNWQ3YWU2"))
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

